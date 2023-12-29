<div class="ps-my-account">
    <div class="container">
        <form class="ps-form--account ps-tab-root" method="POST" action="{{ route('customer.otpEmailVerification') }}">
            @csrf
            <div class="ps-form__content">
                <h4>{{ __('Check Your Email') }}</h4>
                <span>{{ __('Please check your email, code will sent your registered email id.') }}</span>
                @if (isset($otp_send_error))
                    <div class="alert alert-danger">
                        <span>Something went wrong!</span>
                    </div>
                    <br>
                @endif
                @if (isset($invalid_otp))
                    <span class="text-danger">Please enter valid OTP</span>
                @endif
                <!-- <div class="form-group form-forgot">
                    <input class="form-control" type="text" name="otp" placeholder="{{ __(' Enter OTP') }}">
                    <input class="form-control" type="hidden" name="email" value = " ">
                </div> -->

                <div class="height-100 d-flex justify-content-center align-items-center mb-3">
                    <div class="position-relative">
                        <div class="text-center">
                            <div id="otp" class="inputs d-flex flex-row justify-content-center mt-2">
                                <input class="m-2 text-center form-control rounded" type="text" id="first" name="first" maxlength="1" />
                                <input class="m-2 text-center form-control rounded" type="text" id="second" name="second" maxlength="1" />
                                <input class="m-2 text-center form-control rounded" type="text" id="third" name="third" maxlength="1" />
                                <input class="m-2 text-center form-control rounded" type="text" id="fourth" name="fourth" maxlength="1" />
                                <input class="m-2 text-center form-control rounded" type="text" id="fifth" name="fifth" maxlength="1" />
                                <input class="m-2 text-center form-control rounded" type="text" id="sixth" name="sixth" maxlength="1" />
                                <input type="hidden" name="web_otp_verify" value="1">
                            </div>
                        </div>

                    </div>
                </div>

                <div class="form-group submit">
                    <button class="ps-btn ps-btn--fullwidth" type="submit">{{ __('Verify') }}</button>
                </div>

                <!-- <div class="form-group">
                    <p class="text-center">{{ __("Don't Have an Account?") }} <a href="{{ route('customer.register') }}" class="d-inline-block">{{ __('Sign up now') }}</a></p>
                </div> -->
            </div>
            <!--  <div class="ps-form__footer">
                {!! apply_filters(BASE_FILTER_AFTER_LOGIN_OR_REGISTER_FORM, null, \Botble\Ecommerce\Models\Customer::class) !!}
            </div> -->
        </form>
    </div>
</div>
