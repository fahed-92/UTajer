<?php if(isset($verify_otp)){
    $session = session()->get('register_data');?>
<div class="ps-my-account">
    <div class="container">
        <form class="ps-form--account ps-tab-root" method="POST" action="{{ route('customer.registerOtpVerify.post') }}">
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
                    <input class="form-control" type="hidden" name="email" value = "<?php echo $session['email'];?>">
                </div> -->

                <div class="height-100 d-flex justify-content-center align-items-center mb-3">
                    <div class="position-relative">
                        <div class="text-center">
                            <div id="otp" class="inputs d-flex flex-row justify-content-center mt-2"> <input class="m-2 text-center form-control rounded" type="text" id="first" name="first" maxlength="1" /> <input class="m-2 text-center form-control rounded" type="text" id="second" name="second" maxlength="1" /> <input class="m-2 text-center form-control rounded" type="text" id="third" name="third" maxlength="1" /> <input class="m-2 text-center form-control rounded" type="text" id="fourth" name="fourth" maxlength="1" /> <input class="m-2 text-center form-control rounded" type="text" id="fifth" name="fifth" maxlength="1" /> <input class="m-2 text-center form-control rounded" type="text" id="sixth" name="sixth" maxlength="1" /><input type="hidden" name="web_otp_verify" value="1"> </div>
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

<?php } else{
    $ipaddress = $_SERVER['REMOTE_ADDR'];
    ?>
<style type="text/css">
    span#dialCode {
        height: 50px;
        font-size: 14px;
        text-align: center;
        padding: 15px;
    }

</style>
@php
    $social_data = session()->get('data');
    if(isset($social_data)){
        $exp_name = explode(' ', $social_data['name'], 2);
    }
@endphp
<div class="ps-my-account">
    <div class="container">
        <form class="ps-form--account ps-tab-root" method="POST" action="{{ route('customer.register.post') }}">
            @csrf
            <div class="ps-form__content">
                <h4>{{ __('Register An Account') }}</h4>

                <div class="row user-role">
                    <div class="col-6">
                        <label>
                            <input type="radio" name="is_vendor" value="0" @if (old('is_vendor') == 0) checked="checked" @endif>
                            <span class="d-inline-block">
                                        {{ __('I am a customer') }}
                                    </span>
                        </label>
                    </div>
                    <div class="col-6">
                    <label>
                            <input type="radio" name="is_vendor" value="1" @if (old('is_vendor') == 1) checked="checked" @endif>
                            <span class="d-inline-block">
                                        {{ __('I am a vendor') }}
                                    </span>
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <span style="color:#ff0000;text-align: initial;">*
                        <input id="firstname" class="form-control input" name="name" type="text" value="{{ (isset($social_data['name']))?$social_data['name']:old('name') }}" placeholder=" " />
                        <label for="firstname" class="placeholder">{{ __('Enter Full Name') }}</label>
                    </span>
                </div>

{{--                <div class="show-if-customer" @if (old('is_vendor') == 1) style="display: none" @endif>--}}
{{--                    <div class="form-group">--}}
{{--                        <span style="color:#ff0000;text-align: initial;">*--}}
{{--                            <input class="form-control input" id="first_name" name="first_name"  type="text" value="{{ (isset($exp_name[0]))?$exp_name[0]:old('first_name') }}" placeholder=" " />--}}
{{--                            <label class="placeholder" for="first_name">{{ __('Enter First Name') }}</label>--}}
{{--                        </span>--}}
{{--                    </div>--}}
{{--                    <div class="form-group">--}}
{{--                        <span style="color:#ff0000;text-align: initial;">*--}}
{{--                            <input class="form-control input" id="last_name" name="last_name"  type="text" value="{{ (isset($exp_name[1]))?$exp_name[1]:old('last_name') }}" placeholder=" " />--}}
{{--                            <label class="placeholder" for="last_name">{{ __('Enter Last Name') }}</label>--}}
{{--                        </span>--}}
{{--                    </div>--}}
{{--                </div>--}}
                <div class="form-group">
    <span style="color:#ff0000;text-align: initial;">*
    <input class="form-control input" name="email" id="txt-email" type="email" value="{{ (isset($social_data['email']))?$social_data['email']:old('email') }}" autocomplete="email" placeholder=" ">
    <label class="placeholder" for="txt-email">{{ __('Enter Email ID') }}</label>
    </span>
                </div>
                <div class="show-if-customer" @if (old('is_vendor') == 1) style="display: none" @endif>
                    <div class="form-group">
        <span style="color:#ff0000;text-align: initial;">*
            <select name="country" id="countryId" class="form-control input">
                <option value=""></option>
                <?php
                foreach ($countries_list as $key => $value){
                    $countryName = $value->country_name; ?>
                            <option value="<?php echo $value->iso2; ?>" data-dialcode="<?php echo $value->dialling_code; ?>" <?php echo (old('country')  == $value->iso2)?"selected":''?>><?php echo $countryName;?></option>
                        <?php
                }
                    ?>
            </select>
            <label class="placeholder" for="countryId">Select Country</label>
        </span>
                    </div>
                </div>
                <div class="show-if-customer" @if (old('is_vendor') == 1) style="display: none" @endif>
                    <div class="form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="dialCode"></span>
                            <input class="form-control input" name="telPhone" id = "mobile_phone" type="text" value="{{ old('phone') }}" placeholder="{{ __('Mobile Number') }}">
                        </div>
                        <input class="form-control" name="phone" id = "dialCodeValue" type="hidden" value="">
                    </div>
                </div>
                <div class="form-group">
    <span style="color:#ff0000;text-align: initial;">*
        <input class="form-control input"  type="password" name="password" id="txt-password" autocomplete="new-password" placeholder=" ">
        <label class="placeholder" for="txt-password">{{ __('Enter Password') }}</label>
    </span>
                </div>
                <div class="form-group">
    <span style="color:#ff0000;text-align: initial;">*
        <input class="form-control input" type="password" name="password_confirmation" id="txt-password-confirmation" autocomplete="new-password" placeholder=" ">
        <label class="placeholder" for="txt-password-confirmation">{{ __('Enter Password') }}</label>
    </span>
                </div>
                <div class="show-if-customer" @if (old('is_vendor') == 1) style="display: none" @endif >
                    <div class="form-group">
                            <span style="color:#ff0000;text-align: initial;">*
                                <input class="form-control input" name="zip_code"  type="text" id = "zip_code_value" value="{{ old('zip_code') }}" placeholder=" ">
                                <label class="placeholder" for="zip_code_value">{{ __('Enter Zipcode') }}</label>
                            </span>
                    </div>
                    <div class="form-group">
                            <span style="color:#ff0000;text-align: initial;">*
                                <input class="form-control input" name="city"  type="text" id = "city_value" value="{{ old('city') }}" placeholder=" ">
                                <label class="placeholder" for="city_value">{{ __('Enter City') }}</label>
                            </span>

                    </div>
                    <div class="form-group">
                            <span style="color:#ff0000;text-align: initial;">*
                                <input class="form-control input" name="address" id="old_address" type="text" value="{{ old('address') }}" placeholder=" ">
                                <label class="placeholder" for="old_address">{{ __('Enter Address') }}</label>
                            </span>
                    </div>
                    <div class="form-group">
                             <span style="color:#ff0000;text-align: initial;">*
                                <input class="form-control input" type="text" id="dob" name="dob"  value="{{ old('dob') }}" placeholder=" " onfocus="(this.type='date')" onfocusout="(this.type='text')">
                                <label class="placeholder" for="dob">{{ __('Enter Date of Birth') }}</label>
                            </span>

                    </div>
                    <div class="form-group">
                            <span style="color:#ff0000;text-align: initial;">*
                               <select class="form-control input" id="gender" name="gender">
                                  <option value=" "></option>
                                  <option value="male" @if( old("gender")  == "male") selected="selected" @endif>Male</option>
                                  <option value="female" @if( old("gender")  == "female") selected="selected" @endif>Female</option>
                                </select>
                                <label class="placeholder" for="gender">Select Gender</label>
                            </span>
                    </div>
                    <div class="form-group">
                            <span style="color:#ff0000;text-align: initial;">*
                                <input class="form-control input" id="job" name="job"  type="text" value="{{ old('job') }}" placeholder=" ">
                                <label class="placeholder" for="job">{{ __('Enter Job') }}</label>
                            </span>
                    </div>
                    <div class="form-group">
                            <span style="color:#ff0000;text-align: initial;">*
                                <input class="form-control input" id="business_name" name="business_name"  type="text" value="{{ old('business_name') }}" placeholder=" ">
                                <label class="placeholder" for="business_name">{{ __('Enter Business Name') }}</label>
                            </span>
                    </div>
                </div>
                @if (is_plugin_active('marketplace'))
                    <div class="show-if-vendor" @if (old('is_vendor') == 0) style="display: none" @endif>
                        <div class="form-group">
                                <span style="color:#ff0000;text-align: initial;">*
                                    <input class="form-control input" name="shop_name" id="shop-name" type="text" value="{{ old('shop_name') }}" placeholder=" ">
                                    <label class="placeholder" for="shop-name">{{ __('Enter Shop Name') }}</label>
                                </span>
                        </div>
                        <div class="form-group shop-url-wrapper">
                                <span style="color:#ff0000;text-align: initial;">*
                                    <span class="d-inline-block float-right shop-url-status"></span>
                                    <input class="form-control input" name="shop_url" id="shop-url" type="text" value="{{ old('shop_url') }}" placeholder=" " data-url="{{ route('public.ajax.check-store-url') }}">
                                    <label class="placeholder" for="shop-url">{{ __('Shop URL') }}</label>
                                </span>
                            <span class="d-inline-block"><small data-base-url="{{ route('public.store', '') }}">{{ route('public.store', (string)old('shop_url')) }}</small>
                                </span>


                        </div>
                        <div class="form-group">
                                <span style="color:#ff0000;text-align: initial;">*
                                    <input class="form-control input" name="shop_phone" id="shop-phone" type="text" value="{{ old('shop_phone') }}" placeholder=" ">
                                    <label class="placeholder" for="shop-phone">{{ __('Enter Shop phone') }}</label>
                                </span>
                        </div>
                    </div>
                @endif
                <div class="form-group">
                    <p>{{ __('Your personal data will be used to support your experience throughout this website, to manage access to your account, and for other purposes described in our privacy policy.') }}</p>
                </div>
                <div class="form-group">
                    <div class="ps-checkbox">
                        <input type="hidden" name="agree_terms_and_policy" value="0">
                        <input type="hidden" name="registered_user" value="0">
                        <input class="form-control input" type="checkbox" name="agree_terms_and_policy" id="agree-terms-and-policy" value="1">
                        <span style="color:#ff0000;text-align: initial;">*</span><label for="agree-terms-and-policy">I agree to
                            <a href="{{url('terms-conditions')}}">terms & condition. </a></label>
                    </div>
                </div>
                @if (setting('enable_captcha') && is_plugin_active('captcha'))
                    {!! Captcha::display() !!}
                @endif
                <div class="form-group submit">
                    <button class="ps-btn ps-btn--fullwidth" type="submit">{{ __('Sign up') }}</button>
                </div>

                <div class="form-group">
                    <p class="text-center">{{ __('Already have an account?') }} <a href="{{ route('customer.login') }}" class="d-inline-block">{{ __('Log in') }}</a></p>
                </div>
            </div>
            <div class="ps-form__footer">
                {!! apply_filters(BASE_FILTER_AFTER_LOGIN_OR_REGISTER_FORM, null, \Botble\Ecommerce\Models\Customer::class) !!}
            </div>
        </form>
    </div>
</div><?php }
      ?>



<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
    $('#dialCode').hide();
    $("#countryId").on("change", function() {
        var dialCode = $('option:selected', '#countryId').data('dialcode');
        console.log(dialCode);
        if(dialCode == undefined){
            $('#dialCode').hide();
            $('#dialCodeValue').val('');
        }else{
            console.log("dsffsdg");
            console.log($('#mobile_phone').val());
            $('#dialCode').show();
            $('#dialCode').text('+' + $('option:selected', this).data('dialcode'));
            $('#dialCodeValue').val('+' + $('option:selected', this).data('dialcode') + $('#mobile_phone').val());
        }
    });
    $( "#mobile_phone" ).keypress(function() {
        console.log($('option:selected', '#countryId').data('dialcode'));
        console.log($('#mobile_phone').val());
        $('#dialCodeValue').val('+' + $('option:selected', '#countryId').data('dialcode') + $('#mobile_phone').val());
    });
    document.addEventListener("DOMContentLoaded", function(event) {

        function OTPInput() {
            const inputs = document.querySelectorAll('#otp > *[id]');
            for (let i = 0; i < inputs.length; i++) { inputs[i].addEventListener('keydown', function(event) { if (event.key==="Backspace" ) { inputs[i].value='' ; if (i !==0) inputs[i - 1].focus(); } else { if (i===inputs.length - 1 && inputs[i].value !=='' ) { return true; } else if (event.keyCode> 47 && event.keyCode < 58) { inputs[i].value=event.key; if (i !==inputs.length - 1) inputs[i + 1].focus(); event.preventDefault(); } else if (event.keyCode> 64 && event.keyCode < 91) { inputs[i].value=String.fromCharCode(event.keyCode); if (i !==inputs.length - 1) inputs[i + 1].focus(); event.preventDefault(); } } }); } } OTPInput(); });

    $(document).ready(function() {
        /*$("#zip_code_value").keyup(function() {
            var el = $(this);

            if (el.val().length === 5) {
                $.ajax({
                    url: "http://zip.elevenbasetwo.com",
                    cache: false,
                    dataType: "json",
                    type: "GET",
                    data: "zip=" + el.val(),
                    success: function(result, success) {
                        $("#city_value").val(result.city);
                    }
                });
            }
        });*/
    });

    // $('.form-control input, .form-control select').val("");
    // $('.form-group input, .form-group select').focusout(function() {
    //     var text_val = $(this).val();
    //     if (text_val === "") {
    //       console.log("empty!");
    //       $(this).removeClass('input-has-value');
    //     } else {
    //       $(this).addClass('has-value');
    //     }
    // });


</script>

