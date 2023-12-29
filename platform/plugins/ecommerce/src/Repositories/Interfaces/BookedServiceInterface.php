<?php

namespace Botble\Ecommerce\Repositories\Interfaces;

use Botble\Support\Repositories\Interfaces\RepositoryInterface;

interface BookedServiceInterface extends RepositoryInterface
{
    public function getBookedServices(array $params);

}
