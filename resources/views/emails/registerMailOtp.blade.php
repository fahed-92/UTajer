
@component('mail::message')
{{-- Greeting --}}
@if (! empty($greeting))
# {{ $greeting }}
@else
# @lang('Hello!')
@endif
{{-- Intro Lines --}}
{{__('OTP for registration')}}
{{-- Action Button --}}
@component('mail::button', ['url' => '','color' => 'primary'])
{{ $data['otp'] }}
@endcomponent
{{-- Salutation --}}
@if (! empty($salutation))
{{ $salutation }}
@else
@lang('Regards'),<br>
{{ config('app.name') }}
@endif
@endcomponent

