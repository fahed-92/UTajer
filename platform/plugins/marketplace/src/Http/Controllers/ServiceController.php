<?php

namespace Botble\Marketplace\Http\Controllers;

use Botble\Base\Forms\FormBuilder;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Base\Supports\Assets;
use Botble\Ecommerce\Http\Requests\ProductRequest;
use Botble\Ecommerce\Http\Requests\ServiceRequest;
use Botble\Ecommerce\Models\Service;
use Botble\Ecommerce\Traits\ServiceActionsTrait;
use Botble\Marketplace\Forms\ServiceForm;
use Botble\Marketplace\Tables\ServiceTable;
use Botble\Setting\Supports\SettingStore;
use Exception;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\View\View;
use function GuzzleHttp\json_encode;

class ServiceController extends BaseController
{
    use ServiceActionsTrait;

    /**
     * @param ServiceTable $dataTable
     * @return Factory|View
     * @throws Throwable
     */
    public function index(ServiceTable $table)
    {
        page_title()->setTitle(__('Services'));
        return $table->renderTable();
    }

    /**
     * @param FormBuilder $formBuilder
     * @return string
     */
    public function create(FormBuilder $formBuilder)
    {
        page_title()->setTitle(trans('plugins/marketplace::service.create'));
        return $formBuilder->create(ServiceForm::class)->renderForm();
    }

    public function store(ServiceRequest $request, BaseHttpResponse $response) {
        $service = $this->serviceRepository->getModel();
        if (auth('web')->user()){
            $user_id = auth('web')->user()->id;
        } else
        {
            $user_id = auth('customer')->user()->id;
        }
        $service->user_id = $user_id;
        $service->name =$request->name;
        $service->price =$request->price;
        if ($request->price_type == 'fixed')
            $service->price_type = 1;
        else{
            $service->price_type = 2;
            $service->start_time =$request->start_time;
            $service->end_time =$request->end_time;
        }

        if ($request->service_type == 'individual')
            $service->service_type = 1;
        else
            $service->service_type = 2;

        $service->description =$request->description;
        $service->country =$request->country;
        $service->state =$request->state;
        $service->city =$request->city;

        $service->availability = Service::ACTIVE_STATUS;
        $service->is_featured = Service::INACTIVE_STATUS;
        $service->status = Service::ACTIVE_STATUS;
        $service->image =$request->images_input;
        if ($request->hasFile('images_input')) {
            $mimeType = $request->file('images_input')->getMimeType();
            $originalName = $request->file('images_input')->getClientOriginalName();
            $imageExtension = time() . '.' . $request->file('images_input')->getClientOriginalExtension();
            $imagePath = $request->file('images_input')->store('assets/uploads', 'public');
            $service->image = json_encode([
                'name' => $originalName,
                'extension' => $imageExtension,
                'mimeType' => $mimeType,
                'imgPath' => $imagePath,
            ]);
        }
        $service->save();

        return $response
            ->setPreviousUrl(route('marketplace.service.index'))
            ->setNextUrl(route('marketplace.service.edit', $service->id))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    /**
     * @param int $id
     * @param FormBuilder $formBuilder
     * @return string
     */
    public function edit($id, FormBuilder $formBuilder)
    {
        $service = $this->serviceRepository->findOrFail($id);
        page_title()->setTitle('Edit Services - '. $service->name);
        return $formBuilder
            ->create(ServiceForm::class, ['model' => $service])
            ->renderForm();
    }

    /**
     * @param int $id
     * @param ProductRequest $request
     */
    public function update($id, ServiceRequest $request , BaseHttpResponse $response ) {
        $service = $this->serviceRepository->findOrFail($id);
        if (auth('customer')->user()) {
            if ($service->user_id != auth('customer')->user()->id) {
                abort(404);
            }
        }
        if ($request->name)
            $service->name = $request->name;

        if ($request->price)
            $service->price = $request->price;

        if ($request->price_type == 'fixed') {
            $service->price_type = 1;
        } else {
            $service->price_type = 2;
            $service->start_time =$request->start_time;
            $service->end_time =$request->end_time;
        }
        if ($request->service_type == 'individual')
            $service->service_type = 1;
        else
            $service->service_type = 2;

        if ($request->city)
            $service->city =$request->city;
        if ($request->state)
            $service->state =$request->state;
        if ($request->country)
            $service->country =$request->country;
        if ($request->description)
            $service->description = $request->description;
        if ($request->images_input) {
            $service->image = $request->images_input;
            if ($request->hasFile('images_input')) {
                $mimeType = $request->file('images_input')->getMimeType();
                $originalName = $request->file('images_input')->getClientOriginalName();
                $imageExtension = time() . '.' . $request->file('images_input')->getClientOriginalExtension();
                $imagePath = $request->file('images_input')->store('assets/uploads', 'public');
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
            ->setPreviousUrl(route('marketplace.service.index'))
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
}
