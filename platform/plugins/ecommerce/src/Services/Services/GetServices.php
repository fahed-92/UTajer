<?php

namespace Botble\Ecommerce\Services\Services;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Ecommerce\Models\Service;
use Botble\Ecommerce\Repositories\Interfaces\ServiceInterface;
use Illuminate\Support\Facades\DB;
use EcommerceHelper;

class GetServices
{
    protected $serviceRepository;
    /**
     * GetProductService constructor.
     * @param ServiceInterface $serviceRepository
     */
    public function __construct(ServiceInterface $serviceRepository)
    {
        $this->serviceRepository = $serviceRepository;
    }

    public function getServices($request) {
        $num = (int) $request->input('num');
        $shows = EcommerceHelper::getShowParams();

        if (!array_key_exists($num, $shows)) {
            $num = (int)theme_option('number_of_products_per_page', 12);
        }

        $queryVar = [
            'keyword'     => $request->input('q'),
            'max_price'   => $request->input('max_price'),
            'min_price'   => $request->input('min_price'),
            'category_id' => $request->input('category_id'),
            'sort_by'     => $request->input('sort-by'),
            'num'         => $num,
        ];
        $user =  auth('customer')->user();
        if ($user) {
            $countAttributeGroups = DB::table('ec_services')
                ->where('user_id', '!=', $user->id)
                ->where('status',Service::ACTIVE_STATUS)
                ->where('availability',Service::ACTIVE_STATUS);
        } else {
            $countAttributeGroups = DB::table('ec_services')
                ->where('status',Service::ACTIVE_STATUS)
                ->where('availability',Service::ACTIVE_STATUS);
        }
        switch ($queryVar['sort_by']) {
            case 'date_asc':
                $orderBy = [
                    'ec_services.created_at' => 'asc',
                ];
                break;
            case 'date_desc':
                $orderBy = [
                    'ec_services.created_at' => 'desc',
                ];
                break;
            case 'price_asc':
                $orderBy = [
                    'ec_services.price' => 'asc',
                ];
                break;
            case 'price_desc':
                $orderBy = [
                    'ec_services.price' => 'desc',
                ];
                break;
            default:
                $orderBy = [
                    'ec_services.name' => 'ASC',
                    'ec_services.created_at' => 'DESC',
                ];
                break;
        }

        $params = [
            'paginate'  => [
                'per_page'      => $queryVar['num'],
                'current_paged' => (int)$request->query('page', 1),
            ],
        ];
//        if (!empty($conditions)) {
//            $params['condition'] = array_merge([
//                'ec_services.status'       => BaseStatusEnum::PUBLISHED,
//                'ec_services.is_featured'  => 1,
//            ], $conditions);
//        }
//        $user =  auth('customer')->user();
//        if ($user){
//            $params['condition'] = array_merge([
//                'ec_services.user_id'       => $user->id,
//            ], $conditions);
//        }


        $services = $this->serviceRepository->filterServices(
            [
                'keyword'                => $queryVar['keyword'],
                'min_price'              => $queryVar['min_price'],
                'max_price'              => $queryVar['max_price'],
                'category_id'            => $queryVar['category_id'],
                'order_by'               => $orderBy,
            ],
            $params,
        );

        return $services;
    }
}
