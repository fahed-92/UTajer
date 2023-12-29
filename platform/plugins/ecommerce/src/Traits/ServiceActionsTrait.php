<?php

namespace Botble\Ecommerce\Traits;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Events\CreatedContentEvent;
use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Ecommerce\Models\Service;
use Botble\Ecommerce\Repositories\Interfaces\ServiceInterface;
use Exception;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Collection;
use RvMedia;
use Throwable;

trait ServiceActionsTrait
{

    /**
     * @var ServiceInterface
     */
    protected $serviceRepository;
    public function __construct(ServiceInterface $serviceRepository) {
        $this->serviceRepository = $serviceRepository;
    }

    public function destroy($id, Request $request, BaseHttpResponse $response)
    {
        $service = $this->serviceRepository->findOrFail($id);
        try {
            $this->serviceRepository->deleteBy(['id' => $id]);
            event(new DeletedContentEvent(SERVICE_MODULE_SCREEN_NAME, $request, $service));
            return $response->setMessage(trans('core/base::notices.delete_success_message'));
        } catch (Exception $exception) {
            return $response
                ->setError()
                ->setMessage($exception->getMessage());
        }
    }

    /**
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function deletes(Request $request, BaseHttpResponse $response)
    {
        $ids = $request->input('ids');
        if (empty($ids)) {
            return $response
                ->setError()
                ->setMessage(trans('core/base::notices.no_select'));
        }

        foreach ($ids as $id) {
            $service = $this->serviceRepository->findOrFail($id);
            $this->serviceRepository->delete($service);
            event(new DeletedContentEvent(SERVICE_MODULE_SCREEN_NAME, $request, $service));
        }

        return $response->setMessage(trans('core/base::notices.delete_success_message'));
    }

    /**
     * @param int $variationId
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     * @throws Exception
     */

    /**
     * @param int $id
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     * @throws Throwable
     */
    public function getListServiceForSearch(Request $request, BaseHttpResponse $response)
    {
        $availableServices = $this->serviceRepository
            ->advancedGet([
                'condition' => [
                    'status' => Service::ACTIVE_STATUS,
                    ['id', '<>', $request->input('service_id', 0)],
                    ['name', 'LIKE', '%' . $request->input('keyword') . '%'],
                ],
                'select'    => [
                    'id',
                    'name',
                    'images',
                ],
                'paginate'  => [
                    'per_page'      => 5,
                    'type'          => 'simplePaginate',
                    'current_paged' => (int)$request->input('page', 1),
                ],
            ]);


        return $response->setData(
            view('plugins/ecommerce::products.partials.panel-search-data', compact(
                'availableServices',
            ))->render()
        );
    }



    /**
     * @param CreateServiceWhenCreatingOrderRequest $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function postCreateServiceWhenCreatingOrder(
          BaseHttpResponse $response
    ) {
        $product = $this->serviceRepository->createOrUpdate($request->input());

        event(new CreatedContentEvent(PRODUCT_MODULE_SCREEN_NAME, $request, $product));

        $product->image_url = RvMedia::getImageUrl(Arr::first($product->images) ?? null, 'thumb', false,
            RvMedia::getDefaultImage());
        $product->price = $product->front_sale_price;
        $product->select_qty = 1;

        return $response
            ->setData($product)
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    /**
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function getAllServiceAndVariations(Request $request, BaseHttpResponse $response)
    {
        $availableServices = $this->serviceRepository
            ->getModel()
            ->where('status', BaseStatusEnum::PUBLISHED)
            ->where('is_variation', '<>', 1)
            ->where('name', 'LIKE', '%' . $request->input('keyword') . '%')
            ->select([
                'ec_products.*',
            ])
            ->distinct('ec_products.id')
            ->leftJoin('ec_product_variations', 'ec_product_variations.configurable_product_id', '=', 'ec_products.id')
            ->leftJoin('ec_product_variation_items', 'ec_product_variation_items.variation_id', '=',
                'ec_product_variations.id')
            ->simplePaginate(5);

        foreach ($availableServices as &$availableService) {
            /**
             * @var Service $availableService
             */
            $availableService->image_url = RvMedia::getImageUrl(Arr::first($availableService->images) ?? null, 'thumb',
                false, RvMedia::getDefaultImage());
            $availableService->price = $availableService->front_sale_price;
            $availableService->is_out_of_stock = $availableService->isOutOfStock();

            foreach ($availableService->variations as &$variation) {
                $variation->price = $variation->product->front_sale_price;
                $variation->is_out_of_stock = $variation->product->isOutOfStock();
                $variation->quantity = $variation->product->quantity;
                foreach ($variation->variationItems as &$variationItem) {
                    $variationItem->attribute_title = $variationItem->attribute->title;
                }
            }
        }

        return $response->setData($availableServices);
    }

    /**
     * @param ServiceUpdateOrderByRequest $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function postUpdateOrderBy(ServiceUpdateOrderByRequest $request, BaseHttpResponse $response)
    {
        $product = $this->serviceRepository->findOrFail($request->input('pk'));
        $product->order = $request->input('value', 0);
        $this->serviceRepository->createOrUpdate($product);

        return $response->setMessage(trans('core/base::notices.update_success_message'));
    }

}
