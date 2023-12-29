<?php

namespace Botble\Ecommerce\Models;

use Botble\ACL\Models\User;
use Botble\Base\Models\BaseModel;
use Exception;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class UserCardDetails extends BaseModel
{

    /**
     * @var string
     */
    protected $table = 'ec_user_card_details';

    /**
     * @var array
     */
    protected $fillable = [
        'id',
        'user_id',
        'name',
        'card_no',
        'expires_on',
        'cvv',
        'type',
        'is_default'
    ];

    /**
     * @var array
     */
    protected $dates = [
        'created_at',
        'updated_at',
    ];
}
