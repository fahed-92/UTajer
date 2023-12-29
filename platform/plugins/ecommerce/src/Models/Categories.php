<?php

namespace Botble\Ecommerce\Models;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;
use Botble\Base\Traits\EnumCastable;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Categories extends BaseModel
{
    use EnumCastable;

    /**
     * @var string
     */
    protected $table = 'categories';

    /**
     * @var array
     */
    protected $fillable = [
        'name',
        'parent_id',
        'descritpion',
        'status',
        'icon',
        'order',
        'is_featured',
        'is_default',
        'author_type',
        'author_id'
    ];

    /**
     * @return string
     */
    public function getProductNameAttribute()
    {
        return $this->product->name;
    }

    /**
     * @return string
     */
    public function getUserNameAttribute()
    {
        return $this->user->name;
    }
}
