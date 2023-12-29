<?php

namespace Botble\Ecommerce\Models;

use Botble\ACL\Models\User;
use Botble\Base\Models\BaseModel;
use Exception;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Page extends BaseModel
{

    /**
     * @var string
     */
    protected $table = 'pages';

    /**
     * @var array
     */
    protected $fillable = [
        'name',
        'content',
        'user_id',
        'image',
        'template',
        'is_featured',
        'description',
        'status'
    ];

    /**
     * @var array
     */
    protected $dates = [
        'created_at',
        'updated_at',
    ];

    /**
     * @return BelongsTo
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id')->withDefault();
    }
}
