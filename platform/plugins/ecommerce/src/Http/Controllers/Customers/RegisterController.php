<?php

namespace Botble\Ecommerce\Http\Controllers\Customers;

use App\Http\Controllers\Controller;
use Botble\ACL\Traits\RegistersUsers;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Ecommerce\Models\Customer;
use Botble\Ecommerce\Models\Address;
use Botble\Ecommerce\Repositories\Interfaces\AddressInterface;
use Botble\Ecommerce\Repositories\Interfaces\CustomerInterface;
use Botble\Marketplace\Models\Store;
use EmailHandler;
use Illuminate\Auth\Events\Registered;
use Illuminate\Contracts\Auth\StatefulGuard;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\View\View;
use Response;
use SeoHelper;
use SlugHelper;
use Theme;
use URL;
use Hash;
use RvMedia;
use Botble\Ecommerce\Helpers\Common;
use Botble\Ecommerce\Models\MailOtp;
use Illuminate\Contracts\Auth\PasswordBroker;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Password;
use Illuminate\Validation\ValidationException;
use App\Mail\SendMail;
use DB;
use Botble\Ecommerce\Models\VerificationDoc;
use Botble\Ecommerce\Repositories\Interfaces\VerificationDocInterface;
use Botble\Media\Services\ThumbnailService;

/**
 * @OA\Info(
 *    title="Your super  ApplicationAPI",
 *    version="1.0.0",
 * )
 */
class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after login / registration.
     *
     * @var string
     */
    protected $redirectTo = '/';

    /**
     * @var CustomerInterface
     */
    protected $customerRepository;

    /**
     * @var AddressInterface
     */
    protected $addressRepository;

    /**
     * @var ThumbnailService
     */
    protected $thumbnailService;


    /**
     * Create a new controller instance.
     *
     * @param CustomerInterface $customerRepository
     */
    public function __construct(CustomerInterface $customerRepository,AddressInterface $addressRepository,ThumbnailService $thumbnailService)
    {
        $this->middleware('customer.guest');
        $this->customerRepository = $customerRepository;
        $this->addressRepository = $addressRepository;
        $this->thumbnailService = $thumbnailService;
    }

    /**
     * Show the application registration form.
     *
     * @return Response
     */
    public function showRegistrationForm()
    {
        $countries_list = DB::table('countries_iso_list')->get();
        SeoHelper::setTitle(__('Register'));

        Theme::breadcrumb()->add(__('Home'), route('public.index'))->add(__('Register'), route('customer.register'));

        if (!session()->has('url.intended')) {
            if (!in_array(url()->previous(), [route('customer.login'), route('customer.register')])) {
                session(['url.intended' => url()->previous()]);
            }
        }


        return Theme::scope('ecommerce.customers.register', ['countries_list' => $countries_list], 'plugins/ecommerce::themes.customers.register')
            ->render();
    }

    /**
     * Handle a registration request for the application.
     *
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function register(Request $request, BaseHttpResponse $response)
    {
        $this->validator($request->input())->validate();

        if (is_plugin_active('marketplace') && $request->input('is_vendor') == 1) {
            $existing = SlugHelper::getSlug(
                $request->input('shop_url'),
                SlugHelper::getPrefix(Store::class),
                Store::class
            );

            if ($existing) {
                return $response->setError()->setMessage(__('Shop URL is existing. Please choose another one!'));
            }
        }
        else{
            session(['register_data' => $request->input()]);
            $otpArray =  array('registered_user' => 0,'email' => $request->input('email'));
            $data =  $this->registerMailOtp($request);
            if($data->original['status'] = 1){
                return Theme::scope('ecommerce.customers.register', ['verify_otp' => 1], 'plugins/ecommerce::themes.customers.register')
                    ->render();
            }else{
                return Theme::scope('ecommerce.customers.register', ['verify_otp' => 1,'otp_send_error' => 1], 'plugins/ecommerce::themes.customers.register')
                    ->render();
            }
        }
        event(new Registered($customer = $this->create($request->input())));

        EmailHandler::setModule(ECOMMERCE_MODULE_SCREEN_NAME)
            ->setVariableValues([
                'customer_name' => $customer->name,
            ])
            ->sendUsingTemplate('welcome', $customer->email);

        if (get_ecommerce_setting('verify_customer_email', 0)) {
            $this->sendConfirmationToUser($customer);
            return $this->registered($request, $customer)
                ?: $response->setNextUrl(route('customer.login'))
                    ->setMessage(__('Please confirm your email address.'));
        }
        $customer->confirmed_at = now();
        $this->customerRepository->createOrUpdate($customer);
        $createdCustomer = $this->customerRepository->getFirstBy(['email' => $request->input('email')]);
        $this->addressCreate($createdCustomer,$request->input());
        $this->guard()->login($customer);

        return $response->setNextUrl($this->redirectPath())->setMessage(__('Registered successfully!'));
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param array $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {

        $rules = [
            'name'     => 'required|max:50|regex:/^[\pL\s\-]+$/u',
            'email'    => 'required|email|max:255|unique:ec_customers',
            // 'password' => 'required|min:6|confirmed|regex:/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*(_|[^\w])).+$/',
            'password' => [
                'required',
                'string',
                'min:6',             // must be at least 6 characters in length
                'regex:/[a-z]/',      // must contain at least one lowercase letter
                'regex:/[A-Z]/',      // must contain at least one uppercase letter
                'regex:/[0-9]/',      // must contain at least one digit
                'regex:/[@$!%*#]/', // must contain a special character
                'confirmed',

            ],
        ];

        if (setting('enable_captcha') && is_plugin_active('captcha')) {
            $rules += ['g-recaptcha-response' => 'required|captcha'];
        }

        if (is_plugin_active('marketplace') && request()->input('is_vendor') == 1) {
            $rules['shop_name'] = 'required|min:20|regex:/^[\pL\s\-]+$/u';
            $rules['shop_phone'] = 'required';
            $rules['shop_url'] = 'required';
        }

        if (is_plugin_active('marketplace') && request()->input('is_vendor') == 0) {
//            $rules['first_name']     = 'required|alpha|max:50';
//            $rules['last_name']      = 'required|alpha|max:50';
            $rules['phone']          = !empty($data['phone'])?'regex:/^\+(?:[0-9] ?){6,14}[0-9]$/':"";
            $rules['city']           = 'required|max:50';
            $rules['zip_code']        = 'required|numeric';
            $rules['address']        = 'required|max:225';
            $rules['dob']            = 'required';
            $rules['gender']         = 'required';
            $rules['job']            ='required|max:50';
            $rules['business_name']  = 'required|max:50';
        }

        if (request()->has('agree_terms_and_policy')) {
            $rules['agree_terms_and_policy'] = 'accepted:1';
        }


        /* $attributes = [
             'name'                   => __('Name'),
             'email'                  => __('Email'),
             'password'       => __('Password'),
             'g-recaptcha-response'   => __('Captcha'),
             'shop_name'              => __('Shop Name'),
             'shop_phone'             => __('Shop Phone'),
             'shop_url'               => __('Shop URL'),
             'agree_terms_and_policy' => __('Term and Policy'),
         ];
 */
        $messages = [
            'password.regex'   => 'Password must contain at least one number, special character and both uppercase and lowercase letters.',
        ];

        return Validator::make($data, $rules,$messages);
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param array $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    public function appValidator(array $data)
    {
        $rules = [
            'name'          => 'required|max:255',
            'phone'         => 'required',
            'email'         => 'required|email|max:255|unique:ec_customers',
            'password'      => 'required|min:6|confirmed',
            'device_token'  => 'required|max:255',
            'first_name'    => 'required|max:255',
            'last_name'     => 'required|max:255',
            'country'       => 'required|max:50',
            'city'          => 'required|max:10',
            'zip_code'      => 'required|max:10',
            'address'       => 'required|max:100',
            'dob'           => 'required|max:10',
            'gender'        => 'required|max:255',
            'job'           => 'required|max:255',
            'business_name' => 'required|max:255',
        ];
        $validation = Validator::make($data, $rules);
        if($validation->passes()) {
            return 'success';
        } else {
            $errors = $validation->errors(); //here's the magic
            return $errors;
        }
    }
    /**
     * Create a new user instance after a valid registration.
     *
     * @param array $data
     * @return Customer
     */
    protected function create(array $data)
    {
        return $this->customerRepository->create([
            'name'     => $data['name'],
            'email'    => $data['email'],
            'password' => bcrypt($data['password']),
            'first_name'=> isset($data['first_name'])?$data['first_name']:'',
            'last_name'=> isset($data['last_name'])?$data['last_name']:'',
            'phone'    => isset($data['phone'])?$data['phone']:'',
            'gender'   => isset($data['gender'])?$data['gender']:'',
            'job'      => isset($data['job'])?$data['job']:'',
            'dob'      => isset($data['dob'])?date('Y-m-d',strtotime($data['dob'])):Null,
            'business_name' => isset($data['business_name'])?$data['business_name']:'',
            'status'        => Customer::statusPending,
        ]);
    }

    /**
     * Send the confirmation code to a user.
     *
     * @param Customer $customer
     */
    protected function sendConfirmationToUser($customer)
    {
        // Notify the user
        $notificationConfig = config('plugins.ecommerce.general.customer.notification');
        if ($notificationConfig) {
            $notification = app($notificationConfig);
            $customer->notify($notification);
        }
    }

    /**
     * Get the guard to be used during registration.
     *
     * @return StatefulGuard
     */
    protected function guard()
    {
        return auth('customer');
    }

    /**
     * Confirm a user with a given confirmation code.
     *
     * @param int $id
     * @param Request $request
     * @param BaseHttpResponse $response
     * @param CustomerInterface $customerRepository
     * @return BaseHttpResponse
     */
    public function confirm($id, Request $request, BaseHttpResponse $response, CustomerInterface $customerRepository)
    {
        if (!URL::hasValidSignature($request)) {
            abort(404);
        }

        $customer = $customerRepository->findOrFail($id);

        $customer->confirmed_at = now();
        $this->customerRepository->createOrUpdate($customer);

        $this->guard()->login($customer);

        return $response
            ->setNextUrl(route('customer.overview'))
            ->setMessage(__('You successfully confirmed your email address.'));
    }

    /**
     * Resend a confirmation code to a user.
     *
     * @param Request $request
     * @param CustomerInterface $customerRepository
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function resendConfirmation(
        Request $request,
        CustomerInterface $customerRepository,
        BaseHttpResponse $response
    ) {
        $customer = $customerRepository->getFirstBy(['email' => $request->input('email')]);

        if (!$customer) {
            return $response
                ->setError()
                ->setMessage(__('Cannot find this customer!'));
        }

        $this->sendConfirmationToUser($customer);

        return $response
            ->setMessage(__('We sent you another confirmation email. You should receive it shortly.'));
    }

    /**
     * @return Factory|View
     */
    public function getVerify()
    {
        return view('plugins/ecommerce::themes.customers.verify');
    }

    /**
     * Handle a registration request for the application.
     *
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function appRegister(Request $request,CustomerInterface $customerRepository)
    {
        $validator = $this->appValidator($request->input());

        if($validator == "success"){
            $createCustomer = $this->appCreate($request->input());

            if(!empty($request->file('avatar'))) {
                $result = RvMedia::handleUpload($request->file('avatar'), 0, 'users');
                $file = $result['data'];
                $customerData['avatar'] = RvMedia::url($file->url);
                $this->customerRepository->Update(['id' => $createCustomer['id']],$customerData);
            }

            $customer = $customerRepository->getFirstBy(['email' => $request->input('email')]);
            $customer['role'] = Customer::RoleCustomer;
            $customer['phone'] = str_replace('+', '', $customer['phone']);
            $this->addressCreate($customer,$request->input());
            return returnResponse(true, 200, null,__('alias.controller.auth.apAuthController.userRegistered'),$customer);
        }else{
            $erorr_message = array_values($validator->messages());
            return returnResponse(false, 400,null,$erorr_message[0][0]);
        }
    }

    protected function appCreate(array $data)
    {
        return Customer::create([
            'name'     => $data['name'],
            'email'    => $data['email'],
            'password' => bcrypt($data['password']),
            'first_name'=> isset($data['first_name'])?$data['first_name']:'',
            'last_name'=> isset($data['last_name'])?$data['last_name']:'',
            'phone'    => isset($data['phone'])?$data['phone']:'',
            'gender'   => isset($data['gender'])?$data['gender']:'',
            'job'      => isset($data['job'])?$data['job']:'',
            'dob'      => isset($data['dob'])?date('Y-m-d',strtotime($data['dob'])):Null,
            'business_name' => isset($data['business_name'])?$data['business_name']:'',
            'status'        => Customer::statusPending,
            'device_token'   => $data['device_token']
        ]);
    }

    protected function addressCreate($customer, array $data)
    {
        return Address::create([
            'title'    => isset($data['title'])?$data['title']:'',
            'name'     => $customer['name'],
            'email'    => $customer['email'],
            'phone'    => isset($customer['phone'])?$customer['phone']:'',
            'country'  => isset($data['country'])?$data['country']:'',
            'city'     => isset($data['city'])?$data['city']:'',
            'zip_code'  => isset($data['zip_code'])?$data['zip_code']:'',
            'address'  => isset($data['address'])?$data['address']:'',
            'customer_id' => $customer['id'],
            'is_default' => 1,
            'type' => Address::AddressShipping
        ]);
    }

    //changed app flow
    public function registerMailOtp(Request $request) {
        $input = $request->all();
        if($input['registered_user'] == 1) {
            $customer = Customer::where('email', $input['email'])->first();
            if(!empty($customer)) {
                $data = [
                    'otp' => str_pad(rand('000000', '999999'), 6, '0', STR_PAD_LEFT),
                    'status' => MailOtp::StatusUnUsed
                ];
                $mail = sendMail(request()->get('email'), 'Register Otp', $data, 'emails.registerMailOtp');
//                dd($data ,$mail , request()->get('email'));

                if ($mail) {
                    $check = MailOtp::where(['email' => request()->get('email')])->first();
                    if ($check) {
                        $check->update($data);
                    } else {
                        MailOtp::create(array_merge(request()->all(), $data));
                    }
                    return returnResponse(true, 200, null, __('alias.controller.auth.apAuthController.registerOtpSendSuccessfully'));
                } else {
                    return returnResponse(false, 203, null, __('alias.controller.auth.apAuthController.registerOtpSendFailed'));
                }
            } else {
                return returnResponse(false, 203, null, __('alias.controller.auth.apAuthController.userNotFound'));
            }
        } else {
            $customer = Customer::where('email', $input['email'])->first();
            if(empty($customer)) {
                $data = [
                    'otp' => str_pad(rand('000000', '999999'), 6, '0', STR_PAD_LEFT),
                    'status' => MailOtp::StatusUnUsed
                ];
                $mail = sendMail(request()->get('email'), 'Register Otp', $data, 'emails.registerMailOtp');
                if ($mail) {
                    $check = MailOtp::where(['email' => request()->get('email')])->first();
                    if ($check) {
                        $check->update($data);
                    } else {
                        MailOtp::create(array_merge(request()->all(), $data));
                    }
                    return returnResponse(true, 200, null, __('alias.controller.auth.apAuthController.registerOtpSendSuccessfully'));
                } else {
                    return returnResponse(false, 203, null, __('alias.controller.auth.apAuthController.registerOtpSendFailed'));
                }
            } else {
                return returnResponse(false, 203, null, __('alias.controller.auth.apAuthController.alreadyExistUser'));

            }
        }
    }


    public function registerMailOtpVerify(request $request) {
        $web_otp_verify = request()->input('web_otp_verify');
        if($web_otp_verify == 1){
            unset($request['web_otp_verify']);
            $otp =  implode('', request()->all());
            $check = MailOtp::where(array('otp'=>$otp, 'status' => MailOtp::StatusUnUsed))->first();
        }else{
            $input = request()->all();
            $check = MailOtp::where(array('otp'=>$input['otp'],'email'=>$input['email'], 'status' => MailOtp::StatusUnUsed))->first();
        }
        if ($check) {
            $check->update(['status' => MailOtp::StatusUsed]);
            return returnResponse(true, 200, null, __('alias.controller.auth.apAuthController.registerMailOtpVerifiedSuccessfully'));
        } else {
            return returnResponse(false, 203, null, __('alias.controller.auth.apAuthController.registerMailOtpVerificationFailed'));
        }
    }

    /**
     * Handle a registration request for the application.
     *
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function appChangePasword(Request $request)
    {

        $customer = Customer::where(['email'=> $request->input('email')])->first();
        if($customer){
            if (!Hash::check($request->input('old_password'), $customer->getAuthPassword())) {
                return returnResponse(false, 200, '', __('alias.controller.auth.apAuthController.IncorrectOldPassword'));
            }else{
                // $this->customerRepository->update(['id' => $customer->getAuthIdentifier()], [
                // 'password' => bcrypt($request->input('password')),]);
                $data['password'] = bcrypt($request->input('new_password'));
                $this->customerRepository->Update(['email' => $request->input('email')],$data);
                return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.changePasswordSuccessfully'));
            }
        }else{
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function appResetPassword(Request $request) {
        $input = request()->all();

        $data['password'] = bcrypt($input['new_password']);
        $user = Customer::where(['email'=> $input['email']])->first();
        if($user) {
            $customer = $this->customerRepository->Update(['email' => $input['email']],$data);
            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.changePasswordSuccessfully'),$user);
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.changePasswordFailed'));
        }
    }

    /**
     * @param AddCustomerWhenCreateOrderRequest $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function getInfo() {
        $input = request()->all();
        $customer = Customer::where('id', $input['id'])->first();
        if($customer) {
            $address = Address::where('customer_id',$customer['id'])->where('type',2)->first();
            $customer['role'] = Customer::RoleCustomer;
            if(!empty($address)){
                $address['userId'] = $address['customer_id'];
                $address['address1'] = $address['address'];
                $address['zip'] = $address['zip_code'];
                unset($address['zip_code']);
                unset($address['address']);
                unset($address['customer_id']);
            }
            unset($customer['is_vendor']);
            unset($customer['email_verify_token']);
            $customer['shippingAddress'] = (!empty($address))?$address:[];
            return returnResponse(true, 200, '', __('alias.controller.api.v1.userController.UserInfoData'), $customer);
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    /**
     * @param EditCustomerWhenCreateOrderRequest $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function editUserInfo(Request $request) {
        $data = request()->all();
        $customer = Customer::where('id', $data['id'])->first();
        if($customer) {
            $customerData = array(
                'id' => isset($data['id'])?$data['id']:$customer['id'],
                'name' => $data['name'],
                'first_name'=> isset($data['first_name'])?$data['first_name']:$customer['first_name'],
                'last_name'=> isset($data['last_name'])?$data['last_name']:$customer['last_name'],
                'phone'    => isset($data['phone'])?$data['phone']:$customer['phone'],
                'gender'   => isset($data['gender'])?$data['gender']:$customer['gender'],
                'job'      => isset($data['job'])?$data['job']:$customer['job'],
                'dob'      => isset($data['dob'])?date('Y-m-d',strtotime($data['dob'])):$customer['dob'],
                'business_name' => isset($data['business_name'])?$data['business_name']:$customer['business_name']
            );

            if(!empty($request->file('avatar'))) {
                $result = RvMedia::handleUpload($request->file('avatar'), 0, 'users');
                $file = $result['data'];
                $customerData['avatar'] = RvMedia::url($file->url);
            }

            $this->customerRepository->Update(['id' => $data['id']],$customerData);

            $address = Address::where('customer_id',$data['id'])->first();
            $AddressData = [
                'country'  => isset($data['country'])?$data['country']:$address['country'],
                'city'     => isset($data['city'])?$data['city']:$address['city'],
                'zip_code'  => isset($data['zip_code'])?$data['zip_code']:$address['zip_code'],
                'address'  => isset($data['address'])?$data['address']:['address'],
            ];

            $address->update($AddressData);
            if(!empty($address)){
                $address['userId'] = $address['customer_id'];
                $address['address1'] = $address['address'];
                $address['zip'] = $address['zip_code'];
                unset($address['zip_code']);
                unset($address['address']);
                unset($address['customer_id']);
            }
            $customer = Customer::where('id', $data['id'])->first();
            unset($customer['is_vendor']);
            unset($customer['email_verify_token']);
            $customer['shippingAddress'] = (!empty($address))?$address:[];
            return returnResponse(true, 200, '', __('alias.controller.api.v1.userController.UpdateUserInfo'), $customer);
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function appChangeLang(Request $request) {
        $input = request()->all();

        $data['lang'] = $input['lang'];
        $user = Customer::where(['id'=> $input['id']])->first();
        if($user) {
            $customer = $this->customerRepository->Update(['id' => $input['id']],$data);

            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.changeLanguageSuccessfully'),$user);
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.changeLanguageFailed'));
        }
    }

    public function appUploadDoc(Request $request) {
        $input = request()->all();

        $user = Customer::where(['id'=> $input['user_id']])->first();

        if($user) {

            $verificationData = VerificationDoc::where(['user_id'=> $input['user_id']])->first();

            if(!empty($verificationData)) {
                //$input['validity_date'] = date('Y-m-d',strtotime($input['validity_date']));
                //$result = RvMedia::handleUpload($request->file('doc_photo1'), 0, 'users');
                //$file = $result['data'];
                //$input['doc_photo1'] = RvMedia::url($file->url);
                //$update = VerificationDoc::create($input);
            }
            $input['validity_date'] = date('Y-m-d',strtotime($input['validity_date']));
            $result = RvMedia::handleUpload($request->file('doc_photo1'), 0, 'users');
            $file = $result['data'];
            $input['doc_photo1'] = RvMedia::url($file->url);
            $update = VerificationDoc::create($input);

            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.uploadDocumentSuccessfully'));
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.uploadDocumentFailed'));
        }
    }

    public function accountSetting(Request $request){
        $input = request()->all();
        $user = Customer::where(['id'=> $input['user_id']])->first();
        if($user) {
            $data['is_request_verification'] = 0;
            $verificationData = VerificationDoc::where(['user_id'=> $input['user_id']])->first();

            if(!empty($verificationData)) {
                $data['is_request_verification'] = 1;
            }
            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.AccountSetting'),$data);
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function addBillingAddress(Request $request) {
        $input = request()->all();
        $customer = Customer::where(['id'=> $input['user_id']])->first();
        if($customer) {
            $billingAddress = $this->addressCreate($customer,$input);
            $type = $input['type'];
            if($type == 1) {
                $billingAddress->type = Address::AddressBilling;
                $billingAddress->save();
                return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.AddBillingAddress'));
            } else if($type == 2) {
                $billingAddress->type = Address::AddressShipping;
                $billingAddress->save();
                return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.AddShippingAddress'));
            }
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function editBillingAddress(Request $request) {
        $input = request()->all();
        $customer = Customer::where(['id'=> $input['user_id']])->first();
        if($customer) {
            $billingAddress = Address::where(['id'=> $input['address_id']])->first();
            if(!empty($billingAddress)) {
                $billingAddress->update($input);
            }
            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.UpdateBillingAddress'));

        }else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function deleteBillingAddress(Request $request) {
        $input = request()->all();
        $customer = Customer::where(['id'=> $input['user_id']])->first();
        if($customer) {
            $billingAddress = Address::where(['id'=> $input['address_id']])->first();

            if(!empty($billingAddress)) {

                if($billingAddress->is_default == 1) {
                    $type = $billingAddress->type;
                    $billingAddress->delete();
                    $setDefault = Address::where(['customer_id'=> $input['user_id'], 'type' => $type])->first();
                    if(!empty($setDefault)){
                        $setDefault->is_default = 1;
                        $setDefault->save();
                    }
                    // $setDefault->is_default = 1;
                    // $setDefault->save();
                } else {
                    $billingAddress->delete();
                }

            }
            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.DeleteBillingAddress'));
        }else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function listBillingAddress(Request $request) {
        $input = request()->all();
        $customer = Customer::where(['id'=> $input['user_id']])->first();
        if($customer) {
            $type = $input['type'];
            if($type == 1) {
                $billingAddress = Address::where(['customer_id'=> $input['user_id'], 'type' => 1])->get();
                return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.ListBillingAddress'),$billingAddress);
            } else if($type == 2) {
                $billingAddress = Address::where(['customer_id'=> $input['user_id'], 'type' => 2])->get();
                return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.ListShippingAddress'),$billingAddress);
            }
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function addDefaultBillingAddress(Request $request) {
        $input = request()->all();
        $customer = Customer::where(['id'=> $input['user_id']])->first();
        if($customer) {
            $type = $input['type'];
            if($type == 1) {
                $billingAddress = Address::where(['customer_id'=> $input['user_id'], 'type' => 1])->get();
                foreach ($billingAddress as $key => $value) {
                    $billingAddressData = Address::where(['id'=> $value['id'], 'type' => 1])->first();
                    if($value['id'] == $input['address_id']) {
                        $billingAddressData->is_default = 1;
                    } else {
                        $billingAddressData->is_default = 0;
                    }
                    $billingAddressData->save();
                }
                return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.ChangeDefaultBillingAddress'));
            } else if($type == 2) {
                $billingAddress = Address::where(['customer_id'=> $input['user_id'], 'type' => 2])->get();
                foreach ($billingAddress as $key => $value) {
                    $billingAddressData = Address::where(['id'=> $value['id'], 'type' => 2])->first();
                    if($value['id'] == $input['address_id']) {
                        $billingAddressData->is_default = 1;
                    } else {
                        $billingAddressData->is_default = 0;
                    }
                    $billingAddressData->save();
                }
                return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.ChangeDefaultShippingAddress'));
            }
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function appUploadAvatar(Request $request) {
        $input = request()->all();
        $user = Customer::where(['id'=> $input['user_id']])->first();
        if($user) {
            $result = RvMedia::handleUpload($request->file('avatar_file'), 0, 'users');

            $result = RvMedia::handleUpload($request->file('avatar_file'), 0, 'users');

            if ($result['error'] != false) {

                return $response->setError()->setMessage($result['message']);
            }

            $avatarData = json_decode($request->input('avatar_data'));

            $file = $result['data'];

            $user->avatar = $file->id;
            $data = ['url' => RvMedia::url($file->url)];
            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.uploadDocumentSuccessfully'),$data);

        }else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.uploadDocumentFailed'));
        }
    }

    public function registerOtpVerify(Request $request,BaseHttpResponse $response){
        $input = request()->all();
        unset($request['_token']);
        $verifiedCheck =  $this->registerMailOtpVerify($request);
        if($verifiedCheck->original['status'] == 1){
            $resiterSession = session()->get('register_data');
            event(new Registered($customer = $this->create($resiterSession)));
            $customer->confirmed_at = now();
            $this->customerRepository->createOrUpdate($customer);
            $createdCustomer = $this->customerRepository->getFirstBy(['email' => $resiterSession['email']]);
            $this->addressCreate($createdCustomer,$resiterSession);
            $this->guard()->login($customer);
            return $response->setNextUrl($this->redirectPath())->setMessage(__('Registered successfully!'));
        }else{
            return Theme::scope('ecommerce.customers.register', ['verify_otp' => 1,'invalid_otp' => 1], 'plugins/ecommerce::themes.customers.register')
                ->render();
        }
    }


}
