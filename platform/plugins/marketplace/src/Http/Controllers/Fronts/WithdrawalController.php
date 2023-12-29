<?php

namespace Botble\Marketplace\Http\Controllers\Fronts;

use Botble\Base\Forms\FormBuilder;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Ecommerce\Models\Address;
use Botble\Ecommerce\Models\Customer;
use Botble\Marketplace\Enums\WithdrawalStatusEnum;
use Botble\Marketplace\Forms\VendorWithdrawalForm;
use Botble\Marketplace\Http\Requests\VendorEditWithdrawalRequest;
use Botble\Marketplace\Http\Requests\VendorWithdrawalRequest;
use Botble\Marketplace\Models\VendorInfo;
use Botble\Marketplace\Models\Withdrawal;
use Botble\Marketplace\Repositories\Interfaces\WithdrawalInterface;
use Botble\Marketplace\Tables\VendorWithdrawalTable;
use Botble\Marketplace\Tables\WithdrawalTable;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\View;
use Stripe\Stripe;
use Throwable;

class WithdrawalController
{
    /**
     * @var WithdrawalInterface
     */
    protected $withdrawalRepository;

    /**
     * WithdrawalController constructor.
     * @param WithdrawalInterface $withdrawalRepository
     */
    public function __construct(WithdrawalInterface $withdrawalRepository)
    {
        $this->withdrawalRepository = $withdrawalRepository;
    }

    /**
     * @param WithdrawalTable $table
     * @return JsonResponse|View|Response
     */
    public function index(VendorWithdrawalTable $table)
    {
        page_title()->setTitle(__('Withdrawals'));

        return $table->render('plugins/marketplace::themes.dashboard.table.base');
    }


    /**
     * @param FormBuilder $formBuilder
     * @return BaseHttpResponse|string
     */
    public function create(FormBuilder $formBuilder, BaseHttpResponse $response)
    {
        $user = auth('customer')->user();

        $fee = get_marketplace_setting('fee_withdrawal', 0);

        if ($user->balance <= $fee || !$user->bank_info) {
            return $response
                ->setError()
                ->setNextUrl(route('marketplace.vendor.withdrawals.index'))
                ->setMessage(__('Insufficient balance or no bank information'));
        }

        page_title()->setTitle(__('Withdrawal request'));

        return $formBuilder->create(VendorWithdrawalForm::class)->renderForm();
    }

    /**
     * @param VendorWithdrawalRequest $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function store(VendorWithdrawalRequest $request, BaseHttpResponse $response)
    {
        $fee = get_marketplace_setting('fee_withdrawal', 0);
        $vendor = auth('customer')->user();
        $vendorInfo = $vendor->vendorInfo;

        DB::beginTransaction();
        try {
            $this->withdrawalRepository->create([
                'fee'             => $fee,
                'amount'          => $request->input('amount'),
                'customer_id'     => $vendor->getKey(),
                'currency'        => get_application_currency()->title,
                'bank_info'       => $vendorInfo->bank_info,
                'description'     => $request->input('description'),
                'current_balance' => $vendorInfo->balance,
            ]);

            $vendorInfo->balance -= $request->input('amount') + $fee;
            $vendorInfo->save();

            DB::commit();
        } catch (Throwable $th) {
            DB::rollBack();
            throw $th;
        }

        return $response
            ->setPreviousUrl(route('marketplace.vendor.withdrawals.index'))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    /**
     * @param int $id
     * @param FormBuilder $formBuilder
     * @return string
     */
    public function edit($id, FormBuilder $formBuilder)
    {
        $customer = auth('customer')->user();
        $withdrawal = $this->withdrawalRepository->getFirstBy([
            'id'          => $id,
            'customer_id' => $customer->id,
            'status'      => WithdrawalStatusEnum::PENDING,
        ]);

        if (!$withdrawal) {
            abort(404);
        }
        page_title()->setTitle(__('Update withdrawal request #' . $id));

        return $formBuilder->create(VendorWithdrawalForm::class, ['model' => $withdrawal])->renderForm();
    }

    /**
     * @param int $id
     * @param VendorEditWithdrawalRequest $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function update($id, VendorEditWithdrawalRequest $request, BaseHttpResponse $response)
    {
        $customer = auth('customer')->user();

        $withdrawal = $this->withdrawalRepository->getFirstBy([
            'id'          => $id,
            'customer_id' => $customer->id,
            'status'      => WithdrawalStatusEnum::PENDING,
        ]);

        if (!$withdrawal) {
            abort(404);
        }

        $status = WithdrawalStatusEnum::PENDING;
        if ($request->get('cancel')) {
            $status = WithdrawalStatusEnum::CANCELED;
            $response->setNextUrl(route('marketplace.vendor.withdrawals.show', $withdrawal->id));
        }

        $withdrawal->fill([
            'status'      => $status,
            'description' => $request->input('description'),
        ]);

        $this->withdrawalRepository->createOrUpdate($withdrawal);

        return $response
            ->setPreviousUrl(route('marketplace.vendor.withdrawals.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    /**
     * @param int $id
     * @param FormBuilder $formBuilder
     * @return string
     */
    public function show($id, FormBuilder $formBuilder)
    {
        $customer = auth('customer')->user();
        $withdrawal = $this->withdrawalRepository
            ->getFirstBy([
                ['id', '=', $id],
                ['customer_id', '=', $customer->id],
                ['status', '!=', WithdrawalStatusEnum::PENDING],
            ]);

        if (!$withdrawal) {
            abort(404);
        }

        page_title()->setTitle(__('View withdrawal request #' . $id));

        return $formBuilder->create(VendorWithdrawalForm::class, ['model' => $withdrawal])->renderForm();
    }
    public function balanceTransferToVendorAccount()
    {
        $secret = setting('payment_stripe_secret');
        $clientId = setting('payment_stripe_client_id');
        if (!$secret || !$clientId) {
            return false;
        }
        Stripe::setApiKey($secret);
        Stripe::setClientId($clientId);
        $customers = Customer::where('is_vendor',Customer::statusActive)
            ->get();
        foreach ($customers as $customer) {
            $customerDOBDate=substr($customer->dob,8);
            $customerDOBMonth=substr($customer->dob,5,2);
            $customerDOBYear=substr($customer->dob,0,4);
            $vendorInfo = VendorInfo::where('customer_id',$customer->id)
                ->where('bank_info','!=', null)
                ->where('balance','>',1)
                ->first();
            if ($vendorInfo){
                $customerAddress = Address::where('customer_id',$customer->id)
                    ->first();
                $country = $customerAddress->country;
                $city = $customerAddress->city;
                $state = $customerAddress->state;
                if ($country == null || $city == null) {
                    return [
                        'success' => '0',
                        'message' => 'Please update your country and city in profile section',
                    ];
                }

                if($vendorInfo->stripeAccount == null || $vendorInfo->stripeAccount == ''){
                    // create stripe account
                    $stripeAccount = \Stripe\Account::create([
                        "capabilities" =>['card_payments' => ['requested' => true],'transfers' => ['requested' => true],
                        ],
                        "type" => "custom",
                        "country" => 'US',
                        "email" => $customer->email,
                        "business_type" => 'individual',
                        'business_profile'=>['product_description'=>'testing','mcc' => '5734'],
                        // "business_url" => "https://healmaker.wantechsolutions.com",
                        "individual" => [
                            'address' => [
                                'city' => $city,
                                'state'=> $state,
                                'line1' => $customerAddress->address,
                                'postal_code' => $customerAddress->zip_code,
                            ],
                            'dob' => [
                                "day" => $customerDOBDate,
                                "month" => $customerDOBMonth,
                                "year" => $customerDOBYear,
                            ],
                            "email" => $customer->email,
                            "first_name" => $customer->first_name,
                            "last_name" => $customer->last_name,
                            "gender" => $customer->gender,
                            "phone" => '+' . '14109607860',
                            "ssn_last_4" => substr($vendorInfo->ssn, -4),
                        ],
                    ]);
//dd($stripeAccount);
                    // create bank account token
                    $bankToken = \Stripe\Token::create([
                        'bank_account' => [
                            'country' => $country,
                            'currency' => 'USD',
                            'account_holder_name' => $vendorInfo->bank_info['full_name'],
                            'account_holder_type' => 'individual',
                            'routing_number' => $vendorInfo->bank_info['number'],
                            'account_number' => $vendorInfo->bank_info['number'],
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

                    $response = ["bankToken" => $bankToken->id, "stripeAccount" => $stripeAccount->id, "bankAccount" => $bankAccount->id];

                    $vendorInfo->bankInfo = [
                        'bank_token' => $bankToken->id,
                        'stripeAccount' => $stripeAccount->id,
                        'bankAccount' => $bankAccount->id,
                        'name' => $vendorInfo->bank_info['name'],
                        'full_name' => $vendorInfo->bank_info['full_name'],
                        'number' => $vendorInfo->bank_info['number'],
                        'description' => $vendorInfo->bank_info['description'],
                    ];

                    $vendorInfo->update();
                    return [
                        'success' => '1',
                        'message' => 'Bank account attached successfully',
                        'response' => $response,
                    ];
                }
                try {
                    \Stripe\Stripe::setApiVersion('2019-12-03');
                    $stripe = new \Stripe\StripeClient($secret);
                    $bank_account = $stripe->accounts->retrieve($bankAccount->id);
                    $list = $bank_account->external_accounts->data[0];
                    $ext = $stripe->accounts->retrieveExternalAccount($list->account, $list->id, []);

                    $transfer = $stripe->transfers->create([
                        'amount' => (float) $vendorInfo->balance * 100,
                        'currency' => 'USD',
                        'destination' => $ext->account
                    ]);
                    if ($transfer->id) {
                        $vendorInfo->balance = Customer::BALANCE_NULL;
                        $vendorInfo->save();
                        $this->message = 'Money transfer to Vendor account successfully';
                    } else {
                        return $transfer->getErrors();
                    }
                }
                catch (Exception $e) {
                    return $e->getMessage();
                }
            }

        }

    }
}
