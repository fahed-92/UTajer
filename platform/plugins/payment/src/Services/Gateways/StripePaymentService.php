<?php

namespace Botble\Payment\Services\Gateways;
use Botble\Ecommerce\Models\Address;
use Botble\Ecommerce\Models\ServiceBooking;
use Botble\Payment\Enums\PaymentMethodEnum;
use Botble\Payment\Enums\PaymentStatusEnum;
use Botble\Payment\Services\Abstracts\StripePaymentAbstract;
use Botble\Payment\Supports\StripeHelper;
use Exception;
use Illuminate\Http\Request;
use Stripe\Charge;
use Stripe\Exception\ApiErrorException;

class StripePaymentService extends StripePaymentAbstract
{
    /**
     * Make a payment
     *
     * @param Request $request
     *
     * @return mixed
     * @throws ApiErrorException
     */
    public function makePayment(Request $request)
    {
        $this->amount = $request->input('amount');
        $this->currency = $request->input('currency', config('plugins.payment.payment.currency'));
        $this->currency = strtoupper($this->currency);
        $description = $request->input('description');
        $data = $request->address;
        if ($data['address_id']){
            $address =Address::find($data['address_id']);
            $data['zip_code'] = $address->zip_code;
            $data['country'] =  $address->country;
            $data['state'] =  $address->state;
            $data['city'] =  $address->city;
            $data['address'] =  $address->address;
            $data['name'] =  $address->name;
            $data['email'] =  $address->email;
            $data['phone'] =  $address->phone;
        }
//        dd($request->all(),$data);
        $this->setClient();

        $amount = $this->amount;

        $multiplier = StripeHelper::getStripeCurrencyMultiplier($this->currency);

        if ($multiplier > 1) {
            $amount = (int)(round((float)$amount, 2) * $multiplier);
        }
        $charge = Charge::create([
            'amount'      => $amount,
            'currency'    => $this->currency,
            'source'      => $this->token,
            'description' => $description,
            'shipping' => [
                'address' => [
                    'postal_code'=>$data['zip_code'],
                    'country'=>$data['country'],
                    'state' =>$data['state'],
                    'city'=>$data['city'],
                    'line1'=>$data['address'],
                    'line2'=>$data['address'],
                ],
                'name'      => $request->name,
            ]
        ]);
        $chargeId = $charge['id'];
        return $chargeId;
    }

    /**
     * Use this function to perform more logic after user has made a payment
     *
     * @param string $chargeId
     * @param Request $request
     *
     * @return mixed
     */
    public function afterMakePayment($chargeId, Request $request)
    {
        $serviceIds = [];
         try {
            $payment = $this->getPaymentDetails($chargeId);
            if ($payment && ($payment->paid || $payment->status == 'succeeded')) {
                $paymentStatus = PaymentStatusEnum::COMPLETED;
            } else {
                $paymentStatus = PaymentStatusEnum::FAILED;
            }
        } catch (Exception $exception) {
            $paymentStatus = PaymentStatusEnum::FAILED;
        }
        if ($request->serviceToken)
        {
            $bookedServices = ServiceBooking::where('token',$request->serviceToken)
                ->where('status',ServiceBooking::PENDING_STATUS)
                ->get()
                ->pluck('id');
            $serviceIds = $bookedServices;
        }
        $orderIds = (array)$request->input('order_id', []);
        do_action(PAYMENT_ACTION_PAYMENT_PROCESSED, [
            'amount'            => $request->input('amount'),
            'currency'          => $request->input('currency'),
            'charge_id'         => $chargeId,
            'order_id'          => $orderIds,
            'booked_service_id' => $serviceIds,
            'customer_id'       => $request->input('customer_id'),
            'customer_type'     => $request->input('customer_type'),
            'payment_channel'   => PaymentMethodEnum::STRIPE,
            'status'            => $paymentStatus,
        ]);
        if ($request->serviceToken)
        {
            $bookedService = ServiceBooking::where('token',$request->serviceToken)->update([
                'status' =>  ServiceBooking::PAID_STATUS
            ]);
        }

        return $chargeId;
    }

}
