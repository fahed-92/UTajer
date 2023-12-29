<?php

namespace Botble\Ecommerce\Http\Controllers\Fronts;

use Botble\Base\Http\Controllers\BaseController;
use Theme;
use Botble\Ecommerce\Models\ProductCategory;
use Illuminate\Http\Request;
use Assets;

class PublicProductCategoryController  extends BaseController
{
    public function getCategories(Request $request){
        $categories = '';
        Theme::breadcrumb()
            ->add(__('Home'), route('public.index'));

        return Theme::scope('ecommerce.categories.categories', compact('categories'),
            'plugins/ecommerce::categories.categories')->render();

    }

}
