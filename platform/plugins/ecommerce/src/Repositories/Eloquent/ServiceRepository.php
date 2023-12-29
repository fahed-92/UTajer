<?php

namespace Botble\Ecommerce\Repositories\Eloquent;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Ecommerce\Repositories\Interfaces\ServiceInterface;
use Botble\Support\Repositories\Eloquent\RepositoriesAbstract;
use Carbon\Carbon;
use Exception;
use Illuminate\Database\Query\Builder;
use Illuminate\Database\Query\JoinClause;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;

class ServiceRepository extends RepositoriesAbstract implements ServiceInterface
{

    public function filterServices(array $filters, array $params = [])
    {
        $filters = array_merge([
            'keyword'                => null,
            'min_price'              => null,
            'max_price'              => null,
            'category_id'            => null,
        ], $filters);

        $params = array_merge([
            'condition' => [
                'ec_services.status'       => 1,
                'ec_services.is_featured'  => 0,
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
        $categoryId = $filters['category_id'];
        if ($categoryId) {
            $this->model = $this->model
                ->where(function ($query) use ($categoryId) {
                    return $query
                        ->Where('ec_services.category_id','like',"%".$categoryId."%");
                });
        }

//        $minPrice = $filters['min_price'];
//        $maxPrice = $filters['max_price'];
//        if ($minPrice && $maxPrice) {
//            $this->model = $this->model
//                ->where(function ($query) use ($minPrice,$maxPrice) {
//                    return $query
//                        ->WhereBetween('ec_services.price',[$minPrice,$maxPrice]);
//                });
//        }

        // Filter product by min price and max price
        if ($filters['min_price'] !== null || $filters['max_price'] !== null) {
            $this->model = $this->model
                ->where(function ($query) use ($filters) {
                    /**
                     * @var Builder $query
                     */
                    $priceMin = Arr::get($filters, 'min_price');
                    $priceMax = Arr::get($filters, 'max_price');

                    if ($priceMin !== null && $priceMax !== null) {
                        $query = $query->whereBetween('ec_services.price', [$priceMin,$priceMax]);
                    }
                    if ($priceMin !== null) {
                        $query = $query->whereBetween('ec_services.price', [$priceMin,100000]);
                    }

                    if ($priceMax !== null) {
                        $query = $query->whereBetween('ec_services.price', [0,$priceMax]);
                    }

                    return $query;
                });
        }
        return $this->advancedGet($params);
    }

    public function getServices(array $params)
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
