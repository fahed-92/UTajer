<?php

namespace Botble\Ecommerce\Models;

use Botble\Base\Models\BaseModel;
use Botble\Base\Supports\Helper;

class MailOtp extends BaseModel {

    const StatusUnUsed = 0;
    const StatusUsed = 1;

    protected $table = 'ec_mailotp';
    protected $fillable = ['id', 'email', 'otp', 'status', 'created_at', 'updated_at'];

}
