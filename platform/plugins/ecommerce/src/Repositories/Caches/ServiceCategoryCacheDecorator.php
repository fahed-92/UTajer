<?php

namespace Botble\Ecommerce\Repositories\Caches;

use Botble\Ecommerce\Repositories\Interfaces\ServiceCategoryInterface;
use Botble\Support\Repositories\Caches\CacheAbstractDecorator;

class ServiceCategoryCacheDecorator extends CacheAbstractDecorator implements ServiceCategoryInterface
{
    /**
     * {@inheritDoc}
     */
    public function filterServices(array $filters, array $params = [])
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }

    /**
     * {@inheritDoc}
     */
    public function getServiceCategory(
        array $conditions = [],
        array $with = [],
        array $withCount = []
    ) {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }
}
