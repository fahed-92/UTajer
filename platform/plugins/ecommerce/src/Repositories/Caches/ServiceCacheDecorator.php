<?php

namespace Botble\Ecommerce\Repositories\Caches;

use Botble\Ecommerce\Repositories\Interfaces\ProductCategoryInterface;
use Botble\Ecommerce\Repositories\Interfaces\ProductCollectionInterface;
use Botble\Ecommerce\Repositories\Interfaces\ProductInterface;
use Botble\Ecommerce\Repositories\Interfaces\ServiceInterface;
use Botble\Support\Repositories\Caches\CacheAbstractDecorator;

class ServiceCacheDecorator extends CacheAbstractDecorator implements ServiceInterface
{
    public function filterServices(array $filters, array $params = [])
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }
    public function getServices(array $params)
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }
    public function getServiceDetails(array $params)
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }



}
