<?php

namespace Botble\Ecommerce\Http\Controllers\Fronts;

use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Base\Supports\Helper;
use Botble\Ecommerce\Enums\OrderStatusEnum;
use Botble\Ecommerce\Enums\ShippingMethodEnum;
use Botble\Ecommerce\Http\Requests\EndTimeGreaterThanStartTime;
use Botble\Ecommerce\Models\Service;
use Botble\Ecommerce\Models\ServiceBooking;
use Botble\Ecommerce\Repositories\Interfaces\AddressInterface;
use Botble\Ecommerce\Repositories\Interfaces\BookedServiceInterface;
use Botble\Ecommerce\Repositories\Interfaces\CustomerInterface;
use Botble\Ecommerce\Services\HandleApplyPromotionsService;
use ServiceBooking as ServiceBookingHelper;
use Botble\Ecommerce\Http\Requests\ServiceBookingRequest;
use Botble\Ecommerce\Repositories\Interfaces\ServiceInterface;
use Botble\Ecommerce\Services\Services\GetServices;
use EcommerceHelper;
use Botble\SeoHelper\SeoOpenGraph;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use SeoHelper;
use Theme;
use OrderHelper;
use Cart;

class PublicServiceController
{
    protected $serviceRepository;
    protected $serviceBookingRepository;
    protected $customerRepository;
    protected $addressRepository;

    public $message;
    public $status;

    /**
     * GetProductService constructor.
     * @param ServiceInterface $serviceRepository
     * @param BookedServiceInterface $serviceBookingRepository
     */
    public function __construct(
        ServiceInterface $serviceRepository ,
        BookedServiceInterface $serviceBookingRepository,
        CustomerInterface $customerRepository,
        AddressInterface $addressRepository
    )
    {
        $this->serviceRepository = $serviceRepository;
        $this->serviceBookingRepository = $serviceBookingRepository;
        $this->customerRepository = $customerRepository;
        $this->addressRepository = $addressRepository;

    }

    public function getServices(Request $request, GetServices $getService, BaseHttpResponse $response)
    {
        $services = $getService->getServices($request);
        if ($request->ajax()) {
            $total = $services->total();
            $message = $total > 1 ? __(':total Services found', compact('total')) : __(':total Service found',
                compact('total'));
        }

        Theme::breadcrumb()
            ->add(__('Home'), route('public.index'))
            ->add(__('Services'), route('public.services'));

        SeoHelper::setTitle(__('Services'))->setDescription(__('Services'));

        do_action(SERVICE_MODULE_SCREEN_NAME);

        return Theme::scope('ecommerce.services.services-listing', compact('services'),
            'plugins/ecommerce::themes.services.services-listing')->render();
    }

    public function getServiceDetails($id, Request $request,BaseHttpResponse $response,GetServices $getServiceDetail)
    {
        $service =  Service::where('id',$id)->first();
        if (!$service) {
            abort(404);
        }

        $condition = [
            'ec_services.id'     => $service->id,
            'ec_services.status' => 1,
        ];

        if (Auth::check() && $request->input('preview')) {
            Arr::forget($condition, 'ec_services.status');
        }
        SeoHelper::setTitle($service->name)->setDescription($service->description);

        $meta = new SeoOpenGraph;

        $meta->setDescription($service->description);
        $meta->setTitle($service->name);

        SeoHelper::setSeoOpenGraph($meta);

        Helper::handleViewCount($service, 'viewed_Service');

        Theme::breadcrumb()
            ->add(__('Home'), route('public.index'))
            ->add(__('Services'), route('public.service-details',$service->id));

        do_action(BASE_ACTION_PUBLIC_RENDER_SINGLE, SERVICE_MODULE_SCREEN_NAME, $service);

        return Theme::scope('ecommerce.services.service-details',
            compact('service'),
            'plugins/ecommerce::themes.services.services-details')
            ->render();
    }
    public function bookService(ServiceBookingRequest $request,BaseHttpResponse $response){
        if (!EcommerceHelper::isCartEnabled()) {
            return $response->setError(true);
        }
        $user =  auth('customer')->user();
        if ($user) {
            $serviceBookingAlready = ServiceBooking::where('service_id', $request->service_id)
                ->whereDate('date', $request->date)
                ->first();
            if ($serviceBookingAlready) {
                $this->message = 'Service is already booked at this date. Please choose another date.';
                return returnResponse(false, 401, '', $this->message);
            } else {
                $service = Service::find($request->service_id);
                $servicebooking = new ServiceBooking();
                $servicebooking->user_id = $user->id;
                $servicebooking->service_id = $request->service_id;
                $servicebooking->date = $request->date;
                $servicebooking->start_time = $request->start_time;
                $servicebooking->end_time = $request->end_time;
                $servicebooking->status = ServiceBooking::PENDING_STATUS;
                $servicebooking->note = $request->note;
                $servicebooking->amount = $service->price;
                $servicebooking->sub_total = $service->price;
                $servicebooking->save();

                $cartItems = OrderHelper::handleAddToCartService($servicebooking, $request);

                $token = OrderHelper::getOrderSessionToken();
                $nextUrl = route('public.checkout.information', $token);

                if (EcommerceHelper::getQuickBuyButtonTarget() == 'cart') {
                    $nextUrl = route('public.cart');
                }
                if ($request->has('checkout')) {
                    if ($request->ajax() && $request->wantsJson()) {
                        return $response->setData(['next_url' => route('public.checkout.information', $token)]);
                    }

                    return $response->setNextUrl($nextUrl);
                }

                $servicebooking->token = $token;
                $servicebooking->update();

                return $response
                    ->setData([
                        'status'      => true,
                        'count'       => ServiceBookingHelper::instance('service_booking')->count(),
                        'total_price' => format_price(ServiceBookingHelper::instance('service_booking')->rawSubTotal()),
                        'content'     => $servicebooking,
                        'next_url'    => $nextUrl,

                    ])
                    ->setMessage(__('Added Service :service to cart successfully!',
                        ['service' => $servicebooking->service->name]));
            }
        } else {
            $this->message = 'Please First login before booking service';
            return returnResponse(true, 200, 'login', $this->message);
        }
    }
    public function serviceCheckout($serviceToken,Request $request,BaseHttpResponse $response,HandleApplyPromotionsService $applyPromotionsService){
        if (!EcommerceHelper::isCartEnabled()) {
            abort(404);
        }
        if (!EcommerceHelper::isEnabledGuestCheckout() && !auth('customer')->check()) {
            return $response->setNextUrl(route('customer.login'));
        }
        if ($serviceToken !== session('tracked_start_checkout')) {
            $order = $this->serviceBookingRepository->getFirstBy(['token' => $serviceToken, 'is_finished' => false]);
            if (!$order) {
                return $response->setNextUrl(route('public.index'));
            }
        }
        $sessionCheckoutData = OrderHelper::getOrderSessionData($serviceToken);
        $promotionDiscountAmount = $applyPromotionsService->execute($serviceToken);
        $sessionCheckoutData = $this->processOrderData($serviceToken, $sessionCheckoutData, $request);


        $user =  auth('customer')->user();
        $serviceBooking = ServiceBooking::with('service')
            ->where('token', $serviceToken)
            ->where('user_id', $user->id)
            ->where('status', ServiceBooking::PENDING_STATUS)
            ->get();
        if (count($serviceBooking) > 0) {
            $total = 0;
            foreach ($serviceBooking as $serviceBook){
                $total += $serviceBook->service->price;
            }
            return view('plugins/ecommerce::services.checkout', compact(
                'serviceBooking',
                'total',
                'user',
                'serviceToken',
                'sessionCheckoutData'
            ));
        } else {
            $this->message = 'Service is not exist first please book your service';
            return redirect()->to('services')->with('success_msg',$this->message);

        }

    }
    protected function processOrderData(string $token, array $sessionData, Request $request): array
    {
        if ($request->input('address', [])) {
            if (!isset($sessionData['created_account']) && $request->input('create_account') == 1) {
                $validator = \Validator::make($request->input(), [
                    'password'              => 'required|min:6',
                    'password_confirmation' => 'required|same:password',
                    'address.email'         => 'required|max:60|min:6|email|unique:ec_customers,email',
                    'address.name'          => 'required|min:3|max:120',
                ]);

                if (!$validator->fails()) {

                    $customer = $this->customerRepository->createOrUpdate([
                        'name'     => $request->input('address.name'),
                        'email'    => $request->input('address.email'),
                        'phone'    => $request->input('address.phone'),
                        'password' => bcrypt($request->input('password')),
                    ]);

                    auth('customer')->attempt([
                        'email'    => $request->input('address.email'),
                        'password' => $request->input('password'),
                    ], true);

                    $sessionData['created_account'] = true;

                    $this->addressRepository->createOrUpdate($request->input('address') + [
                            'customer_id' => $customer->id,
                            'is_default'  => true,
                        ]);
                }
            }

            if (auth('customer')->check() && auth('customer')->user()->addresses()->count() == 0) {
                $this->addressRepository->createOrUpdate($request->input('address', []) +
                    ['customer_id' => auth('customer')->id(), 'is_default' => true]);
            }
        }

        if (is_plugin_active('marketplace')) {
            $products = Cart::instance('cart')->products();

            $sessionData = apply_filters(HANDLE_PROCESS_ORDER_DATA_ECOMMERCE, $products, $token, $sessionData,
                $request);

            OrderHelper::setOrderSessionData($token, $sessionData);

            return $sessionData;
        }

        if (!isset($sessionData['created_order'])) {
            $currentUserId = 0;
            if (auth('customer')->check()) {
                $currentUserId = auth('customer')->id();
            }

            $request->merge([
                'amount'          => ServiceBookingHelper::instance('cart')->rawTotal(),
                'user_id'         => $currentUserId,
                'shipping_method' => $request->input('shipping_method', ShippingMethodEnum::DEFAULT),
                'shipping_option' => $request->input('shipping_option'),
                'shipping_amount' => 0,
                'tax_amount'      => ServiceBookingHelper::instance('service_booking')->rawTax(),
                'sub_total'       => ServiceBookingHelper::instance('service_booking')->rawSubTotal(),
                'coupon_code'     => session()->get('applied_coupon_code'),
                'discount_amount' => 0,
                'status'          => OrderStatusEnum::PENDING,
                'is_finished'     => false,
                'token'           => $token,
            ]);


            $order = $this->orderRepository->getFirstBy(compact('token'));

            if ($order) {
                $order->fill($request->input());
                $order = $this->orderRepository->createOrUpdate($order);
            } else {
                $order = $this->orderRepository->createOrUpdate($request->input());
            }

            $sessionData['created_order'] = true;
            $sessionData['created_order_id'] = $order->id;
        }

        $address = null;

        if ($request->input('address.address_id') && $request->input('address.address_id') !== 'new') {
            $address = $this->addressRepository->findById($request->input('address.address_id'));
            if (!empty($address)) {
                $sessionData['address_id'] = $address->id;
                $sessionData['created_order_address_id'] = $address->id;
            }
        } elseif (auth('customer')->check() && !Arr::get($sessionData, 'address_id')) {
            $address = $this->addressRepository->getFirstBy([
                'customer_id' => auth('customer')->id(),
                'is_default'  => true,
            ]);

            if ($address) {
                $sessionData['address_id'] = $address->id;
            }
        }

        if (Arr::get($sessionData, 'address_id') && Arr::get($sessionData, 'address_id') !== 'new') {
            $address = $this->addressRepository->findById(Arr::get($sessionData, 'address_id'));
        }

        $addressData = [];
        if (!empty($address)) {
            $addressData = [
                'name'       => $address->name,
                'phone'      => $address->phone,
                'email'      => $address->email,
                'country'    => $address->country,
                'state'      => $address->state,
                'city'       => $address->city,
                'address'    => $address->address,
                'zip_code'   => $address->zip_code,
                'order_id'   => $sessionData['created_order_id'],
                'address_id' => $address->id,
            ];
        } elseif ((array)$request->input('address', [])) {
            $addressData = array_merge(['order_id' => $sessionData['created_order_id']],
                (array)$request->input('address', []));
        }

        if ($addressData && !empty($addressData['name']) && !empty($addressData['phone']) && !empty($addressData['address'])) {
            if (!isset($sessionData['created_order_address'])) {
                $createdOrderAddress = $this->createOrderAddress($addressData,
                    Arr::get($addressData, 'created_order_id'));
                if ($createdOrderAddress) {
                    $sessionData['created_order_address'] = true;
                    $sessionData['created_order_address_id'] = $createdOrderAddress->id;
                }
            } elseif (!empty($sessionData['created_order_id'])) {
                $this->createOrderAddress($addressData,
                    $sessionData['created_order_id'] ?: Arr::get($addressData, 'address_id'));
            }
        }

        $sessionData = array_merge($sessionData, $addressData);

        if (!isset($sessionData['created_order_product'])) {
            $weight = 0;
            foreach (Cart::instance('cart')->content() as $cartItem) {
                $product = $this->productRepository->findById($cartItem->id);
                if ($product) {
                    if ($product->weight) {
                        $weight += $product->weight * $cartItem->qty;
                    }
                }
            }

            $weight = $weight > 0.1 ? $weight : 0.1;

            $this->orderProductRepository->deleteBy(['order_id' => $sessionData['created_order_id']]);

            foreach (Cart::instance('cart')->content() as $cartItem) {
                $data = [
                    'order_id'     => $sessionData['created_order_id'],
                    'product_id'   => $cartItem->id,
                    'product_name' => $cartItem->name,
                    'qty'          => $cartItem->qty,
                    'weight'       => $weight,
                    'price'        => $cartItem->price,
                    'tax_amount'   => EcommerceHelper::isTaxEnabled() ? $cartItem->taxRate / 100 * $cartItem->price : 0,
                    'options'      => [],
                ];

                if ($cartItem->options->extras) {
                    $data['options'] = $cartItem->options->extras;
                }

                $this->orderProductRepository->create($data);
            }

            $sessionData['created_order_product'] = Cart::instance('cart')->getLastUpdatedAt();
        }

        OrderHelper::setOrderSessionData($token, $sessionData);

        return $sessionData;
    }


}
