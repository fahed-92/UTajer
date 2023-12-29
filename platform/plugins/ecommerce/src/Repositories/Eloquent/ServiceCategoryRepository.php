<?php

namespace Botble\Ecommerce\Repositories\Eloquent;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Ecommerce\Repositories\Interfaces\ServiceCategoryInterface;
use Botble\Ecommerce\Repositories\Interfaces\ServiceInterface;
use Botble\Support\Repositories\Eloquent\RepositoriesAbstract;
use Carbon\Carbon;
use Exception;
use Illuminate\Database\Query\Builder;
use Illuminate\Database\Query\JoinClause;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;

class ServiceCategoryRepository extends RepositoriesAbstract implements ServiceCategoryInterface
{

    public function filterServices(array $filters, array $params = [])
    {
        $filters = array_merge([
            'keyword'                => null,
            'min_price'              => null,
            'max_price'              => null,
        ], $filters);

        $params = array_merge([
            'condition' => [
                'ec_services.status'       => 1,
                'ec_services.is_featured' => 0,
            ],
            'order_by'  => $filters['order_by'],
            'take'      => null,
            'paginate'  => [
                'per_page'      => null,
                'current_paged' => 1,
            ],
            'select'    => [
                'ec_services.*',
                'ec_services.price',
            ],
            'with'      => [],
            'withCount' => [],
        ], $params);

        $this->model = $this->originalModel;

        $now = now();

        $this->model = $this->model
            ->distinct();

        $keyword = $filters['keyword'];
        if ($keyword) {
            $this->model = $this->model
                ->where(function ($query) use ($keyword) {
                    return $query
                        ->where('ec_services.name', 'LIKE', '%' . $keyword . '%')
                        ->orWhere('ec_services.description', 'LIKE', '%' . $keyword . '%');
                });
        }

        // Filter product by min price and max price
        if ($filters['min_price'] !== null || $filters['max_price'] !== null) {
            $this->model = $this->model
                ->where(function ($query) use ($filters) {
                    /**
                     * @var Builder $query
                     */
                    $priceMin = Arr::get($filters, 'min_price');
                    $priceMax = Arr::get($filters, 'max_price');

                    if ($priceMin !== null) {
                        $query = $query->where('ec_services.price', '>=', $priceMin);
                    }

                    if ($priceMax !== null) {
                        $query = $query->where('ec_services.price', '<=', $priceMax);
                    }

                    return $query;
                });
        }
        return $this->advancedGet($params);
    }

    public function getServiceCategory(
        array $conditions = [],
        array $with = [],
        array $withCount = []
    )
    {
        $data = $this->model;

        if (!empty($conditions)) {
            $data = $data->where($conditions);
        }

        if (!empty($with)) {
            $data = $data->with($with);
        }

        if (!empty($withCount)) {
            $data = $data->withCount($withCount);
        }

        $data = $data
            ->orderBy('category_id', 'ASC')
            ->orderBy('created_at', 'DESC');

        return $this->applyBeforeExecuteQuery($data)->get();

    }

}
