<?php

namespace Botble\Ecommerce\Http\Requests;

use Botble\Support\Http\Requests\Request;

class ServiceBookingRequest extends Request
{

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'service_id'  => 'required',
            'date'  => 'required|date|after:yesterday',
            'start_time' => 'nullable|required_if:price_type,2',
            'end_time' => 'nullable|required_if:price_type,2|after:start_time',
         ];
    }

    /**
     * @return array
     */
    public function messages()
    {
        return [
            'service_id.required' => __('Service ID is required'),
            'date.required' => __('Date is required'),
            'date.date' => __('Date type must be date format'),
            'date.after' => __('Date is greater then or equal to today'),
        ];
    }
}
