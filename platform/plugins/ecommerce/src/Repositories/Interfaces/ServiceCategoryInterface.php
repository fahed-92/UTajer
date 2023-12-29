<?php

namespace Botble\Ecommerce\Repositories\Interfaces;

use Botble\Support\Repositories\Interfaces\RepositoryInterface;

interface ServiceCategoryInterface extends RepositoryInterface
{
    public function filterServices(array $filters, array $params = []);

    public function getServiceCategory(
        array $conditions = [],
        array $with = [],
        array $withCount = []
    );

}
