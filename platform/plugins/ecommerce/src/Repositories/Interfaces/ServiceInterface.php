<?php

namespace Botble\Ecommerce\Repositories\Interfaces;

use Botble\Support\Repositories\Interfaces\RepositoryInterface;

interface ServiceInterface extends RepositoryInterface
{
    public function filterServices(array $filters, array $params = []);

    public function getServices(array $params);

}
