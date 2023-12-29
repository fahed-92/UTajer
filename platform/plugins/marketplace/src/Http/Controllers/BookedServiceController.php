<?php

namespace Botble\Marketplace\Http\Controllers;

use Botble\Base\Forms\FormBuilder;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Marketplace\Forms\BookedServiceForm;
use Botble\Ecommerce\Http\Requests\ProductRequest;
use Botble\Ecommerce\Http\Requests\ServiceBookingRequest;
use Botble\Marketplace\Tables\BookedServiceTable;
use Botble\Ecommerce\Traits\BookedServiceActionsTrait;
use Botble\Marketplace\Tables\ServiceTable;
use Exception;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\Request;
use Illuminate\View\View;
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
        return $table->renderTable();
    }

    /**
     * @param FormBuilder $formBuilder
     * @return string
     */
    public function create(FormBuilder $formBuilder)
    {
        page_title()->setTitle(trans('Booked Service Create'));
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
            ->setPreviousUrl(route('marketplace.booked-service.index'))
            ->setNextUrl(route('marketplace.booked-service.edit', $service->id))
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
        return $formBuilder
            ->create(BookedServiceForm::class, ['model' => $bookedService])
            ->renderForm();
    }

    /**
     * @param int $id
     * @param ProductRequest $request
     */
    public function update($id, Request $request , BaseHttpResponse $response ) {
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
            ->setPreviousUrl(route('marketplace.booked-service.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    public function getRelationBoxes($id, BaseHttpResponse $response)
    {
        $service = null;
        if ($id) {
            $service = $this->serviceRepository->findById($id);
        }

        $dataUrl = route('marketplace.booked-service.index',
            ['service_id' => $service ? $service->id : 0]);

        return $response->setData(view('plugins/ecommerce::services.partials.extras',
            compact('service', 'dataUrl'))->render());
    }

}
