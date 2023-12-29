<?php

namespace Botble\Ecommerce\Repositories\Eloquent;

use Botble\Ecommerce\Repositories\Interfaces\BookedServiceInterface;
use Botble\Support\Repositories\Eloquent\RepositoriesAbstract;

class BookedServiceRepository extends RepositoriesAbstract implements BookedServiceInterface
{
    public function getBookedServices(array $params)
    {
        $this->model = $this->originalModel;

        $params = array_merge([
            'condition' => [
                'status'       => 1,
                'is_featured' => 0,
            ],
            'order_by'  => [
                'id'      => 'ASC',
                'created_at' => 'DESC',
            ],
            'take'      => null,
            'paginate'  => [
                'per_page'      => null,
                'current_paged' => 1,
            ],
            'with'      => [],
            'withCount' => [],
        ], $params);

        return $this->advancedGet($params);
    }

}
