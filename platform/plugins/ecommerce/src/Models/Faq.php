<?php

namespace Botble\Ecommerce\Models;

use Botble\Base\Models\BaseModel;
use Botble\Base\Supports\Helper;

class Faq extends BaseModel {

    const StatusUnUsed = 0;
    const StatusUsed = 1;

    protected $table = 'faqs';
    protected $fillable = ['id', 'question', 'answer', 'category_id', 'status', 'created_at', 'updated_at'];

}
