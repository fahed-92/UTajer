<?php

namespace Botble\Marketplace\Http\Controllers\Fronts;

use Assets;
use Botble\Base\Forms\FormBuilder;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Ecommerce\Forms\BookedServiceForm;
use Botble\Ecommerce\Http\Requests\ProductRequest;
use Botble\Ecommerce\Http\Requests\ServiceBookingRequest;
use Botble\Ecommerce\Http\Requests\ServiceRequest;
use Botble\Ecommerce\Models\Service;
use Botble\Ecommerce\Models\ServiceBooking;
use Botble\Ecommerce\Tables\BookedServiceTable;
use Botble\Ecommerce\Tables\ServiceTable;
use Botble\Ecommerce\Traits\BookedServiceActionsTrait;
use Botble\Marketplace\Models\Revenue;
use Exception;
use Illuminate\Contracts\View\Factory;
use Illuminate\View\View;
use Throwable;
use function GuzzleHttp\json_encode;

class BookedServiceController extends BaseController
{
    use BookedServiceActionsTrait;

    /**
     * @param ServiceTable $dataTable
     * @return Factory|View
     * @throws Throwable
     */
    public function index(BookedServiceTable $table)
    {
        page_title()->setTitle(__('Booked Services'));
        return $table->render('plugins/marketplace::themes.dashboard.table.base');
    }

    /**
     * @param FormBuilder $formBuilder
     * @return string
     */
    public function create(FormBuilder $formBuilder)
    {
        page_title()->setTitle(trans('Booked Service Create'));
        Assets::addStyles(['datetimepicker'])
            ->addScripts([
                'moment',
                'datetimepicker',
                'jquery-ui',
                'input-mask',
                'blockui',
            ])
            ->addStylesDirectly(['vendor/core/plugins/ecommerce/css/ecommerce.css'])
            ->addScriptsDirectly([
                'vendor/core/plugins/ecommerce/libraries/bootstrap-confirmation/bootstrap-confirmation.min.js',
                'vendor/core/plugins/ecommerce/js/edit-product.js',
            ]);

        return $formBuilder->create(BookedServiceForm::class)->renderForm();
    }

    public function store(ServiceBookingRequest $request, BaseHttpResponse $response) {
        $service = $this->serviceRepository->getModel();
        $service->user_id = auth('customer')->user()->id;
        $service->service_id =$request->service_id;
        $service->date = $request->date;
        $service->status = $request->status;
        $service->save();

        return $response
            ->setPreviousUrl(route('marketplace.vendor.services.index'))
            ->setNextUrl(route('marketplace.vendor.services.edit', $service->id))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    /**
     * @param int $id
     * @param FormBuilder $formBuilder
     * @return string
     */
    public function edit($id, FormBuilder $formBuilder)
    {
        $bookedService = $this->serviceRepository->findOrFail($id);

        page_title()->setTitle('Edit Booked Services - '. $bookedService->name);

        Assets::addStyles(['datetimepicker'])
            ->addScripts([
                'moment',
                'datetimepicker',
                'jquery-ui',
                'input-mask',
                'blockui',
            ])
            ->addStylesDirectly(['vendor/core/plugins/ecommerce/css/ecommerce.css'])
            ->addScriptsDirectly([
                'vendor/core/plugins/ecommerce/libraries/bootstrap-confirmation/bootstrap-confirmation.min.js',
                'vendor/core/plugins/ecommerce/js/edit-product.js',
            ]);
        return $formBuilder
            ->create(BookedServiceForm::class, ['model' => $bookedService])
            ->renderForm();
    }

    /**
     * @param int $id
     * @param ProductRequest $request
     */
    public function update($id, ServiceBookingRequest $request , BaseHttpResponse $response ) {
        $service = $this->serviceRepository->findOrFail($id);

        if ($service->user_id != auth('customer')->user()->id) {
            abort(404);
        }
        if ($request->service_id)
            $service->service_id = $request->service_id;
        if ($request->amount)
            $service->amount = $request->amount;
        if ($request->status)
            $service->status = $request->status;
        if ($request->date)
            $service->date = $request->date;
        if ($request->start_time)
            $service->start_time = $request->start_time;
        if ($request->end_time)
            $service->end_time = $request->end_time;
        if ($request->coupon_code)
            $service->coupon_code = $request->coupon_code;
        if ($request->discount_amount)
            $service->discount_amount = $request->discount_amount;
        if ($request->tax)
            $service->tax = $request->tax;
        if ($request->sub_total)
            $service->sub_total = $request->sub_total;
        if ($request->note)
            $service->note = $request->note;
        if ($request->image) {
            $service->image = $request->images;
            if ($request->hasFile('images')) {
                $mimeType = $request->file('images')->getMimeType();
                $originalName = $request->file('images')->getClientOriginalName();
                $imageExtension = time() . '.' . $request->file('images')->getClientOriginalExtension();
                $imagePath = $request->file('images')->store('assets/uploads', 'public');
                $service->image = json_encode([
                    'name' => $originalName,
                    'extension' => $imageExtension,
                    'mimeType' => $mimeType,
                    'imgPath' => $imagePath,
                ]);
            }
        }
        $service->update();

        return $response
            ->setPreviousUrl(route('marketplace.vendor.booked-services.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    public function getRelationBoxes($id, BaseHttpResponse $response)
    {
        $service = null;
        if ($id) {
            $service = $this->serviceRepository->findById($id);
        }

        $dataUrl = route('marketplace.vendor.products.get-list-product-for-search',
            ['service_id' => $service ? $service->id : 0]);

        return $response->setData(view('plugins/ecommerce::services.partials.extras',
            compact('service', 'dataUrl'))->render());
    }

    public function complete($id, BaseHttpResponse $response){
        $bookedService = $this->serviceRepository->findById($id);
        if ($bookedService->status != ServiceBooking::COMPLETED_STATUS){
            $bookedService->status = ServiceBooking::COMPLETED_STATUS;
            $bookedService->update();
//            $customerRevenue = new Revenue();
//            $customerRevenue->customer_id = $bookedService->service->user_id;
//            $customerRevenue->order_id = 13;
//            $customerRevenue->service_id = $bookedService->service_id;
//            $customerRevenue->sub_amount = $bookedService->amount;
//            $customerRevenue->fee = $bookedService->tax;
//            $customerRevenue->amount = $bookedService->sub_total;
//            $customerRevenue->description = $bookedService->note;
//            $customerRevenue->currency = get_application_currency()->title;
//            $customerRevenue->save();
            return $response
                ->setPreviousUrl(route('marketplace.vendor.booked-services.index'))
                ->setMessage(trans('core/base::notices.success_message'));
        } else {
            return $response
                ->setPreviousUrl(route('marketplace.vendor.booked-services.index'))
                ->setMessage(trans('core/base::notices.error_message'));
        }

    }

}
