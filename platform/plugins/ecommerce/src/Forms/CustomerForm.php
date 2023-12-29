<?php

namespace Botble\Ecommerce\Forms;

use Botble\Base\Forms\FormAbstract;
use Botble\Ecommerce\Http\Requests\CustomerCreateRequest;
use Botble\Ecommerce\Models\Customer;
use DB;

class CustomerForm extends FormAbstract
{

    /**
     * @var string
     */
    protected $template = 'core/base::forms.form-tabs';

    /**
     * {@inheritDoc}
     */
    public function buildForm()
    {
        $countriesArr = array();
        $countriesDB = DB::table('countries_iso_list')->get()->toArray();
        foreach ($countriesDB as $key => $value) {
            $countriesArr[$value->abbreviations] = $value->country_name;
        }
        // echo "<pre>"; print_r($countriesArr);
        $this
            ->setupModel(new Customer)
            ->setValidatorClass(CustomerCreateRequest::class)
            ->withCustomFields()
            ->add('name', 'text', [
                'label'      => trans('core/base::forms.name'),
                'label_attr' => ['class' => 'control-label required'],
                'attr'       => [
                    'placeholder'  => trans('core/base::forms.name_placeholder'),
                    'data-counter' => 120,
                ],
            ])
            ->add('first_name', 'text', [
                'label'      => trans('plugins/ecommerce::payment.full_name'),
                'label_attr' => ['class' => 'control-label required'],
                'attr'       => [
                    'placeholder'  => trans('plugins/ecommerce::payment.full_name'),
                    'data-counter' => 120,
                ],
            ])
            ->add('last_name', 'text', [
                'label'      => trans('core/acl::users.last_name'),
                'label_attr' => ['class' => 'control-label required'],
                'attr'       => [
                    'placeholder'  => trans('core/acl::users.last_name'),
                    'data-counter' => 120,
                ],
            ])
            ->add('phone', 'text', [
                'label'      => trans('plugins/ecommerce::payment.phone'),
                'label_attr' => ['class' => 'control-label required'],
                'attr'       => [
                    'placeholder'  => trans('plugins/ecommerce::payment.phone'),
                ],
            ])
            ->add('email', 'text', [
                'label'      => trans('plugins/ecommerce::customer.email'),
                'label_attr' => ['class' => 'control-label required'],
                'attr'       => [
                    'placeholder'  => trans('plugins/ecommerce::customer.email_placeholder'),
                    'data-counter' => 60,
                ],
            ])
            ->add('gender', 'select', [
                'label'      => 'Gender',
                'label_attr' => ['class' => 'control-label required'],
                'attr'       => [
                    'class' => 'form-control select-full',
                ],
                'choices'    => ['male' => 'Male', 'female' => 'Female'],
            ])
            ->add('dob', 'date', [
                'label'      => 'DOB',
                'label_attr' => ['class' => 'control-label required'],
            ])
            ->add('job', 'text', [
                'label'      => 'Job',
                'label_attr' => ['class' => 'control-label required'],
                'attr'       => [
                    'placeholder'  => 'Job',
                ],
            ])
            ->add('business_name', 'text', [
                'label'      => 'Business name',
                'label_attr' => ['class' => 'control-label required'],
                'attr'       => [
                    'placeholder'  => 'Business name',
                ],
            ])
            ->add('country', 'customSelect', [
                'label'      => 'Country',
                'label_attr' => ['class' => 'control-label required'],
                'attr'       => [
                    'class' => 'form-control select-search-full',
                ],
                'choices'    => [0 => 'Select country'] + $countriesArr,
            ])
            ->add('address', 'text', [
                'label'      => 'Address',
                'label_attr' => ['class' => 'control-label required'],
                'attr'       => [
                    'placeholder'  => 'Address',
                    'data-counter' => 120,
                ],
            ])
            ->add('city', 'text', [
                'label'      => 'City',
                'label_attr' => ['class' => 'control-label required'],
                'attr'       => [
                    'placeholder'  => 'City',
                ],
            ])
            ->add('zip_code', 'text', [
                'label'      => 'Zip code',
                'label_attr' => ['class' => 'control-label required'],
                'attr'       => [
                    'placeholder'  => 'Zip code',
                ],
            ])
            ->add('is_change_password', 'checkbox', [
                'label'      => trans('plugins/ecommerce::customer.change_password'),
                'label_attr' => ['class' => 'control-label'],
                'attr'       => [
                    'class' => 'hrv-checkbox',
                ],
                'value'      => 1,
            ])
            ->add('password', 'password', [
                'label'      => trans('plugins/ecommerce::customer.password'),
                'label_attr' => ['class' => 'control-label required'],
                'attr'       => [
                    'data-counter' => 60,
                ],
                'wrapper'    => [
                    'class' => $this->formHelper->getConfig('defaults.wrapper_class') . ($this->getModel()->id ? ' hidden' : null),
                ],
            ])
            ->add('password_confirmation', 'password', [
                'label'      => trans('plugins/ecommerce::customer.password_confirmation'),
                'label_attr' => ['class' => 'control-label required'],
                'attr'       => [
                    'data-counter' => 60,
                ],
                'wrapper'    => [
                    'class' => $this->formHelper->getConfig('defaults.wrapper_class') . ($this->getModel()->id ? ' hidden' : null),
                ],
            ]);
    }
}
