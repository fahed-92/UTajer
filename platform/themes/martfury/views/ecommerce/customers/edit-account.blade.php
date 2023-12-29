@extends(Theme::getThemeNamespace() . '::views.ecommerce.customers.master')
@section('content')
@if(auth('customer')->user()->is_vendor == 1)
    {!! Form::open(['route' => 'customer.edit-account', 'class' => 'ps-form--account-setting', 'method' => 'POST']) !!}
        <ul class="nav nav-tabs ">
            <li class="nav-item">
                <a href="#tab_profile" class="nav-link active" data-toggle="tab">{{ SeoHelper::getTitle() }} </a>
            </li>
            {!! apply_filters(BASE_FILTER_REGISTER_CONTENT_TABS, null, auth('customer')->user()) !!}
        </ul>
        <div class="tab-content mx-2 my-4">
            <div class="tab-pane active" id="tab_profile">
                <div class="ps-form__content">
                    <div class="form-group">
                        <label for="name">{{ __('Full Name') }}:</label>
                        <input id="name" type="text" class="form-control" name="name" value="{{ auth('customer')->user()->name }}">
                    </div>
                    <!-- {!! Form::error('name', $errors) !!} -->
        
                    <div class="form-group @if ($errors->has('dob')) has-error @endif">
                        <label for="date_of_birth">{{ __('Date of birth') }}:</label>
                        <input id="date_of_birth" type="text" class="form-control" name="dob" value="{{ auth('customer')->user()->dob }}">
                    </div>
                    <!-- {!! Form::error('dob', $errors) !!} -->
                    <div class="form-group @if ($errors->has('email')) has-error @endif">
                        <label for="email">{{ __('Email') }}:</label>
                        <input id="email" type="text" class="form-control" disabled="disabled" value="{{ auth('customer')->user()->email }}" name="email">
                    </div>
                    <!-- {!! Form::error('email', $errors) !!} -->
        
                    <div class="form-group @if ($errors->has('phone')) has-error @endif">
                        <label for="phone">{{ __('Phone') }}</label>
                        <input type="text" class="form-control" name="phone" id="phone" placeholder="{{ __('Phone') }}" value="{{ auth('customer')->user()->phone }}">
                    </div>
                    <!-- {!! Form::error('phone', $errors) !!} -->
                </div>
            </div>
            {!! apply_filters(BASE_FILTER_REGISTER_CONTENT_TAB_INSIDE, null, auth('customer')->user()) !!}
        </div>
        <div class="form-group text-center">
            <div class="form-group submit">
                <button class="ps-btn">{{ __('Update') }}</button>
            </div>
        </div>
    {!! Form::close() !!}
@else
{!! Form::open(['route' => 'customer.edit-account', 'class' => 'ps-form--account-setting', 'method' => 'POST']) !!}
<style type="text/css">
    span#dialCode {
    height: 50px;
    font-size: 14px;
    text-align: center;
    padding: 15px;
}

</style>
        <ul class="nav nav-tabs ">
            <li class="nav-item">
                <a href="#tab_profile" class="nav-link active" data-toggle="tab">{{ SeoHelper::getTitle() }} </a>
            </li>
            {!! apply_filters(BASE_FILTER_REGISTER_CONTENT_TABS, null, auth('customer')->user()) !!}
        </ul>
        <div class="tab-content mx-2 my-4">
            <div class="tab-pane active" id="tab_profile">
                <div class="ps-form__content">
                    <div class="form-group">
                        <label for="name">{{ __('Profile Name') }}:</label>
                        <input id="name" type="text" class="form-control" name="name" value="{{ auth('customer')->user()->name }}">
                    </div>
                    <!-- {!! Form::error('name', $errors) !!} -->
                    <div class="form-group">
                        <label for="first_name">{{ __('First Name') }}:</label>
                        <input type="text" class="form-control" name="first_name" value="{{ auth('customer')->user()->first_name }}">
                    </div>
                    <div class="form-group">
                        <label for="last_name">{{ __('Last Name') }}:</label>
                        <input type="text" class="form-control" name="last_name" value="{{ auth('customer')->user()->last_name }}">
                    </div>
                    <div class="form-group @if ($errors->has('email')) has-error @endif">
                        <label for="email">{{ __('Email') }}:</label>
                        <input id="email" type="text" class="form-control" disabled="disabled" value="{{ auth('customer')->user()->email }}" name="email">
                    </div>
                    <!-- {!! Form::error('email', $errors) !!} -->
                    <div class="show-if-customer" @if (old('is_vendor') == 1) style="display: none" @endif>
                        <label for="country">{{ __('Country') }}:</label>
                        <div class="form-group">

                    <select name="country" id="countryId" class="form-control">
                        <option value="">Select Country</option>
                        <?php
                        foreach ($countries_list as $key => $value){
                                $countryName = $value->country_name; ?>
                            <option value="<?php echo $value->iso2; ?>" data-dialcode="<?php echo $value->dialling_code;?>" <?php if($value->iso2 == $customer_address[0]->country) {   echo "selected";    } ?>><?php echo $countryName;?></option>
                            <?php 
                        }
                        ?>
                    </select>
                        </div>
                    <div class="show-if-customer" @if (old('is_vendor') == 1) style="display: none" @endif>
                        <label for="phone">{{ __('Mobile Number') }}:</label>
                        <div class="form-group">
                             <div class="input-group-prepend">
                                <span class="input-group-text" id="dialCode"></span>
                                <input class="form-control" name="telPhone" id = "mobile_phone" type="text" value="{{ $customer_address[0]->phone }}" placeholder="{{ __('Mobile Number') }}">
                            </div>
                            <input class="form-control" name="phone" id = "dialCodeValue" type="hidden" value="" placeholder="{{ __('Mobile Number') }}">
                        </div>
                    </div>
                    <!-- {!! Form::error('phone', $errors) !!} -->
                    <div class="form-group">
                        <label for="phone">{{ __('City') }}:</label>
                        <input class="form-control" name="city"  type="text" value="{{ $customer_address[0]->city }}" placeholder="{{ __('City') }}">
                    </div>
                    <div class="form-group">
                        <label for="phone">{{ __('Zip Code') }}:</label>
                        <input class="form-control" name="zip_code"  type="text" value="{{ $customer_address[0]->zip_code }}" placeholder="{{ __('Enter Zipcode') }}">
                    </div>
                    <div class="form-group">
                        <label for="phone">{{ __('Address') }}:</label>
                        <input class="form-control" name="address"  type="text" value="{{ $customer_address[0]->address }}" placeholder="{{ __('Enter Address') }}">
                    </div>
                    <div class="form-group @if ($errors->has('dob')) has-error @endif">
                        <label for="date_of_birth">{{ __('Date of birth') }}:</label>
                        <input id="date_of_birth" type="text" class="form-control" name="dob" value="{{ auth('customer')->user()->dob }}">
                    </div>
                    <!-- {!! Form::error('dob', $errors) !!} -->
                    <div class="form-group">
                            <label for="phone">{{ __('Gender') }}:</label>
                           <select class="form-control" name="gender">
                              <option value=" ">Select Gender</option>
                              <option value="male" <?php if(auth('customer')->user()->gender == "male") {   echo "selected";    } ?>>Male</option>
                              <option value="female" <?php if(auth('customer')->user()->gender == "female") {   echo "selected";    } ?>>Female</option>
                            </select>
                        </div>
                         <div class="form-group">
                            <label for="phone">{{ __('Job') }}:</label>
                            <input class="form-control" name="job"  type="text" value="{{ auth('customer')->user()->job }}" placeholder="{{ __('Your Job') }}">
                        </div>
                         <div class="form-group">
                            <label for="phone">{{ __('Business Name') }}:</label>
                            <input class="form-control" name="business_name"  type="text" value="{{ auth('customer')->user()->business_name }}" placeholder="{{ __('Your Business Name') }}">
                            
                        </div>
                </div>
            </div>
            {!! apply_filters(BASE_FILTER_REGISTER_CONTENT_TAB_INSIDE, null, auth('customer')->user()) !!}
        </div>
        <div class="form-group text-center">
            <div class="form-group submit">
                <button class="ps-btn">{{ __('Update') }}</button>
            </div>
        </div>
    {!! Form::close() !!}
@endif

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
    $('#dialCode').hide();
    $("#countryId").on("change", function() {
        console.log($('option:selected', '#countryId').data('dialcode'));
         console.log($('#mobile_phone').val());
        $('#dialCode').show();
      $('#dialCode').text('+' + $('option:selected', this).data('dialcode'));
      $('#dialCodeValue').val('+' + $('option:selected', this).data('dialcode') + $('#mobile_phone').val());
    });
    $( "#mobile_phone" ).keypress(function() {
         console.log($('option:selected', '#countryId').data('dialcode'));
         console.log($('#mobile_phone').val());
        $('#dialCodeValue').val('+' + $('option:selected', '#countryId').data('dialcode') + $('#mobile_phone').val());
    });

</script>
@endsection