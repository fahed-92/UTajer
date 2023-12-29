<?php

namespace Botble\Ecommerce\Models;

use Botble\Base\Models\BaseModel;
use Botble\Base\Supports\Helper;

class Contact extends BaseModel {

    const StatusUnUsed = 0;
    const StatusUsed = 1;

    protected $table = 'contacts';
    protected $fillable = ['name', 'email', 'phone', 'address', 'subject', 'content', 'status', 'created_at', 'updated_at'];

}
