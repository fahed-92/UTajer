<?php

namespace Botble\Payment\Models;

use Botble\ACL\Models\User;
use Botble\Base\Models\BaseModel;
use Botble\Base\Traits\EnumCastable;
use Botble\Payment\Enums\PaymentMethodEnum;
use Botble\Payment\Enums\PaymentStatusEnum;
use Html;
use Illuminate\Database\Eloquent\Relations\MorphTo;

class Payment extends BaseModel
{
    use EnumCastable;

    const COMPLETED_STATUS = 'completed';
    const PAYMENT_TYPE = 'confirm';
    const PAYMENT_CONFIRMED = 'confirm';

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'payments';

    /**
     * @var array
     */
    protected $fillable = [
        'amount',
        'currency',
        'user_id',
        'service_id',
        'charge_id',
        'payment_channel',
        'description',
        'status',
        'order_id',
        'payment_type',
        'customer_id',
        'customer_type',
        'refunded_amount',
        'refund_note',
    ];

    /**
     * @var array
     */
    protected $casts = [
        'payment_channel' => PaymentMethodEnum::class,
        'status'          => PaymentStatusEnum::class,
        'metadata'        => 'array',
    ];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo(User::class)->withDefault();
    }

    /**
     * @return MorphTo
     */
    public function customer(): MorphTo
    {
        return $this->morphTo();
    }

    /**
     * @return string
     */
    public function getDescription(): string
    {
        $time = Html::tag('span', $this->created_at->diffForHumans(), ['class' => 'small italic']);

        return 'You have created a payment #' . $this->charge_id . ' via ' . $this->payment_channel->label() . ' ' . $time .
            ': ' . number_format($this->amount, 2) . $this->currency;
    }
}
