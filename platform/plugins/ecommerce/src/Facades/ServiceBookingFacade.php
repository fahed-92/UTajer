<?php

namespace Botble\Ecommerce\Facades;

use Botble\Ecommerce\Cart\ServiceBooking;
use Illuminate\Support\Facades\Facade;

class ServiceBookingFacade extends Facade
{
    /**
     * Get the registered name of the component.
     *
     * @return string
     */
    protected static function getFacadeAccessor()
    {
        return ServiceBooking::class;
    }
}
