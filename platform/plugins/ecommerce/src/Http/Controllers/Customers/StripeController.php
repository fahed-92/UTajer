<?php

namespace Botble\Ecommerce\Http\Controllers\Customers;

use App\Http\Controllers\Controller;
use Assets;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Events\UpdatedContentEvent;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Ecommerce\Models\Order;
use Botble\Ecommerce\Models\Customer;
use Botble\Ecommerce\Models\OrderHistory;
use Botble\Ecommerce\Models\Store;
use Botble\Ecommerce\Models\Cart;
use Botble\Ecommerce\Enums\OrderStatusEnum;
use Botble\Ecommerce\Enums\ShippingMethodEnum;
use Botble\Ecommerce\Enums\ShippingStatusEnum;
use Botble\Ecommerce\Http\Requests\AddressRequest;
use Botble\Ecommerce\Http\Requests\ApplyCouponRequest;
use Botble\Ecommerce\Http\Requests\CreateOrderRequest;
use Botble\Ecommerce\Http\Requests\CreateShipmentRequest;
use Botble\Ecommerce\Http\Requests\RefundRequest;
use Botble\Ecommerce\Http\Requests\UpdateOrderRequest;
use Botble\Ecommerce\Repositories\Interfaces\AddressInterface;
use Botble\Ecommerce\Repositories\Interfaces\CustomerInterface;
use Botble\Ecommerce\Repositories\Interfaces\OrderAddressInterface;
use Botble\Ecommerce\Repositories\Interfaces\OrderHistoryInterface;
use Botble\Ecommerce\Repositories\Interfaces\OrderInterface;
use Botble\Ecommerce\Repositories\Interfaces\OrderProductInterface;
use Botble\Ecommerce\Repositories\Interfaces\ProductInterface;
use Botble\Ecommerce\Repositories\Interfaces\ShipmentHistoryInterface;
use Botble\Ecommerce\Repositories\Interfaces\ShipmentInterface;
use Botble\Ecommerce\Repositories\Interfaces\StoreLocatorInterface;
use Botble\Ecommerce\Services\HandleApplyCouponService;
use Botble\Ecommerce\Services\HandleShippingFeeService;
use Botble\Ecommerce\Tables\OrderIncompleteTable;
use Botble\Ecommerce\Tables\OrderTable;
use Botble\Payment\Enums\PaymentMethodEnum;
use Botble\Payment\Enums\PaymentStatusEnum;
use Botble\Payment\Models\Payment;
use Botble\Payment\Repositories\Interfaces\PaymentInterface;
use EmailHandler;
use Exception;
use Illuminate\Contracts\Filesystem\FileNotFoundException;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Illuminate\View\View;
use OrderHelper;
use RvMedia;
use Symfony\Component\HttpFoundation\BinaryFileResponse;
use Throwable;
use Session;
use Stripe;

    
class StripeController extends Controller
{
   
    /**
     * success response method.
     *
     * @return \Illuminate\Http\Response
     */

    public function stripeToken(Request $request)
    {
        $input = request()->all();
        $customer = Customer::where('id', $input['user_id'])->first();
        if($customer) {
            //Create Stripe Token
            $clientId = setting('payment_stripe_client_id');
            $secret = setting('payment_stripe_secret');

            \Stripe\Stripe::setApiKey($secret);
            $response = \Stripe\Token::create(array(
              "card" => array(
                "number"    => $request->input('card_number'),
                "exp_month" => $request->input('exp_month'),
                "exp_year"  => $request->input('exp_year'),
                "cvc"       => $request->input('cvc'),
                "name"      => $request->input('first_name') . " " . $request->input('last_name')
            )));

            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.TokenCreated'), $response);
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function stripePost(Request $request)
    {
        $input = request()->all();
        $customer = Customer::where('id', $input['user_id'])->first();
        if($customer) {
            $clientId = setting('payment_stripe_client_id');
            $secret = setting('payment_stripe_secret');

            $dataStripe = \Stripe\Stripe::setApiKey($secret);
            $data = Stripe\Charge::create ([
                    "amount" => $input['amount'],
                    "currency" => "usd",
                    "source" => $input['stripeToken'],
                    "description" => "Payment with Stripe"
            ]);
            if($data['status'] == 'succeeded') {
                $stripeData['currency']  = "USD";
                $stripeData['user_id']  = $input['user_id'];
                $stripeData['customer_id']  = $input['user_id'];
                $stripeData['charge_id']  = Str::upper(Str::random(10));
                $stripeData['payment_channel']  = "Stripe";
                $stripeData['amount']  = $input['amount'];
                $stripeData['currency']  = "USD";
                $stripeData['description']  = "Payment with Stripe";
                $payment = Payment::create($stripeData);
            }
            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.PaymentSuccessfull'),$payment);
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function saveData(Request $request)
    {
        $input = request()->all();
        $customer = Customer::where('id', $input['user_id'])->first();
        if($customer) {
            $payment = Payment::where('id',$input['payment_id'])->first();
            if(!empty($payment)) {
                $payment->order_id = $input['order_id'];
                $payment->save();

                $order = Order::where('id',$input['order_id'])->first();
                if($order) {
                    $order->is_finished = 1;
                    $order->payment_id = $input['payment_id'];
                    $order->token = $input['token'];
                    $order->save();

                    Cart::where('user_id',$input['user_id'])->delete();
                }
            }

            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.PaymentSavedSuccessfull')); 
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }
}