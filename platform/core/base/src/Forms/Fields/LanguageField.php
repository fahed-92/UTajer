<?php

namespace Botble\Base\Forms\Fields;

use Kris\LaravelFormBuilder\Fields\LanguageType;

class LanguageField extends LanguageType
{

    /**
     * {@inheritDoc}
     */
    protected function getTemplate()
    {
        return 'core/base::forms.fields.language';
    }
}
