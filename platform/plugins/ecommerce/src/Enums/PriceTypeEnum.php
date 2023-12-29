<?php

namespace Botble\Ecommerce\Enums;

use Botble\Base\Supports\Enum;
use Html;

/**
 * @method static PriceTypeEnum HOURLY()
 * @method static PriceTypeEnum FIXED()
 */
class PriceTypeEnum extends Enum
{
    public const HOURLY = 'hourly';
    public const FIXED = 'fixed';

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
            case self::HOURLY:
                return Html::tag('span', self::HOURLY()->label(), ['class' => 'text-success'])
                    ->toHtml();
            case self::FIXED:
                return Html::tag('span', self::FIXED()->label(), ['class' => 'text-danger'])
                    ->toHtml();
            default:
                return parent::toHtml();
        }
    }
}
