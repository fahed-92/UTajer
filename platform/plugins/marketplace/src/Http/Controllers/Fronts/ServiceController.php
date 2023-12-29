<?php

namespace Botble\Marketplace\Http\Controllers\Fronts;

use Assets;
use Botble\Base\Forms\FormBuilder;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Ecommerce\Http\Requests\ProductRequest;
use Botble\Ecommerce\Http\Requests\ServiceRequest;
use Botble\Ecommerce\Models\Service;
use Botble\Ecommerce\Traits\ServiceActionsTrait;
use Botble\Ecommerce\Forms\ServiceForm;
use Botble\Ecommerce\Tables\ServiceTable;
use Exception;
use Illuminate\Contracts\View\Factory;
use Illuminate\View\View;
use Throwable;
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
        return $table->render('plugins/marketplace::themes.dashboard.table.base');
    }

    /**
     * @param FormBuilder $formBuilder
     * @return string
     */
    public function create(FormBuilder $formBuilder)
    {
        page_title()->setTitle(trans('Service Create'));
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
        return $formBuilder->create(ServiceForm::class)->renderForm();
    }

    public function store(ServiceRequest $request, BaseHttpResponse $response) {
        $service = $this->serviceRepository->getModel();
        $service->user_id = auth('customer')->user()->id;
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
        $service = $this->serviceRepository->findOrFail($id);
        page_title()->setTitle('Edit Services - '. $service->name);

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
            ->create(ServiceForm::class, ['model' => $service])
            ->renderForm();
    }

    /**
     * @param int $id
     * @param ProductRequest $request
     */
    public function update($id, ServiceRequest $request , BaseHttpResponse $response ) {
        $service = $this->serviceRepository->findOrFail($id);

        if ($service->user_id != auth('customer')->user()->id) {
            abort(404);
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
            ->setPreviousUrl(route('marketplace.vendor.services.index'))
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
