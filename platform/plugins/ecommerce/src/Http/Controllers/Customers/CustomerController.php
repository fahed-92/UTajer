<?php

namespace Botble\Ecommerce\Http\Controllers\Customers;

use Assets;
use Botble\Base\Events\CreatedContentEvent;
use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Events\UpdatedContentEvent;
use Botble\Base\Forms\FormBuilder;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Ecommerce\Forms\CustomerForm;
use Botble\Ecommerce\Http\Requests\AddCustomerWhenCreateOrderRequest;
use Botble\Ecommerce\Http\Requests\CustomerCreateRequest;
use Botble\Ecommerce\Http\Requests\CustomerEditRequest;
use Botble\Ecommerce\Http\Requests\CustomerUpdateEmailRequest;
use Botble\Ecommerce\Repositories\Interfaces\AddressInterface;
use Botble\Ecommerce\Repositories\Interfaces\CustomerInterface;
use Botble\Ecommerce\Tables\CustomerTable;
use Exception;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\Request;
use Illuminate\View\View;
use Botble\Ecommerce\Models\Product;
use Botble\Ecommerce\Models\ProductFav;
use Botble\Ecommerce\Models\Customer;
use Botble\Ecommerce\Models\Cart;
use Botble\Ecommerce\Models\Faq;
use Botble\Ecommerce\Models\Contact;
use Botble\Ecommerce\Models\Address;
use Botble\Ecommerce\Models\UserCardDetails;
use Throwable;

class CustomerController extends BaseController
{

    /**
     * @var CustomerInterface
     */
    protected $customerRepository;

    /**
     * @var AddressInterface
     */
    protected $addressRepository;

    /**
     * @param CustomerInterface $customerRepository
     * @param AddressInterface $addressRepository
     */
    public function __construct(CustomerInterface $customerRepository, AddressInterface $addressRepository)
    {
        $this->customerRepository = $customerRepository;
        $this->addressRepository = $addressRepository;
    }

    /**
     * @param CustomerTable $dataTable
     * @return Factory|View
     * @throws Throwable
     */
    public function index(CustomerTable $dataTable)
    {
        page_title()->setTitle(trans('plugins/ecommerce::customer.name'));

        return $dataTable->renderTable();
    }

    /**
     * @param FormBuilder $formBuilder
     * @return string
     */
    public function create(FormBuilder $formBuilder)
    {
        page_title()->setTitle(trans('plugins/ecommerce::customers.create'));

        Assets::addScriptsDirectly('vendor/core/plugins/ecommerce/js/customer.js');

        return $formBuilder->create(CustomerForm::class)->remove('is_change_password')->renderForm();
    }

    /**
     * @param CustomerCreateRequest $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function store(CustomerCreateRequest $request, BaseHttpResponse $response)
    {
        // dd($request);
        $request->merge(['password' => bcrypt($request->input('password'))]);
        $request->merge(['dob' => date('Y-m-d', strtotime($request->input('dob')))]);
        $customer = $this->customerRepository->createOrUpdate($request->input());

        event(new CreatedContentEvent(CUSTOMER_MODULE_SCREEN_NAME, $request, $customer));

        $request->request->add(['title' => '', 'customer_id' => $customer->id, 'is_default' => 1, 'type' => Address::AddressShipping]);
        $address = $this->addressRepository->createOrUpdate($request->input());

        return $response
            ->setPreviousUrl(route('customers.index'))
            ->setNextUrl(route('customers.edit', $customer->id))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    /**
     * @param int $id
     * @return string
     */
    public function edit($id, FormBuilder $formBuilder)
    {
        Assets::addScriptsDirectly('vendor/core/plugins/ecommerce/js/customer.js');

        $customer = $this->customerRepository->findOrFail($id);
        page_title()->setTitle(trans('plugins/ecommerce::customers.edit', ['name' => $customer->name]));

        $addresses = $this->addressRepository->allBy(['customer_id' => $id])->toArray();
        if($addresses){
            $customer->address = $addresses[0]['address'];        
            $customer->city = $addresses[0]['city'];        
            $customer->zip_code = $addresses[0]['zip_code'];        
            $customer->country = $addresses[0]['country'];        
        }
        
        $customer->password = null;

        return $formBuilder->create(CustomerForm::class, ['model' => $customer])->renderForm();
    }

    /**
     * @param int $id
     * @param CustomerEditRequest $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function update($id, CustomerEditRequest $request, BaseHttpResponse $response)
    {
        $request->merge(['dob' => date('Y-m-d', strtotime($request->input('dob')))]);
        if ($request->input('is_change_password') == 1) {
            $request->merge(['password' => bcrypt($request->input('password'))]);
            $data = $request->input();
        } else {
            $data = $request->except('password');
        }

        $customer = $this->customerRepository->createOrUpdate($data, ['id' => $id]);

        $request->request->add(['title' => '', 'customer_id' => $id]);
        $address = $this->addressRepository->createOrUpdate($request->input(),  ['customer_id' => $id]);

        event(new UpdatedContentEvent(CUSTOMER_MODULE_SCREEN_NAME, $request, $customer));

        return $response
            ->setPreviousUrl(route('customers.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    /**
     * @param Request $request
     * @param int $id
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function destroy(Request $request, $id, BaseHttpResponse $response)
    {
        try {
            $customer = $this->customerRepository->findOrFail($id);
            $this->customerRepository->delete($customer);
            event(new DeletedContentEvent(CUSTOMER_MODULE_SCREEN_NAME, $request, $customer));

            return $response->setMessage(trans('core/base::notices.delete_success_message'));
        } catch (Exception $exception) {
            return $response
                ->setError()
                ->setMessage($exception->getMessage());
        }
    }

    /**
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     * @throws Exception
     */
    public function deletes(Request $request, BaseHttpResponse $response)
    {
        $ids = $request->input('ids');
        if (empty($ids)) {
            return $response
                ->setError()
                ->setMessage(trans('core/base::notices.no_select'));
        }

        foreach ($ids as $id) {
            $customer = $this->customerRepository->findOrFail($id);
            $this->customerRepository->delete($customer);
            event(new DeletedContentEvent(CUSTOMER_MODULE_SCREEN_NAME, $request, $customer));
        }

        return $response->setMessage(trans('core/base::notices.delete_success_message'));
    }

    /**
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function getListCustomerForSelect(BaseHttpResponse $response)
    {
        $customers = $this->customerRepository
            ->allBy([], [], ['id', 'name'])
            ->toArray();

        return $response->setData($customers);
    }

    /**
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function getListCustomerForSearch(Request $request, BaseHttpResponse $response)
    {
        $customers = $this->customerRepository
            ->getModel()
            ->where('name', 'LIKE', '%' . $request->input('keyword') . '%')
            ->simplePaginate(5);

        foreach ($customers as &$customer) {
            $customer->avatar_url = (string)$customer->avatar_url;
        }

        return $response->setData($customers);
    }

    /**
     * @param int $id
     * @param CustomerUpdateEmailRequest $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function postUpdateEmail($id, CustomerUpdateEmailRequest $request, BaseHttpResponse $response)
    {
        $this->customerRepository->createOrUpdate(['email' => $request->input('email')], ['id' => $id]);

        return $response->setMessage(trans('core/base::notices.update_success_message'));
    }

    /**
     * @param int $id
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function getCustomerAddresses($id, BaseHttpResponse $response)
    {
        $addresses = $this->addressRepository->allBy(['customer_id' => $id]);

        return $response->setData($addresses);
    }

    /**
     * @param int $id
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function getCustomerOrderNumbers($id, BaseHttpResponse $response)
    {
        $customer = $this->customerRepository->findById($id);
        if (!$customer) {
            return $response->setData(0);
        }

        return $response->setData($customer->orders()->count());
    }

    /**
     * @param AddCustomerWhenCreateOrderRequest $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function postCreateCustomerWhenCreatingOrder(
        AddCustomerWhenCreateOrderRequest $request,
        BaseHttpResponse $response
    ) {
        $request->merge(['password' => bcrypt(time())]);
        $customer = $this->customerRepository->createOrUpdate($request->input());
        $customer->avatar = (string)$customer->avatar_url;

        event(new CreatedContentEvent(CUSTOMER_MODULE_SCREEN_NAME, $request, $customer));

        $request->merge([
            'customer_id' => $customer->id,
            'is_default'  => true,
        ]);

        $address = $this->addressRepository->createOrUpdate($request->input());

        return $response
            ->setData(compact('address', 'customer'))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    public function userWishList(){
        $input = request()->all();
        $customer = Customer::where('id', $input['user_id'])->first();
        if($customer) {
            $fav_data = ProductFav::where('user_id',$input['user_id'])->where('is_fav',1)->get();
            if(!empty($fav_data)) {
                foreach ($fav_data as $key => $value) {
                    $ProductDetail = Product::where('id',$value['product_id'])->first();
                    $ProductDetail->short_description = "abcj";
                    $ProductDetail->description = strip_tags($ProductDetail->description);
                    $product_images = [];
                    foreach($ProductDetail->images as $iKey => $iValues) {
                        $product_images[$iKey] = "http://15.184.143.70/storage/".$iValues;
                    }

                    $ProductDetail->app_image = $product_images;
                    $ProductDetail->fav = true;
                    $fav_data[$key] = $ProductDetail;
                }
            }
            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.Wishlist'), $fav_data);
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function userCartList(){
        $input = request()->all();
        $customer = Customer::where('id', $input['user_id'])->first();
	 if($customer) {
            $cart_data = Cart::where('user_id',$input['user_id'])->get();
            if(!empty($cart_data)) {
                foreach ($cart_data as $key => $value) {
                    $ProductDetail = Product::where('id',$value['product_id'])->first();
                    $ProductDetail->short_description = "product added in cartlist";
                    $ProductDetail->description = strip_tags($ProductDetail->description);
                    $product_images = [];
                    foreach($ProductDetail->images as $iKey => $iValues) {
                        $product_images[$iKey] = "http://15.184.143.70/storage/".$iValues;
                    }

                    $ProductDetail->app_image = $product_images;
                    $fav_data = ProductFav::where('product_id',$value['product_id'])->where('user_id',$input['user_id'])->first();
                    if(!empty($fav_data)) {
                        if($fav_data->is_fav == 1) {
                            $ProductDetail->fav = true;
                        } else {
                            $ProductDetail->fav = false;
                        }
                    } else {
                        $ProductDetail->fav = false;
                    }
                    $cart_data[$key]['product_data'] = $ProductDetail;
                }
            }
            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.CartList'), $cart_data);
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function faq(){
        $input = request()->all();
        $customer = Customer::where('id', $input['user_id'])->first();
        if($customer) {
            $faq = Faq::where('status','published')->get();
            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.FAQ'), $faq);
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function contact_us(){
        $input = request()->all();
        $customer = Customer::where('email', $input['email'])->first();
        if($customer) {
            $customerAddress = Address::where(['email' => $input['email'],'type'=> 2])->first();
            $contactData['name'] = $customer->name;
            $contactData['phone'] = $customer->phone;
            $contactData['email'] = $input['email'];
            $contactData['subject'] = $input['subject'];
            $contactData['content'] = $input['content'];
            $contactData['address'] = "";
            if(!empty($customerAddress)) {
                $contactData['address'] = $customerAddress->address;
            }
            $contact = Contact::create($contactData);
            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.Contact'));
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function addUserCardDetails(Request $request) {
        $input = request()->all();
        $customer = Customer::where(['id'=> $input['user_id']])->first();
        if($customer) {
            $userCardDetails = UserCardDetails::create($input);
            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.AddUserCardDetails'));
            
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function editUserCardDetails(Request $request) {
        $input = request()->all();
        $customer = Customer::where(['id'=> $input['user_id']])->first();
        if($customer) {
            $userCardDetails = UserCardDetails::where(['id'=> $input['card_id']])->first();
            if(!empty($userCardDetails)) {
                $userCardDetails->update($input);
            }
            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.UpdateUserCardDetails'));

        }else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function deleteUserCardDetails(Request $request) {
        $input = request()->all();
        $customer = Customer::where(['id'=> $input['user_id']])->first();
        if($customer) {
            $userCardDetails = UserCardDetails::where(['id'=> $input['card_id']])->first();
            if(!empty($userCardDetails)) {
                if($userCardDetails->is_default == 1) {
			 $userCardDetails->delete();

           	 	$setDefault = UserCardDetails::where(['user_id'=> $input['user_id']])->first();
			if($setDefault){
                    		$setDefault->is_default = 1;
                   		 $setDefault->save();
			}
                }else{
			$userCardDetails->delete();
		}
 		return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.DeleteUserCardDetails'));
            }
		else{
			return  returnResponse("Card does not exists");
		}
            
        }else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function listUserCardDetails(Request $request) {
        $input = request()->all();
        $customer = Customer::where(['id'=> $input['user_id']])->first();
        if($customer) {
            $userCardDetails = UserCardDetails::where(['user_id'=> $input['user_id']])->get();
            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.ListUserCardDetails'),$userCardDetails);
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function addDefaultUserCardDetails(Request $request) {
        $input = request()->all();
        $customer = Customer::where(['id'=> $input['user_id']])->first();
        if($customer) {
            
            $userCardDetails = UserCardDetails::where(['user_id'=> $input['user_id']])->get();
            foreach ($userCardDetails as $key => $value) {
                $userCardDetailsData = UserCardDetails::where(['id'=> $value['id']])->first();
                if($value['id'] == $input['card_id']) {
                    $userCardDetailsData->is_default = 1;
                } else {
                    $userCardDetailsData->is_default = 0;
                }
                $userCardDetailsData->save();
            }
            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.ChangeDefaultUserCardDetails'));
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

}
