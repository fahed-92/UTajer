<?php

namespace Botble\Ecommerce\Forms;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Forms\Fields\MultiCheckListField;
use Botble\Base\Forms\FormAbstract;
use Botble\Ecommerce\Enums\ServiceTypeEnum;
use Botble\Ecommerce\Forms\Fields\CategoryMultiField;
use Botble\Ecommerce\Forms\ServiceForm as BaseServiceForm;
use Botble\Ecommerce\Http\Requests\ProductCategoryRequest;
use Botble\Ecommerce\Http\Requests\ServiceRequest;
use Botble\Ecommerce\Models\ProductCategory;
use Botble\Ecommerce\Models\Service;
use Botble\Ecommerce\Repositories\Interfaces\ServiceInterface;
use Botble\Ecommerce\Repositories\Interfaces\TaxInterface;
use Botble\Marketplace\Forms\Fields\CustomEditorField;
use Botble\Marketplace\Forms\Fields\CustomImageFile;
use Illuminate\Support\Arr;
use Illuminate\Support\Collection;
use EcommerceHelper;
class ServiceForm extends FormAbstract
{

    /**
     * {@inheritDoc}
     */
    public function buildForm()
    {
        $serviceId = $this->getModel() ? $this->getModel()->id : null;
        $this
            ->setupModel(new Service)
            ->withCustomFields()
            ->addCustomField('customEditor', CustomEditorField::class)
            ->addCustomField('customImageFile', CustomImageFile::class)
            ->addCustomField('categoryMulti', CategoryMultiField::class)
            ->addCustomField('multiCheckList', MultiCheckListField::class)
            ->setFormOption('template', 'plugins/marketplace::themes.dashboard.forms.base')
            ->setFormOption('enctype', 'multipart/form-data')
            ->setValidatorClass(ServiceRequest::class)
            ->setActionButtons(view('plugins/marketplace::themes.dashboard.forms.actions')->render())
            ->add('name', 'text', [
                'label'      => trans('plugins/ecommerce::products.form.name'),
                'label_attr' => ['class' => 'text-title-field required'],
                'attr'       => [
                    'placeholder'  => trans('core/base::forms.name_placeholder'),
                    'data-counter' => 120,
                ],
            ])
            ->add('price', 'number', [
                'label'      => trans('Price'),
                'label_attr' => ['class' => 'text-title-field required'],
                'attr'       => [
                    'placeholder'  => trans('Price'),
                    'data-counter' => 120,
                ],
            ])
            ->addMetaBoxes([
                'general'    => [
                    'title'          => trans('plugins/ecommerce::products.overview'),
                    'content'        => view('plugins/ecommerce::services.partials.general',
                        [
                            'service' => $serviceId ? $this->getModel() : null,
                        ])
                        ->render(),
                    'before_wrapper' => '<div id="main-manage-product-type">',
                    'after_wrapper' => '</div>',
                    'priority'       => 2,
                ],
//                'with_related' => [
//                    'title'    => null,
//                    'content'  => '<div class="wrap-relation-product" data-target="' . route('marketplace.vendor.services.get-relations-boxes',
//                            $serviceId ?: 0) . '"></div>',
//                    'wrap'     => false,
//                    'priority' => 9999,
//                ],
            ])
            ->add('service_type', 'customSelect', [
                'label'      => trans('plugins/ecommerce::products.service_type'),
                'label_attr' => ['class' => 'control-label required'],
                'choices'    => ServiceTypeEnum::labels(),
            ])
            ->add('description', 'customEditor', [
                'label'      => trans('core/base::forms.description'),
                'label_attr' => ['class' => 'control-label'],
                'attr'       => [
                    'rows'         => 2,
                    'placeholder'  => trans('core/base::forms.description_placeholder'),
                    'data-counter' => 1000,
                ],
            ])

            ->add('images', 'customImageFile', [
                'label'      => trans('plugins/ecommerce::products.form.image'),
                'label_attr' => ['class' => 'control-label'],
                'values'     => $serviceId && $this->getModel()->image ? url('storage/'.(json_decode($this->getModel()->image,true)['imgPath'])) : [],
            ])

            ->add('country', 'text', [
                'label'      => trans('plugins/ecommerce::products.country'),
                'label_attr' => ['class' => 'text-title-field required'],
                'attr'       => [
                    'placeholder'  => trans('plugins/ecommerce::products.country'),
                    'data-counter' => 120,
                ],
            ])
            ->add('state', 'text', [
                'label'      => trans('plugins/ecommerce::products.state'),
                'label_attr' => ['class' => 'text-title-field required'],
                'attr'       => [
                    'placeholder'  => trans('plugins/ecommerce::products.state'),
                    'data-counter' => 120,
                ],
            ])
            ->add('city', 'text', [
                'label'      => trans('plugins/ecommerce::products.city'),
                'label_attr' => ['class' => 'text-title-field required'],
                'attr'       => [
                    'placeholder'  => trans('plugins/ecommerce::products.city'),
                    'data-counter' => 120,
                ],
            ])

        ;
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

    /**
     * @return Collection
     */
    public function getServiceAttributes($attributeSetId)
    {
        $params = ['order_by' => ['id' => 'DESC']];

        if ($attributeSetId) {
            $params['condition'] = [['attribute_set_id', '=', $attributeSetId]];
        }

        return app(ServiceInterface::class)->advancedGet($params);
    }
}
