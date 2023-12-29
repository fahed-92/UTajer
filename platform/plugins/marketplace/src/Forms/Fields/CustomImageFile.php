<?php

namespace Botble\Marketplace\Forms\Fields;

use Kris\LaravelFormBuilder\Fields\FormField;

class CustomImageFile extends FormField
{


    /**
     * {@inheritDoc}
     */
    protected function getTemplate()
    {
//        $imageDetail = json_decode($this->parent->getModel()->image ,true);
//        $img = $imageDetail['imgPath'];
        return 'plugins/marketplace::themes.dashboard.forms.fields.custom-image';
    }
}
