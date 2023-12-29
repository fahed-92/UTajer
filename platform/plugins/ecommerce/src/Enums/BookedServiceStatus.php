<?php

namespace Botble\Ecommerce\Enums;

use Botble\Base\Supports\Enum;
use Html;

/**
 * @method static PriceTypeEnum HOURLY()
 * @method static PriceTypeEnum FIXED()
 */
class BookedServiceStatus extends Enum
{
    public const PENDING_STATUS = 'pending';
    public const PAID_STATUS = 'paid';
    public const CLOSE_STATUS = 'close';
    public const COMPLETED_STATUS = 'completed';
    public const DELETED_STATUS = 'deleted';

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
            case self::PENDING_STATUS:
                return Html::tag('span', self::PENDING_STATUS()->label(), ['class' => 'text-success'])
                    ->toHtml();
            case self::PAID_STATUS:
                return Html::tag('span', self::PAID_STATUS()->label(), ['class' => 'text-warning'])
                    ->toHtml();
            case self::CLOSE_STATUS:
                return Html::tag('span', self::CLOSE_STATUS()->label(), ['class' => 'text-success'])
                    ->toHtml();
            case self::COMPLETED_STATUS:
                return Html::tag('span', self::COMPLETED_STATUS()->label(), ['class' => 'text-danger'])
                    ->toHtml();
            case self::DELETED_STATUS:
                return Html::tag('span', self::DELETED_STATUS()->label(), ['class' => 'text-danger'])
                    ->toHtml();
            default:
                return parent::toHtml();
        }
    }
}
