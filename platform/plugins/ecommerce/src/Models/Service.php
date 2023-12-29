<?php

namespace Botble\Ecommerce\Models;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;
use Botble\Base\Traits\EnumCastable;
use Botble\Ecommerce\Tables\ProductTable;
use Botble\Ecommerce\Tables\ServiceTable;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Html;
use Illuminate\Support\Str;

class Service extends BaseModel
{
    use EnumCastable;

    /**
     * The database table used by the model.
     *
     * @var string
     */

    const ACTIVE_STATUS = 1;
    const INACTIVE_STATUS = 0;

    protected $table = 'ec_services';

    const FIXED_RATE = 1;
    const HOURLY_RATE = 2;

    const INDIVIDUAL = 1;
    const BUSINESS = 2;

    /**
     * @var array
     */
    protected $fillable = [
        'user_id',
        'name',
        'description',
        'availability',
        'status',
        'image',
        'price',
        'is_featured',
        'price_type',
        'service_type',
        'category_id',
        'country',
        'state',
        'city',
        'start_time',
        'end_time',
    ];

    /**
     * @var array
     */
    protected $casts = [
//        'status' => BaseStatusEnum::class,
    ];

    public function customer(){
        return $this->belongsTo(Customer::Class, 'user_id');
    }
    public function category(){
        return $this->belongsTo(Categories::Class, 'category_id');
    }

}
