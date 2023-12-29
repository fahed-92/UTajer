<?php

namespace Botble\Ecommerce\Models;

use Botble\Base\Models\BaseModel;
use Botble\Base\Supports\Helper;

class VerificationDoc extends BaseModel
{
    
    /**
     * @var string
     */
    protected $table = 'ec_verification_doc';

    /**
     * @var array
     */
    protected $fillable = [
        'user_id',
        'trade_license_id',
        'validity_date',
        'doc_photo1',
    ];

    /**
     * @var array
     */
    protected $dates = [
        'created_at',
        'updated_at',
    ];

}
