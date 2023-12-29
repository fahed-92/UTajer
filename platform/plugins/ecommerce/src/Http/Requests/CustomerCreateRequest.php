<?php

namespace Botble\Ecommerce\Http\Requests;

use Botble\Support\Http\Requests\Request;

class CustomerCreateRequest extends Request
{

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name'                  => 'required|max:120|min:2',
            'first_name'            => 'required|max:120|min:2',
            'last_name'             => 'required|max:120|min:2',
            'phone'                 => 'required|numeric',
            'email'                 => 'required|max:60|min:6|email|unique:ec_customers',
            'password'              => 'required|min:6',
            'password_confirmation' => 'required|same:password',
            'address'               => 'required|max:225',
            'country'               => 'required|max:10',
            'city'                  => 'required|max:10',
            'zip_code'              => 'required|max:10',
            'dob'                   => 'required',
            'gender'                => 'required',
            'job'                   => 'required|max:50',
            'business_name'         => 'required|max:50',
        ];
    }
}
