<?php

namespace Botble\Ecommerce\Repositories\Caches;

use Botble\Ecommerce\Repositories\Interfaces\BookedServiceInterface;
use Botble\Support\Repositories\Caches\CacheAbstractDecorator;

class BookedServiceCacheDecorator extends CacheAbstractDecorator implements BookedServiceInterface
{
    public function getBookedServices(array $params)
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }

}
