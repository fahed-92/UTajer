<?php

namespace Botble\Ecommerce\Models;

use Botble\ACL\Models\User;
use Botble\Base\Models\BaseModel;
use Exception;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Botble\Base\Enums\BaseStatusEnum;

class Store extends BaseModel
{

    /**
     * @var string
     */
    protected $table = 'mp_stores';

    /**
     * @var array
     */
    protected $fillable = [
        'name',
        'email',
        'phone',
        'address',
        'country',
        'state',
        'city',
        'customer_id',
        'logo',
        'description',
        'content',
        'status',
    ];


    /**
     * @var array
     */
    protected $dates = [
        'created_at',
        'updated_at',
    ];

    /**
     * @var array
     */
    protected $casts = [
//        'status' => BaseStatusEnum::class,
    ];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function customer(): BelongsTo
    {
        return $this->belongsTo(Customer::class)->withDefault();
    }

    /**
     * @return HasMany
     */
    public function products(): HasMany
    {
        return $this->hasMany(Product::class);
    }

    /**
     * @return HasMany
     */
    public function orders(): HasMany
    {
        return $this->hasMany(Order::class)->where('is_finished', 1);
    }

    public function productsList()
    {
        return $this->hasMany(Product::class,'store_id');
    }

    /**
     * @return string
     */
    public function getLogoUrlAttribute()
    {
        if ($this->logo) {
            return RvMedia::getImageUrl($this->logo, 'thumb');
        }

        try {
            return (new Avatar)->create($this->name)->toBase64();
        } catch (Exception $exception) {
            return RvMedia::getDefaultImage();
        }
    }
}
