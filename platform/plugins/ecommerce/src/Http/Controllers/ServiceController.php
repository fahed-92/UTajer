<?php

namespace Botble\Ecommerce\Http\Controllers;

use App\Models\City;
use App\Models\Country;
use App\Models\State;
use App\Models\UserProfile;
use Assets;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Ecommerce\Models\Address;
use Botble\Ecommerce\Models\Customer;
use Botble\Ecommerce\Models\Order;
use Botble\Ecommerce\Models\Payout;
use Botble\Ecommerce\Models\Product;
use Botble\Ecommerce\Models\Service;
use Botble\Ecommerce\Models\ServiceBooking;
use Botble\Ecommerce\Models\Store;
use Botble\Ecommerce\Tables\ServiceTable;
use Botble\Ecommerce\Traits\ServiceActionsTrait;
use Botble\Marketplace\Enums\WithdrawalStatusEnum;
use Botble\Marketplace\Models\VendorInfo;
use Botble\Marketplace\Models\Withdrawal;
use Botble\Media\Models\MediaFile;
use RvMedia;
use Botble\Payment\Enums\PaymentStatusEnum;
use Botble\Payment\Models\Payment;
use Carbon\CarbonPeriod;
use Exception;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\View\View;
use Throwable;
use EcommerceHelper;
use OrderHelper;

use function GuzzleHttp\json_encode;

class  ServiceController extends BaseController
{

    public $message;
    public $data;
    public $status;

    use ServiceActionsTrait;

    /**
     * @return BaseHttpResponse|Factory|View|string
     * @throws Throwable
     */
    public function index(ServiceTable $dataTable)
    {
        Assets::addScripts(['bootstrap-editable'])
            ->addStyles(['bootstrap-editable']);

        return $dataTable->renderTable();
    }

    /*Api for mobile App*/
    public function listing(Request $request){
        try {
            $services = Service::where('status',Service::ACTIVE_STATUS)
                ->with('category')
                ->when($request->featured,function ($q) use($request) {
                    $q->where('is_featured','like',"%".$request->featured."%");
                })
                ->when($request->name,function ($q) use($request) {
                    $q->where('name','like',"%".$request->name."%");
                })
                ->when($request->user_id,function ($q) use($request) {
                    $q->where('user_id','like',"%".$request->user_id."%");
                })
                ->when($request->category_id,function ($q) use($request) {
                    $q->where('category_id','like',"%".$request->category_id."%");
                })
                ->when($request->country,function ($q) use($request) {
                    $q->where('country','like',"%".$request->country."%");
                })
                ->when($request->state,function ($q) use($request) {
                    $q->where('state','like',"%".$request->state."%");
                })
                ->when($request->city,function ($q) use($request) {
                    $q->where('city','like',"%".$request->city."%");
                })
                ->when($request->service_type,function ($q) use($request) {
                    $q->where('service_type','like',"%".$request->service_type."%");
                })
                ->when($request->price_type,function ($q) use($request) {
                    $q->where('price_type','like',"%".$request->price_type."%");
                })
                ->when($request->min_price,function ($q) use($request) {
                    $q->whereBetween('price',[$request->min_price,$request->max_price]);
                })
//                ->when($request->max_price,function ($q) use($request) {
//                    $q->where('price','>=',$request->max_price);
//                })
                ->get();
            $this->data = $services;
            $this->message ='Get All Services Listing';
            $this->status = 200;
            $response = [
                'message' => $this->message,
                'data' => $this->data,
                'status' =>$this->status
            ];

            return response($response);
        } catch (Exception $e) {
            return response($e->getMessage());
        }
    }
    /*Api for mobile App*/
    public function serviceListing(Request $request){

        Assets::addStylesDirectly(['vendor/core/plugins/ecommerce/css/ecommerce.css'])
            ->addScriptsDirectly([
                'vendor/core/plugins/ecommerce/libraries/jquery.textarea_autosize.js',
                'vendor/core/plugins/ecommerce/js/order-create.js',
            ])
            ->addScripts(['blockui', 'input-mask']);

        $services = Service::where('status',Service::ACTIVE_STATUS)
            ->when($request->featured,function ($q) use($request) {
                $q->where('is_featured','like',"%".$request->featured."%");
            })
            ->when($request->name,function ($q) use($request) {
                $q->where('name','like',"%".$request->name."%");
            })
            ->when($request->category_id,function ($q) use($request) {
                $q->where('category_id','like',"%".$request->category_id."%");
            })
            ->when($request->country,function ($q) use($request) {
                $q->where('country','like',"%".$request->country."%");
            })
            ->when($request->state,function ($q) use($request) {
                $q->where('state','like',"%".$request->state."%");
            })
            ->when($request->city,function ($q) use($request) {
                $q->where('city','like',"%".$request->city."%");
            })
            ->when($request->service_type,function ($q) use($request) {
                $q->where('service_type','like',"%".$request->service_type."%");
            })
            ->when($request->min_price,function ($q) use($request) {
                $q->whereBetween('price',[$request->min_price,$request->max_price]);
            })
            ->when($request->user_id,function ($q) use($request) {
                $q->where('user_id','like',"%".$request->user_id."%");
            })
            ->get();
        return view('plugins/ecommerce::themes.services.service-listing',compact('services'));

    }
    public function createService(Request $request){

        try {
            $validator = \Validator::make($request->all(), [
                'user_id' => 'required',
                'name' => 'required',
                'description' => 'required',
                'availability' => 'required',
                'price' => 'required',
                'featured' => 'required',
                'service_type' => 'required',
                'price_type' => 'required',
                'start_time' => 'nullable|required_if:price_type,2',
                'end_time' => 'nullable|required_if:price_type,2',
            ]);
            if ($validator->fails()) {
                $this->status = 422;
                $response = [
                    'message' => $validator->errors()->first(),
                    'status' =>$this->status
                ];
                return response()->json($response,$this->status);
            }
            $customer = Customer::where('id', $request->user_id)->first();
            if ($customer){
                $service = new Service();
                $service->user_id = $customer->id;
                $service->name = $request->name;
                $service->description = $request->description;
                $service->availability = $request->availability;
                $service->price = $request->price;
                $service->is_featured = $request->featured;
                $service->price_type = $request->price_type;
                $service->service_type = $request->service_type;
                $service->category_id = $request->category_id;
                $service->country = $request->country;
                $service->state = $request->state;
                $service->city = $request->city;
                $service->status = Service::ACTIVE_STATUS;
                $service->start_time = $request->start_time;
                $service->end_time = $request->end_time;
                if ($request->hasFile('image')) {
                    $mimeType = $request->file('image')->getMimeType();
                    $originalName = $request->file('image')->getClientOriginalName();
                    $imageExtension = time() . '.' . $request->file('image')->getClientOriginalExtension();
                    $imagePath = $request->file('image')->store('assets/uploads', 'public');
                    $service->image = json_encode([
                        'name' => $originalName,
                        'extension' => $imageExtension,
                        'mimeType' => $mimeType,
                        'imgPath' => $imagePath,
                    ]);
                }
                $service->save();
                $this->data = $service;
                $this->message ='Service created successfully';
                $this->status = 201;
                $response = [
                    'message' => $this->message,
                    'data' => $this->data,
                    'status' =>$this->status
                ];
                return response($response);
            } else {
                return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
            }
        } catch (Exception $e) {
            return response($e->getMessage());
        }
    }
    public function updateService(Request $request){

        try {
            $customer = Customer::where('id', $request->user_id)->first();
            if ($customer) {
                $service = Service::where('id', $request->id)->update([
                    'name' => $request->name,
                    'description' => $request->description,
                    'availability' => $request->availability,
                    'price' => $request->price,
                    'is_featured' => $request->featured,
                    'service_type' => $request->service_type,
                    'price_type' => $request->price_type,
                    'category_id' => $request->category_id,
                    'country' => $request->country,
                    'state' => $request->state,
                    'city' => $request->city,
                ]);
                if ($request->hasFile('image')) {
                    $mimeType = $request->file('image')->getMimeType();
                    $originalName = $request->file('image')->getClientOriginalName();
                    $imageExtension = time() . '.' . $request->file('image')->getClientOriginalExtension();
                    $imagePath = $request->file('image')->store('assets/uploads', 'public');
                    $service->image = json_encode([
                        'name' => $originalName,
                        'extension' => $imageExtension,
                        'mimeType' => $mimeType,
                        'imgPath' => $imagePath,
                    ]);
                }
                $service->update();
                $this->data = $service;
                $this->message ='Service updated successfully';
                $this->status = 201;
                $response = [
                    'message' => $this->message,
                    'data' => $this->data,
                    'status' =>$this->status
                ];
                return response($response);
            } else {
                return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
            }
        } catch (Exception $e) {
            return returnResponse(false, 401, '', $e->getMessage());
        }
    }
    public function VendorServices(Request $request){
        try {
            $services = Service::where('status',Service::ACTIVE_STATUS)
                ->when($request->featured,function ($q) use($request) {
                    $q->where('is_featured','like',"%".$request->featured."%");
                })
                ->when($request->name,function ($q) use($request) {
                    $q->where('name','like',"%".$request->name."%");
                })
                ->when($request->category_id,function ($q) use($request) {
                    $q->where('category_id','like',"%".$request->category_id."%");
                })
                ->when($request->country,function ($q) use($request) {
                    $q->where('country','like',"%".$request->country."%");
                })
                ->when($request->state,function ($q) use($request) {
                    $q->where('state','like',"%".$request->state."%");
                })
                ->when($request->city,function ($q) use($request) {
                    $q->where('city','like',"%".$request->city."%");
                })
                ->when($request->service_type,function ($q) use($request) {
                    $q->where('service_type','like',"%".$request->service_type."%");
                })
                ->get();
            $this->data = $services;
            $this->message ='Get All Services Listing';
            $this->status = 200;
            $response = [
                'message' => $this->message,
                'data' => $this->data,
                'status' =>$this->status
            ];

            return response($response);
        } catch (Exception $e) {
            return response($e->getMessage());
        }
    }
    public function deleteService(Request $request){
        $service_id = $request->service_id;
        try {
            $service = Service::find($service_id);
            if ($service){
                $service->delete();
                $this->message ='Service deleted successfully';
                $this->status = 200;
                $response = [
                    'message' => $this->message,
                    'status' =>$this->status
                ];
                return response()->json($response,$this->status);
            } else {
                $this->message ="Service doesn't exist";
                $this->status = 402;
                $response = [
                    'message' => $this->message,
                    'status' =>$this->status
                ];
                return response()->json($response,$this->status);
            }

        } catch (Exception $e) {
            return returnResponse(false, 401, '', $e->getMessage());
        }
    }
    public function ServiceBooking(Request $request){
        try {
            $customer = Customer::where('id',$request->user_id)->first();
            if ($customer) {
                $rules = [
                    'service_id'  => 'required',
                    'date'  => 'required|date|after:yesterday',
                    'start_time' => 'nullable|required_if:price_type,2',
                    'end_time' => 'nullable|required_if:price_type,2|after:start_time',
                ];
                $messages = [
                    'service_id.required' => __('Service ID is required'),
                    'date.required' => __('Date is required'),
                    'date.date' => __('Date type must be date format'),
                    'date.after' => __('Date is greater then or equal to today'),
                    'start_time.required' => __('Start time is required'),
                    'end_time.after' => __('End time always after the start time'),
                ];

                $validator = \Validator::make($request->all(), $rules, $messages);
                if ($validator->fails()) {
                    $this->status = 422;
                    $response = [
                        'message' => $validator->errors()->first(),
                        'status' => $this->status
                    ];
                    return response()->json($response,$this->status);
                }
                $service = Service::where('id',$request->service_id)->first();
                $serviceBookingAlready = null;
                if ($service->price_type == Service::FIXED_RATE){
                    $serviceBookingAlready =ServiceBooking::where('service_id',$request->service_id)
                        ->whereDate('date',$request->date)
                        ->first();
                    if ($serviceBookingAlready){
                        $this->message = 'Service is already booked at this date. Please choose another date.';
                        return returnResponse(false, 401, '',  $this->message);
                    }
                    $serviceBooking = new ServiceBooking();
                    $serviceBooking->user_id =$request->user_id;
                    $serviceBooking->service_id =$request->service_id;
                    $serviceBooking->date = $request->date;
                    $serviceBooking->status = ServiceBooking::PENDING_STATUS;
                    $serviceBooking->save();
                    $this->data = $serviceBooking;
                    $this->message ='Service Booked Successfully';
                    $this->status = 200;
                    $response = [
                        'message' => $this->message,
                        'data' => $this->data,
                        'status' =>$this->status
                    ];
                } else {
                    $service = Service::where('id',$request->service_id)
                        ->where('start_time','<=',$request->start_time)
                        ->where('end_time','>=',$request->end_time)
                        ->first();
                    if($service){
                        $startTime = $request->start_time; // Start time in 24-hour format, e.g., '09:00:00'
                        $endTime = $request->end_time;     // End time in 24-hour format, e.g., '10:00:00'

                        $serviceBookingAlready = ServiceBooking::where('service_id',$request->service_id)
                            ->whereDate('date',$request->date)
                            ->where(function ($q) use ($startTime, $endTime) {
                                $q->where(function ($q) use ($startTime, $endTime) {
                                    // Check if the record's start_time is before or equal to the given end time
                                    $q->whereTime('start_time', '<=', $endTime)
                                        // Check if the record's end_time is after or equal to the given start time
                                        ->whereTime('end_time', '>=', $startTime);
                                })->orWhere(function ($q) use ($startTime, $endTime) {
                                    // Check if the record's start_time is after or equal to the given start time
                                    $q->whereTime('start_time', '>=', $startTime)
                                        // Check if the record's start_time is before or equal to the given end time
                                        ->whereTime('start_time', '<=', $endTime);
                                });
                            })

                            ->get();
//                        dd($serviceBookingAlready->count());
                        if ($serviceBookingAlready->count() > 0){
                            $this->message = 'Service is already booked Between this selected time. Please choose another time.';
                            return returnResponse(false, 401, '',  $this->message);
                        }
                        $serviceBooking = new ServiceBooking();
                        $serviceBooking->user_id =$request->user_id;
                        $serviceBooking->service_id =$request->service_id;
                        $serviceBooking->date = $request->date;
                        $serviceBooking->start_time = $request->start_time;
                        $serviceBooking->end_time = $request->end_time;
                        $serviceBooking->status = ServiceBooking::PENDING_STATUS;
                        $serviceBooking->save();
                        $this->data = $serviceBooking;
                        $this->message ='Service Booked Successfully';
                        $this->status = 200;

                    } else {
                        $this->message = 'Choose service booking time duration between the availability time.';
                        return returnResponse(false, 401, '',  $this->message);
                    }
                }
                $response = [
                    'message' => $this->message,
                    'data' => $this->data,
                    'status' =>$this->status
                ];
                $cartItems = OrderHelper::handleAddToCartService($serviceBooking, $request);

                $token = OrderHelper::getOrderSessionToken();

                $nextUrl = route('public.checkout.information', $token);

                if (EcommerceHelper::getQuickBuyButtonTarget() == 'cart') {
                    $nextUrl = route('public.cart');
                }
                return response($response);
            }
            else {
                return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
            }
        } catch (Exception $e) {
            return returnResponse(false, 401, '',$e->getMessage());
        }
    }
    public function updateBookedServiceStatus(Request $request){
        try {
            $customer = Customer::where('id', $request->user_id)->first();
            if ($customer) {
                $rules = [
                    'id' => 'required',
                    'status' => 'required',
                ];
                $messages = [
                    'id.required' => __('Service ID is required'),
                    'status.required' => __('Status is required'),
                ];
                $validator = \Validator::make($request->all(), $rules, $messages);
                if ($validator->fails()) {
                    $this->status = 422;
                    $response = [
                        'message' => $validator->errors()->first(),
                        'status' => $this->status
                    ];
                    return response()->json($response, $this->status);
                }
                $serviceBooking = ServiceBooking::find($request->id);
                if ($request->status == ServiceBooking::PENDING_STATUS) {
                    $serviceBooking->status = $request->status;
                    $serviceBooking->save();
                } else if ($request->status == ServiceBooking::COMPLETED_STATUS) {
                    if ($serviceBooking->status == ServiceBooking::COMPLETED_STATUS) {
                        return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.statusAlreadyCompleted'));
                    } else {
                        $serviceBooking->status = $request->status;
                        $serviceBooking->save();
                        $vendorInfo = VendorInfo::where('customer_id', $request->user_id)->first();
                        if ($vendorInfo) {
                            $vendorInfo->balance = $vendorInfo->balance + $serviceBooking->amount;
                            $vendorInfo->update();
                        }
                        $this->data = $serviceBooking;
                        $this->message = 'Service Booked Successfully';
                        $this->status = 200;
                        $response = [
                            'message' => $this->message,
                            'data' => $this->data,
                            'status' => $this->status
                        ];
                        return response($response);
                    }
                } else {
                    return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
                }
            }
        } catch (Exception $e) {
            return returnResponse(false, 401, '',$e->getMessage());
        }
    }
    public function ServiceBookingPayment(Request $request){
        $messages = [];

        $rules = [
            'charge_id' => 'required',
            'payment_channel' => 'required',
            'currency' => 'required',
            'amount' => 'required',
            'status' => 'required',
            'service_id' => 'required',
        ];

        $validator = \Validator::make($request->all(), $rules, $messages);
        if ($validator->fails()) {
            $this->status = 422;
            $response = [
                'message' => $validator->errors()->first(),
                'status' =>$this->status
            ];
            return response()->json($response,$this->status);
        }


        $email = $request->email;
        $customer = Customer::where('email',$email)->first();
        if ($customer){
            $service = ServiceBooking::where('service_id',$request->service_id)
                ->where('user_id',$customer->id)
                ->where('status',ServiceBooking::PENDING_STATUS)
                ->first();
            if ($service) {
                $payment =new Payment();
                $payment->currency = $request->currency;
                $payment->user_id = $customer->id;
                $payment->charge_id = $request->charge_id;
                $payment->payment_channel = $request->payment_channel;
                $payment->description = $request->description;
                $payment->amount = $request->amount;
                $payment->order_id = 0;
                $payment->status = $request->status;
                $payment->customer_id = $customer->id;
                $payment->customer_type = new Customer();
                $payment->metadata =$request->metadata;
                $payment->service_id = $request->service_id;
                $payment->save();
                $service->status = ServiceBooking::PAID_STATUS;
                $service->update();
                $this->status = 200;
                $this->message = 'your Payment is done';
                $response = [
                    'message' => $this->message,
                    'status' =>$this->status,
                    'data' => $service,
                ];

                return response($response);
            } else {
                return returnResponse(false, 401, '', 'Service is not available');
            }
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }
    public function attachAccount(Request $request){
        try {
            $messages = [];
            $id = $request->user_id;
            $customer = Customer::where('id', $id)->first();
            if ($customer) {
                \Stripe\Stripe::setApiKey('sk_test_51JmYSiGGiAmnc7rU4G1LdAVC7OrWAWRk8HAR6mLGeTFc4Q7lsOrUvG9hfnam3US1fK5zF7pq6n5mx72DDlA6C0Je00WATmye1H');;
                $rules = [
                    'account_holder_name' => 'required',
                    'account_holder_type' => 'required',
                    'currency' => 'required',
                    'routing_number' => 'required',
                    'account_number' => 'required',
                    'dob' => 'required',
                    'ssn' => 'required',
                ];

                $validator = \Validator::make($request->all(), $rules, $messages);
                if ($validator->fails()) {
                    $this->status = 422;
                    $response = [
                        'message' => $validator->errors()->first(),
                        'status' => $this->status
                    ];
                    return response()->json($response, $this->status);
                }
                $customerProfile = Address::where('customer_id', $customer->id)->first();
                $customerPayout = Payout::where('user_id', $customer->id)->first();
                if ($customerProfile == null) {
                    $this->status = 422;
                    $response = [
                        'status' => $this->status,
                        'message' => 'Please first update your Address',
                    ];
                    return response()->json($response, $this->status);
                }
                if ($customerPayout == null) {
                    // create stripe account
                    $stripeAccount = \Stripe\Account::create([
                        "capabilities" => ['card_payments' => ['requested' => true], 'transfers' => ['requested' => true],
                        ],
                        "type" => "custom",
                        "country" => 'US',
                        "email" => $customer->email,
                        "business_type" => $request->account_holder_type,
                        'business_profile' => ['product_description' => 'testing', 'mcc' => '5734'],
                        "individual" => [
                            'address' => [
                                'city' => $customerProfile->city,
                                'state' => $customerProfile->state,
                                'line1' => $customerProfile->address,
                                'postal_code' => $customerProfile->zip_code,
                            ],
                            'dob' => [
                                "day" => substr($request->dob, -10, 2),
                                "month" => substr($request->dob, -7, 2),
                                "year" => substr($request->dob, -4, 4),
                            ],
                            "email" => $customer->email,
                            "first_name" => $customer->first_name,
                            "last_name" => $customer->last_name,
                            "gender" => $customer->gender,
                            "phone" => $customer->phone,
                            "ssn_last_4" => substr($request->ssn, -4),
                        ],
                    ]);

                    // create bank account token
                    $bankToken = \Stripe\Token::create([
                        'bank_account' => [
                            'country' => $customerProfile->country,
                            'currency' => $request->currency,
                            'account_holder_name' => $request->account_holder_name,
                            'account_holder_type' => $request->account_holder_type,
                            'routing_number' => $request->routing_number,
                            'account_number' => $request->account_number,
                        ],
                    ]);

                    // third link the bank account with the stripe account
                    $bankAccount = \Stripe\Account::createExternalAccount(
                        $stripeAccount->id, ['external_account' => $bankToken->id]
                    );
                    // Fourth stripe account update for tos acceptance
                    \Stripe\Account::update(
                        $stripeAccount->id, [
                            'tos_acceptance' => [
                                'date' => time(),
                                'ip' => $_SERVER['REMOTE_ADDR'], // Assumes you're not using a proxy
                            ],
                        ]
                    );

                    $this->data = ["bankToken" => $bankToken->id, "stripeAccount" => $stripeAccount->id, "bankAccount" => $bankAccount->id];

                    $customerPayout = new Payout();
                    $customerPayout->user_id = $customer->id;
                    $customerPayout->bank_token = $bankToken->id;
                    $customerPayout->stripe_account = $stripeAccount->id;
                    $customerPayout->bank_account = $bankAccount->id;
                    $customerPayout->bank_information = json_encode($request->all());
                    $customerPayout->save();
                    $this->message = 'Bank account attached successfully';
                    $this->status = 201;
                    $response = [
                        'message' => $this->message,
                        'data' => $this->data,
                        'status' => $this->status
                    ];
                    return response($response);
                } else {
                    $stripeAccount = $customerPayout->stripe_account;
                    $bankAccount = $customerPayout->bank_account;

                    // create bank account token
                    $bankToken = \Stripe\Token::create([
                        'bank_account' => [
                            'country' => $customerProfile->country,
                            'currency' => $request->currency,
                            'account_holder_name' => $request->account_holder_name,
                            'account_holder_type' => $request->account_holder_type,
                            'routing_number' => $request->routing_number,
                            'account_number' => $request->account_number,
                        ],
                    ]);
                    // third link the bank account with the stripe account
                    $bankAccount = \Stripe\Account::createExternalAccount(
                        $stripeAccount, ['external_account' => $bankToken['id']]
                    );
                    // Fourth stripe account update for tos acceptance
                    \Stripe\Account::update(
                        $stripeAccount, [
                            'tos_acceptance' => [
                                'date' => time(),
                                'ip' => $_SERVER['REMOTE_ADDR'], // Assumes you're not using a proxy
                            ],
                        ]
                    );

                    $this->data = ["bankToken" => $bankToken['id'], "stripeAccount" => $stripeAccount, "bankAccount" => $bankAccount['id']];
                    $payout = new Payout();
                    $payout->user_id = $customer->id;
                    $payout->bank_token = $bankToken['id'];
                    $payout->stripe_account = $stripeAccount;
                    $payout->bank_account = $bankAccount['id'];
                    $payout->bank_information = json_encode($request->all());
                    $payout->save();

                    $this->message = 'Bank account attached successfully';
                    $this->status = 201;
                    $response = [
                        'message' => $this->message,
                        'data' => $this->data,
                        'status' => $this->status
                    ];
                }
                return response($response);
            }
            else {
                return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
            }
        } catch (\Stripe\Error\Card $e) {
            // Since it's a decline, \Stripe\Error\Card will be caught
            return [
                'success' => '0',
                'message' => $e->getMessage(),
            ];
        } catch (\Stripe\Error\RateLimit $e) {
            return [
                'success' => '0',
                'message' => "To many requests",
            ];
            // Too many requests made to the API too quickly
            return "To many requests";
        } catch (\Stripe\Error\InvalidRequest $e) {
            // Invalid parameters were supplied to Stripe's API
            return [
                'success' => '0',
                'message' => $e->getJsonBody()['error']['message'],
            ];
        } catch (\Stripe\Error\Authentication $e) {
            // Authentication with Stripe's API failed
            return [
                'success' => '0',
                'message' => "Invalid auth",
            ];
        } catch (\Stripe\Error\ApiConnection $e) {
            // Network communication with Stripe failed
            return [
                'success' => '0',
                'message' => "Error in network communication",
            ];
        } catch (\Stripe\Error\Base $e) {
            // Display a very generic error to the user, and maybe send
            // yourself an email
            return [
                'success' => '0',
                'message' => $e->getJsonBody()['error']['message'],
            ];
        }
        catch(\Stripe\Exception\InvalidRequestException $e){
            return [
                'success' => '0',
                'message' => $e->getJsonBody()['error']['message'],
            ];
        } catch (Exception $e) {
            // Something else happened, completely unrelated to Stripe
            return [
                'success' => '0',
                'message' => $e->getMessage(),
            ];
        }

    }
    public function accountBalance(Request $request)
    {
        $user_id =$request->user_id;
        $customer =Customer::where('id',$user_id)->first();
        if ($customer){
            $store = Store::where('customer_id',$customer->id)->first();
            if ($store){
                $payments =Order::join('payments', 'payments.id', '=', 'ec_orders.payment_id')
                    ->where('payments.status', PaymentStatusEnum::COMPLETED)
                    ->where('ec_orders.store_id', $store->id)
                    ->where('payments.payment_type',Payment::PAYMENT_CONFIRMED)
                    ->get();
                $this->status = 200;
                $this->message = 'your payout balance';
                $response = [
                    'message' => $this->message,
                    'status' =>$this->status,
                    'data' => $payments,
                ];
                return response($response,$this->status);
            } else {
                return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.storeNotFound'));
            }
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }

    }
    public function getEarningBalance(Request $request)
    {
        $customer = Customer::where('id',$request->user_id)->first();
        if ($customer) {
            $store = Store::where('customer_id',$customer->id)->first();
            [$startDate, $endDate] = EcommerceHelper::getDateRangeInReport($request);
            $revenues = DB::table('ec_orders')
                ->join('payments', 'payments.id', '=', 'ec_orders.payment_id')
                ->whereDate('payments.created_at', '>=', $startDate)
                ->whereDate('payments.created_at', '<=', $endDate)
                ->where('payments.status', PaymentStatusEnum::COMPLETED)
                ->where('ec_orders.store_id', $store->id)
                ->groupBy('date')
                ->selectRaw('SUM(COALESCE(payments.amount, 0) - COALESCE(payments.refunded_amount, 0)) as revenue')
                ->selectRaw('DATE(payments.created_at) AS date')
                ->get();
            $series = [];
            $dates = [];
            $earningSales = collect([]);
            $period = CarbonPeriod::create($startDate, $endDate);

            $colors = ['#fcb800', '#80bc00'];

            $data = [
                'Currency' => get_application_currency()->title,
                'data' => collect([]),
            ];

            foreach ($period as $date) {
                $value = $revenues
                    ->where('date', $date->format('Y-m-d'))
                    ->sum('revenue');
                $data['data'][] = $value;
            }

            $earningSales  = format_price($data['data']->sum());

            $series[] = $data;

            foreach ($period as $date) {
                $dates[] = $date->format('Y-m-d');
            }

            $this->status = 200;
            $this->message = 'your Revenue History';
            $response = [
                'message' => $this->message,
                'status' =>$this->status,
                'data' => [
                    'earning_sales' => $earningSales,
                    'series' => $series,
                    'dates' => $dates,
                ],
            ];
            return response($response,$this->status);
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));

        }

    }
    public function getStats(Request $request){
        $customer = Customer::where('id',$request->user_id)->first();
        if ($customer) {
            $store = Store::where('customer_id',$customer->id)->first();
            if ($store){
                $orders = Order::where('store_id',$store->id)->count();
                $products = Product::where('store_id',$store->id)->count();
                $revenuesList = DB::table('ec_orders')
                    ->join('payments', 'payments.id', '=', 'ec_orders.payment_id')
                    ->where('payments.status', PaymentStatusEnum::COMPLETED)
                    ->where('ec_orders.store_id', $store->id)
                    ->selectRaw('SUM(COALESCE(payments.amount, 0) - COALESCE(payments.refunded_amount, 0)) as revenue')
                    ->get();
                $revenues = json_decode($revenuesList,true);
                $revenue = $revenues[0]['revenue'];

                $this->status = 200;
                $this->message = 'your Stats';
                $response = [
                    'message' => $this->message,
                    'status' =>$this->status,
                    'data' => [
                        'orders' => $orders,
                        'products' => $products,
                        'revenue' => $revenue,
                    ],
                ];
                return response($response,$this->status);
            } else {
                return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.storeNotFound'));
            }
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));

        }
    }
    public function getShopInfo(Request $request){
        $customer = Customer::where('id',$request->user_id)->first();
        if ($customer) {
            $store = Store::where('customer_id',$customer->id)
                ->with('productsList')
                ->first();
            if ($store) {
                $this->status = 200;
                $this->message = 'your Store Information';
                $response = [
                    'message' => $this->message,
                    'status' =>$this->status,
                    'data' =>  $store
                ];
                return response($response,$this->status);
            } else {
                return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.storeNotFound'));
            }
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));

        }
    }
    public function getAccountDetails(Request $request){
        $customer = Customer::where('id',$request->user_id)->first();
        if ($customer) {
            $payout = Payout::where('user_id',$customer->id)
                ->first();
            if ($payout) {
                $this->status = 200;
                $this->message = 'your Account Information';
                $response = [
                    'message' => $this->message,
                    'status' =>$this->status,
                    'data' =>  $payout
                ];
                return response($response,$this->status);
            } else {
                return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.bankNotFound'));
            }
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));

        }
    }
    public function withDrawalRequest(Request $request){
        $customer = Customer::where('id',$request->user_id)->first();
        if ($customer) {
            $vendorInfo = VendorInfo::where('customer_id',$customer->id)
                ->where('bank_info','!=', null)
                ->where('balance','>',1)
                ->first();
            if ($vendorInfo) {
                if ($vendorInfo->balance >= $request->balance) {
                    $withdrawal = new Withdrawal();
                    $withdrawal->customer_id = $customer->id;
                    $withdrawal->fee = $vendorInfo->total_fee;
                    $withdrawal->amount = $request->balance;
                    $withdrawal->current_balance = $vendorInfo->balance;
                    $withdrawal->currency = 'USD';
                    $withdrawal->description = $request->description;
                    $withdrawal->bank_info = $vendorInfo->bank_info;
                    $withdrawal->user_id = $customer->id;
                    $withdrawal->status = WithdrawalStatusEnum::PENDING;
                    $withdrawal->save();
                    $this->status = 200;
                    $this->message = 'your Request has been sent to Admin after approval your balance is send to your account';
                    $response = [
                        'message' => $this->message,
                        'status' =>$this->status,
                        'data' =>  $withdrawal
                    ];
                    return response($response,$this->status);
                }
                else{
                    return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.balanceIsLow'));

                }
            } else {
                return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.bankNotFound'));
            }
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));

        }
    }
    public function transferBalanceToBankAccount(Request $request)
    {
        $customers = Customer::where('is_vendor',1)->get();
        foreach ($customers as $customer){
            $id = $customer->id;
            \Stripe\Stripe::setApiKey('sk_test_51JmYSiGGiAmnc7rU4G1LdAVC7OrWAWRk8HAR6mLGeTFc4Q7lsOrUvG9hfnam3US1fK5zF7pq6n5mx72DDlA6C0Je00WATmye1H');
            $customerPayout = Payout::where('user_id',$id)->first();
            if ($customerPayout) {
                $withdrawalRequest = Withdrawal::where('customer_id',$id)
                    ->where('status',BaseStatusEnum::PENDING)
                    ->first();
                if ($withdrawalRequest){
                    $vendorInfo = VendorInfo::where('customer_id',$id)->first();
                    if ($vendorInfo){
                        $balance = $vendorInfo->balance;
                        if($balance > 0 && ($balance >= $withdrawalRequest->amount)) {
                            if ($this->stripeBalance() > $balance){
                                $transaction = \Stripe\Transfer::create([
                                    "amount" => round(($withdrawalRequest->amount) * 100),
                                    "currency" => "usd",
                                    "destination" => $customerPayout->stripe_account,
                                    "transfer_group" => $withdrawalRequest->id,
                                ]);
                                $withdrawalRequest->status = WithdrawalStatusEnum::COMPLETED;
                                $withdrawalRequest->payment_channel = 'STRIPE';
                                $withdrawalRequest->transaction_id = $transaction->id;
                                $withdrawalRequest->update();
                                $vendorInfo->balance = $vendorInfo->balance - $customerPayout->balance;
                                $vendorInfo->update();
//                                dd($withdrawalRequest , $balance , $withdrawalRequest->amount);
                                return true;
                            }
                        }

                    }
                }
            }
        }
    }
    public function stripeBalance()
    {
        \Stripe\Stripe::setApiKey(config('services.stripe.secret'));

        return \Stripe\Balance::retrieve()->available[0]->amount / 100;
    }
    public function payout()
    {

        if ($this->stripeBalance() > $totalAmount){
            foreach ($payouts as $payout) {
                if($payout['amount'] > 0)
                {
                    $bookingIDs = [];
                    $healerPayableIDs = [];

                    foreach($payout['detail'] as $detail){
                        if(!in_array($detail['booking_id'], $bookingIDs)){
                            $bookingIDs[] = $detail['booking_id'];
                        }
                        $healerPayableIDs[] = $detail['id'];
                    }

                    $payoutModel = \App\Payout::forceCreate([
                        'user_id' => $payout['healer_id'],
                        'amount' => $payout['amount'],
                    ]);
                    if($payout['stripeAccount']){

                        try{
                            $transaction = \Stripe\Transfer::create([
                                "amount" => round(($payout['amount']) * 100),
                                "currency" => "usd",
                                "destination" => $payout['stripeAccount'],
                                "transfer_group" => $payoutModel->id,
                            ]);

                        }catch (\Exception $e) {
                            continue;
                        }

                        $payoutModel->transaction_id = $transaction->id;
                        $payoutModel->update();

                        HealerPayable::whereIn('id', $healerPayableIDs)->update(['payout_id' => $payoutModel->id]);
                        Booking::whereIn('id', $bookingIDs)->update(['payout_id' => $payoutModel->id]);
                    }
                }

            }
        }
        else {
            return [
                'success' => '0',
                'message' => 'you do not have enough balance in your stripe account to complete payouts of amount ' . $totalAmount,
            ];
        }
        return [
            'payables' => array_values($payouts),
            'total' => $totalAmount
        ];
    }
    public function appImageUpload(Request $request) {
        $input = request()->all();

        $user = Customer::where('id', $input['user_id'])->first();

        if($user) {
            $result = RvMedia::handleUpload($request->file('image'), 25, 'images');
            $file = $result['data'];
//            $input['image'] = RvMedia::url($file->url);
            $rvMedia = MediaFile::where('id',$file['id'])->first();
            $rvMedia->user_id = $input['user_id'];
            $rvMedia->update();
//            dd($file->id ,$rvMedia);
//            $update = VerificationDoc::create($input);

            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.uploadDocumentSuccessfully'),$rvMedia);
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.uploadDocumentFailed'));
        }
    }


}
