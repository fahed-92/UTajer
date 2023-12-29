<?php

namespace Botble\Ecommerce\Models;

use Botble\Base\Models\BaseModel;
use Botble\Base\Supports\Helper;

class ReturnProduct extends BaseModel {

    const StatusUnUsed = 0;
    const StatusUsed = 1;

    protected $table = 'return_product';
    protected $fillable = ['id', 'email', 'subject', 'reason', 'product_id', 'user_id', 'order_id','order_date', 'estimate_delivery_date','created_at', 'updated_at'];

}
