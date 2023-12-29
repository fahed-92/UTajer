<?php

namespace Botble\Ecommerce\Enums;

use Botble\Base\Supports\Enum;
use Html;

/**
 * @method static ServiceTypeEnum INDIVIDUAL()
 * @method static ServiceTypeEnum BUSINESS()
 */
class ServiceTypeEnum extends Enum
{
    public const INDIVIDUAL = 'individual';
    public const BUSINESS = 'business';

    /**
     * @var string
     */
    public static $langPath = 'plugins/ecommerce::products.price_type_statuses';

    /**
     * @return string
     */
    public function toHtml()
    {
        switch ($this->value) {
            case self::INDIVIDUAL:
                return Html::tag('span', self::INDIVIDUAL()->label(), ['class' => 'text-success'])
                    ->toHtml();
            case self::BUSINESS:
                return Html::tag('span', self::BUSINESS()->label(), ['class' => 'text-danger'])
                    ->toHtml();
            default:
                return parent::toHtml();
        }
    }
}
