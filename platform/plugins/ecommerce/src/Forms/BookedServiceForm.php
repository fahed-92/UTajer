<?php

namespace Botble\Ecommerce\Forms;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Forms\Fields\MultiCheckListField;
use Botble\Base\Forms\FormAbstract;
use Botble\Ecommerce\Enums\BookedServiceStatus;
use Botble\Ecommerce\Enums\PriceTypeEnum;
use Botble\Ecommerce\Enums\ServiceTypeEnum;
use Botble\Ecommerce\Forms\Fields\CategoryMultiField;
use Botble\Ecommerce\Http\Requests\ServiceBookingRequest;
use Botble\Ecommerce\Http\Requests\ServiceRequest;
use Botble\Ecommerce\Models\Service;
use Botble\Ecommerce\Models\ServiceBooking;
use Botble\Ecommerce\Repositories\Interfaces\TaxInterface;
use Botble\Marketplace\Forms\Fields\CustomEditorField;
use Botble\Marketplace\Forms\Fields\CustomImageFile;
use EcommerceHelper;

class BookedServiceForm extends FormAbstract
{
    public function buildForm()
    {
        $serviceId = $this->getModel() ? $this->getModel()->id : null;
        $this
            ->setupModel(new ServiceBooking)
            ->withCustomFields()
            ->addCustomField('customEditor', CustomEditorField::class)
            ->addCustomField('customImageFile', CustomImageFile::class)
            ->addCustomField('categoryMulti', CategoryMultiField::class)
            ->addCustomField('multiCheckList', MultiCheckListField::class)
            ->setFormOption('template', 'plugins/marketplace::themes.dashboard.forms.base')
            ->setFormOption('enctype', 'multipart/form-data')
            ->setValidatorClass(ServiceBookingRequest::class)
            ->setActionButtons(view('plugins/marketplace::themes.dashboard.forms.actions')->render())
            ->add('service_id', 'text', [
                'label'      => trans('plugins/ecommerce::products.form.name'),
                'label_attr' => ['class' => 'text-title-field required'],
                'attr'       => [
                    'placeholder'  => trans('core/base::forms.name_placeholder'),
                    'data-counter' => 120,
                ],
            ])
            ->add('amount', 'number', [
                'label'      => trans('Price'),
                'label_attr' => ['class' => 'text-title-field required'],
                'attr'       => [
                    'placeholder'  => trans('Price'),
                    'data-counter' => 120,
                ],
            ])
            ->add('date', 'date', [
                'label'      => trans('Booking Date'),
                'label_attr' => ['class' => 'text-title-field required'],
                'attr'       => [
                    'placeholder'  => trans('Booking Date'),
                    'data-counter' => 120,
                    'min'          => date('Y-m-d') // Set today's date in the format YYYY-MM-DD
                ],
            ])

            ->add('status', 'customSelect', [
                'label'      => trans('plugins/ecommerce::services.status'),
                'label_attr' => ['class' => 'control-label required'],
                'choices'    => BookedServiceStatus::labels(),
            ])

            ->add('note', 'customEditor', [
                'label'      => trans('core/base::forms.description'),
                'label_attr' => ['class' => 'control-label'],
                'attr'       => [
                    'rows'         => 2,
                    'placeholder'  => trans('core/base::forms.description_placeholder'),
                    'data-counter' => 1000,
                ],
            ]);

        if (EcommerceHelper::isTaxEnabled()) {
            $taxes = app(TaxInterface::class)->pluck('title', 'id');

            $taxes = [0 => trans('plugins/ecommerce::tax.select_tax')] + $taxes;

            $this->add('tax_id', 'customSelect', [
                'label'      => trans('plugins/ecommerce::products.form.tax'),
                'label_attr' => ['class' => 'control-label'],
                'choices'    => $taxes,
            ]);
        }
    }

}
