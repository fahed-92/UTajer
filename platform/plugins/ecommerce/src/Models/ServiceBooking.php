<?php

namespace Botble\Ecommerce\Models;

use Botble\ACL\Models\User;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;
use Botble\Base\Traits\EnumCastable;
use Botble\Ecommerce\Enums\OrderStatusEnum;
use Botble\Ecommerce\Tables\ProductTable;
use Botble\Ecommerce\Tables\ServiceTable;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Html;
use Illuminate\Support\Str;

class ServiceBooking extends BaseModel
{

    const ACTIVE_STATUS = 1;
    const INACTIVE_STATUS = 0;

    const PENDING_STATUS = 'pending';
    const PAID_STATUS = 'paid';
    const CLOSE_STATUS = 'close';
    const COMPLETED_STATUS = 'completed';
    const DELETED_STATUS = 'deleted';
    const DEFAULT_INSTANCE = 'default';

    protected $table = 'ec_service_booking';

    protected $instance;

    /**
     * @var array
     */
    protected $fillable = [
        'user_id',
        'service_id',
        'date',
        'start_time',
        'end_time',
        'status',
        'note',
        'token',
        'coupon_code',
        'amount',
        'discount_amount',
        'tax',
        'sub_total',
    ];

    protected $casts = [
      'service',
      'customer',
    ];

    public function service(){
        return $this->belongsTo(Service::Class, 'service_id');
    }

    public function customer(){
        return $this->belongsTo(Customer::Class, 'user_id');
    }

    public function instance($instance = null)
    {
        $instance = $instance ?: self::DEFAULT_INSTANCE;

        $this->instance = sprintf('%s.%s', 'cart', $instance);

        return $this;
    }
    public function canBeCanceled()
    {
        return in_array($this->status, [ServiceBooking::PENDING_STATUS, ServiceBooking::CLOSE_STATUS]);
    }

}
