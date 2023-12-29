<?php

namespace Botble\Ecommerce\Http\Requests;

use Botble\Support\Http\Requests\Request;

class ServiceRequest extends Request
{
    public function rules()
    {
        return [
            'name'  => 'required',
            'price' => 'required|integer|min:0',
            'price_type' => 'required',
            'service_type' => 'required',
            'country' => 'required',
            'city' => 'required',
            'images' => 'nullable',
            'start_time' => 'nullable|required_if:price_type,2',
            'end_time' => 'nullable|required_if:price_type,2|after:start_time',
        ];
    }
    public function messages()
    {
        return [
            'name.required'          => trans('plugins/ecommerce::products.service_create_validate_name_required'),
            'price.required'         => trans('plugins/ecommerce::products.service_create_validate_price_required'),
            'end_date.after'         => trans('plugins/ecommerce::products.service_create_validate_end_date_after'),
            'start_date.required_if' => trans('plugins/ecommerce::products.service_create_validate_start_date_required_if'),
        ];
    }
}
