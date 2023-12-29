<?php

namespace Botble\Ecommerce\Http\Controllers;

use Assets;
use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Ecommerce\Repositories\Interfaces\ReviewInterface;
use Botble\Ecommerce\Tables\ReviewTable;
use Exception;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\Request;
use Illuminate\View\View;
use Botble\Ecommerce\Models\Customer;
use Botble\Ecommerce\Models\Review;
use Throwable;

class ReviewController extends BaseController
{
    /**
     * @var ReviewInterface
     */
    protected $reviewRepository;

    /**
     * ReviewController constructor.
     * @param ReviewInterface $reviewRepository
     */
    public function __construct(ReviewInterface $reviewRepository)
    {
        $this->reviewRepository = $reviewRepository;
    }

    /**
     * @param ReviewTable $dataTable
     * @return Factory|View
     * @throws Throwable
     */
    public function index(ReviewTable $dataTable)
    {
        page_title()->setTitle(trans('plugins/ecommerce::review.name'));

        Assets::addStylesDirectly('vendor/core/plugins/ecommerce/css/review.css');

        return $dataTable->renderTable();
    }

    /**
     * @param Request $request
     * @param int $id
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function destroy(Request $request, $id, BaseHttpResponse $response)
    {
        try {
            $review = $this->reviewRepository->findOrFail($id);
            $this->reviewRepository->delete($review);

            event(new DeletedContentEvent(REVIEW_MODULE_SCREEN_NAME, $request, $review));

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
     * @throws Exception
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
            $review = $this->reviewRepository->findOrFail($id);
            $this->reviewRepository->delete($review);

            event(new DeletedContentEvent(REVIEW_MODULE_SCREEN_NAME, $request, $review));
        }

        return $response->setMessage(trans('core/base::notices.delete_success_message'));
    }

    public function addReview() {
        $input = request()->all();
        $customer = Customer::where('id', $input['customer_id'])->first();
        if($customer) {
            $review = Review::create($input);
            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.addReview'));
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function productReviewList() {
        $input = request()->all();
        $customer = Customer::where('id', $input['customer_id'])->first();
        if($customer) {
            $productReviewList = Review::where('product_id',$input['product_id'])->get();
            foreach ($productReviewList as $key => $value) {
                $productReviewList[$key]['user_name'] = $customer->name;
                $productReviewList[$key]['user_avatar'] = $customer->image;
            }
            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.ProductReviewList'),$productReviewList);
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }
}
