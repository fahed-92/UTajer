<?php

namespace Botble\Ecommerce\Models;

use Botble\Base\Models\BaseModel;
use Botble\Base\Supports\Helper;

class Payout extends BaseModel
{
    /**
     * @var string
     */
    protected $table = 'mp_payout';

    /**
     * @var array
     */
    protected $fillable = [
        'user_id',
        'stripe_account',
        'balance',
        'bank_token',
        'bank_account',
        'bank_information',
        'account_type',
    ];

    /**
     * @var array
     */
    protected $dates = [
        'created_at',
        'updated_at',
    ];

}
