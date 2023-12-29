<?php

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Ecommerce\Repositories\Interfaces\ServiceInterface;

if (!function_exists('get_services')) {
    /**
     * @param array $params
     * @return mixed
     */
    function get_services(array $params = [])
    {
        $params = array_merge([
            'condition' => [
                'ec_services.status'       => 1,
            ],
            'order_by'  => [
                'ec_services.created_at' => 'DESC',
            ],
            'take'      => null,
            'paginate'  => [
                'per_page'      => null,
                'current_paged' => 1,
            ],
            'select'    => [
                'ec_services.*',
            ],
        ], $params);

        return app(ServiceInterface::class)->getServices($params);
    }
}

if (!function_exists('getServiceDetails')) {
    /**
     * @param int $serviceId
     * @return mixed
     */
    function getServiceDetails($serviceId)
    {
        return app(ServiceInterface::class)->findById($serviceId);
    }
}
