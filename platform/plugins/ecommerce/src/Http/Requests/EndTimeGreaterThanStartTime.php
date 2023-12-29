<?php

namespace Botble\Ecommerce\Http\Requests;

use Botble\Support\Http\Requests\Request;

class EndTimeGreaterThanStartTime implements Request
{
    public function passes($attribute, $value)
    {
// Get the start time from the request data
        $startTime = request()->input('start_time'); // Assuming 'start_time' is the name of the input for the start time

// Compare the start and end times
        return strtotime($value) > strtotime($startTime);
    }

    public function message()
    {
        return 'The end time must be greater than the start time.';
    }
}
