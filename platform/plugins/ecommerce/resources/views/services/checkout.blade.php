@extends('plugins/ecommerce::orders.master')
@section('title')
    {{ __('Checkout') }}
@stop
@section('content')
    <style>
        .d-sm-block {
            padding: 20px;
            background-color: #00689D;
        }
    </style>
    @if ($serviceBooking->count() > 0)
        <div class="container" id="main-checkout-product-info">
            <div class="row">
                <div class="order-1 right col-md-6 col-lg-5">
                    <div class="d-block d-sm-none">
                        @include('plugins/ecommerce::orders.partials.logo')
                    </div>
                    <div id="cart-item" class="position-relative">
                        <div class="payment-info-loading" style="display: none;">
                            <div class="payment-info-loading-content">
                                <i class="fas fa-spinner fa-spin"></i>
                            </div>
                        </div>
                        <div class="p-2 text-white" style="background-color: #00689D;">
                            <p class="font-weight-bold mb-0">{{ __('Services(s)') }}:</p>
                        </div>
                        <div class="checkout-products-marketplace">
                            <div class="mt-3 bg-light mb-3">
                                <div class="p-2" style="background: antiquewhite;">
                                    @foreach($serviceBooking as $serviceBook)
                                        <div class="row cart-item">
                                            <div class="col-9">
                                                @if($serviceBook->service->image)
                                                    @php
                                                        $img = json_decode($serviceBook->service->image,true);
                                                    @endphp
                                                    <img src="{{ asset('storage/'. $img['imgPath']) }}"
                                                         alt="{{ $serviceBook->service->name }}" class="img-fluid rounded" width="30">
                                                @else
                                                    <img src="{{ asset('storage/general/newsletter-790x510.jpg') }}"
                                                         alt="{{ $serviceBook->service->name }}" class="img-fluid rounded" width="30">
                                                @endif
                                                <span class="font-weight-bold">{{ $serviceBook->service->name }}</span>
                                            </div>
                                            <div class="col-3 text-right">
                                                <p>{{ format_price($serviceBook->service->price) }}</p>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                        <div class="mt-2 p-2 right">

                            <div class="row">
                                <div class="col-6">
                                    <p><strong>{{ __('Total') }}</strong>:</p>
                                </div>
                                <div class="col-6 float-right">
                                    <p class="total-text raw-total-text" data-price=" "> {{ format_price($total) }} </p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <hr>

                    <div class="mt-3 mb-5">
                        @include('plugins/ecommerce::themes.discounts.partials.form')
                    </div>
                </div>
                <div class="col-lg-7 col-md-6 left">
                    <div class="d-none d-sm-block">
                        @include('plugins/ecommerce::orders.partials.logo')
                    </div>
                    <div class="form-checkout">
                        <form action="{{ route('payments.service.checkout') }}" method="post" class="checkout-form payment-checkout-form" id="checkout-form">
                            @csrf

                            <div>
                                <h5 class="checkout-payment-title">{{ __('Service Address Information') }}</h5>
                                <input type="hidden" value="{{ route('public.checkout.save-information', $serviceToken) }}" id="save-shipping-information-url">
                                @include('plugins/ecommerce::orders.partials.address-form', compact('sessionCheckoutData'))
                            </div>
                            <div class="position-relative">
                                <div class="payment-info-loading" style="display: none;">
                                    <div class="payment-info-loading-content">
                                        <i class="fas fa-spinner fa-spin"></i>
                                    </div>
                                </div>
                                <h5 class="checkout-payment-title">{{ __('Payment method') }}</h5>
                                <input type="hidden" name="name" value="{{ $user->name }}">
                                <input type="hidden" name="serviceToken" value="{{ $serviceToken }}">
                                <input type="hidden" name="amount" value="{{ $total }}">
                                <input type="hidden" name="currency" value="{{ strtoupper(get_application_currency()->title) }}">
                                <input type="hidden" name="callback_url" value="{{ route('public.payment.paypal.status') }}">
                                {!! apply_filters(PAYMENT_FILTER_PAYMENT_PARAMETERS, null) !!}
                                <ul class="list-group list_payment_method">
                                    @if (setting('payment_stripe_status') == 1)
                                        <li class="list-group-item">
                                            <input class="magic-radio js_payment_method" type="radio" name="payment_method" id="payment_stripe"
                                                   value="stripe" @if (!setting('default_payment_method') || setting('default_payment_method') == \Botble\Payment\Enums\PaymentMethodEnum::STRIPE) checked @endif data-toggle="collapse" data-target=".payment_stripe_wrap" data-parent=".list_payment_method">
                                            <label for="payment_stripe" class="text-left">
                                                {{ setting('payment_stripe_name', trans('plugins/payment::payment.payment_via_card')) }}
                                            </label>
                                            <div class="payment_stripe_wrap payment_collapse_wrap collapse @if (!setting('default_payment_method') || setting('default_payment_method') == \Botble\Payment\Enums\PaymentMethodEnum::STRIPE) show @endif">
                                                <div class="card-checkout">
                                                    <div class="form-group">
                                                        <div class="stripe-card-wrapper"></div>
                                                    </div>
                                                    <div class="form-group @if ($errors->has('number') || $errors->has('expiry')) has-error @endif">
                                                        <div class="row">
                                                            <div class="col-sm-9">
                                                                <input placeholder="{{ trans('plugins/payment::payment.card_number') }}"
                                                                       class="form-control" type="text" id="stripe-number" data-stripe="number">
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <input placeholder="{{ trans('plugins/payment::payment.mm_yy') }}" class="form-control"
                                                                       type="text" id="stripe-exp" data-stripe="exp">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group @if ($errors->has('name') || $errors->has('cvc')) has-error @endif">
                                                        <div class="row">
                                                            <div class="col-sm-9">
                                                                <input placeholder="{{ trans('plugins/payment::payment.full_name') }}"
                                                                       class="form-control" id="stripe-name" type="text" data-stripe="name">
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <input placeholder="{{ trans('plugins/payment::payment.cvc') }}" class="form-control"
                                                                       type="text" id="stripe-cvc" data-stripe="cvc">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="payment-stripe-key" data-value="{{ setting('payment_stripe_client_id') }}"></div>
                                            </div>
                                        </li>
                                    @endif
                                </ul>
                            </div>
                            <br>
                            <div class="form-group @if ($errors->has('description')) has-error @endif">
                                <label for="description" class="control-label">{{ __('Note') }}</label>
                                <br>
                                <textarea name="description" id="description" rows="3" class="form-control" placeholder="{{ __('Note') }}...">{{ old('description') }}</textarea>
                                {!! Form::error('description', $errors) !!}
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6 d-none d-md-block" style="line-height: 53px">
                                        <a class="text-info" href="{{ route('public.cart') }}"><i class="fas fa-long-arrow-alt-left"></i> <span class="d-inline-block back-to-cart">{{ __('Back to cart') }}</span></a>
                                    </div>
                                    <div class="col-md-6 checkout-button-group">
                                        <button type="submit" class="btn payment-checkout-btn payment-checkout-btn-step float-right" data-processing-text="{{ __('Processing. Please wait...') }}" data-error-header="{{ __('Error') }}">
                                            {{ __('Checkout') }}
                                        </button>
                                    </div>
                                </div>
                                <div class="d-block d-md-none back-to-cart-button-group">
                                    <a class="text-info" href="{{ route('public.cart') }}"><i class="fas fa-long-arrow-alt-left"></i> <span class="d-inline-block">{{ __('Back to cart') }}</span></a>
                                </div>
                            </div>
                        </form>

                    </div> <!-- /form checkout -->
                </div>
            </div>
        </div>
        <script src="{{ asset('https://js.stripe.com/v2/') }}"></script>
        <script src="{{ asset('https://cdnjs.cloudflare.com/ajax/libs/card/2.5.4/card.js') }}?v=2.5.4"></script>
        <script src="{{ asset('themes/martfury/js/payment.js') }}?v=1.0.5"></script>

    @else
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="alert alert-warning my-5">
                        <span>{!! __('No products in cart. :link!', ['link' => Html::link(route('public.index'), __('Back to shopping'))]) !!}</span>
                    </div>
                </div>
            </div>
        </div>
    @endif
@stop

