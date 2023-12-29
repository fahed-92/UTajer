<?php

Route::group(['namespace' => 'Botble\Ecommerce\Http\Controllers', 'middleware' => ['web', 'core']], function () {
    Route::group(['prefix' => BaseHelper::getAdminPrefix() . '/ecommerce', 'middleware' => 'auth'], function () {
        Route::group(['prefix' => 'products', 'as' => 'products.'], function () {
            Route::resource('', 'ProductController')
                ->parameters(['' => 'product']);

            Route::delete('items/destroy', [
                'as'         => 'deletes',
                'uses'       => 'ProductController@deletes',
                'permission' => 'products.destroy',
            ]);

            Route::post('add-attribute-to-product/{id}', [
                'as'         => 'add-attribute-to-product',
                'uses'       => 'ProductController@postAddAttributeToProduct',
                'permission' => 'products.edit',
            ]);

            Route::post('delete-version/{id}', [
                'as'         => 'delete-version',
                'uses'       => 'ProductController@deleteVersion',
                'permission' => 'products.edit',
            ]);

            Route::delete('items/delete-versions', [
                'as'         => 'delete-versions',
                'uses'       => 'ProductController@deleteVersions',
                'permission' => 'products.edit',
            ]);

            Route::post('add-version/{id}', [
                'as'         => 'add-version',
                'uses'       => 'ProductController@postAddVersion',
                'permission' => 'products.edit',
            ]);

            Route::get('get-version-form/{id?}', [
                'as'         => 'get-version-form',
                'uses'       => 'ProductController@getVersionForm',
                'permission' => 'products.edit',
            ]);

            Route::post('update-version/{id}', [
                'as'         => 'update-version',
                'uses'       => 'ProductController@postUpdateVersion',
                'permission' => 'products.edit',
            ]);

            Route::post('generate-all-version/{id}', [
                'as'         => 'generate-all-versions',
                'uses'       => 'ProductController@postGenerateAllVersions',
                'permission' => 'products.edit',
            ]);

            Route::post('store-related-attributes/{id}', [
                'as'         => 'store-related-attributes',
                'uses'       => 'ProductController@postStoreRelatedAttributes',
                'permission' => 'products.edit',
            ]);

            Route::post('save-all-version/{id}', [
                'as'         => 'save-all-versions',
                'uses'       => 'ProductController@postSaveAllVersions',
                'permission' => 'products.edit',
            ]);

            Route::get('get-list-product-for-search', [
                'as'         => 'get-list-product-for-search',
                'uses'       => 'ProductController@getListProductForSearch',
                'permission' => 'products.edit',
            ]);

            Route::get('get-relations-box/{id?}', [
                'as'         => 'get-relations-boxes',
                'uses'       => 'ProductController@getRelationBoxes',
                'permission' => 'products.edit',
            ]);

            Route::get('get-list-products-for-select', [
                'as'         => 'get-list-products-for-select',
                'uses'       => 'ProductController@getListProductForSelect',
                'permission' => 'products.index',
            ]);

            Route::post('create-product-when-creating-order', [
                'as'         => 'create-product-when-creating-order',
                'uses'       => 'ProductController@postCreateProductWhenCreatingOrder',
                'permission' => 'products.create',
            ]);

            Route::get('get-all-products-and-variations', [
                'as'         => 'get-all-products-and-variations',
                'uses'       => 'ProductController@getAllProductAndVariations',
                'permission' => 'products.index',
            ]);

            Route::post('update-order-by', [
                'as'         => 'update-order-by',
                'uses'       => 'ProductController@postUpdateOrderby',
                'permission' => 'products.edit',
            ]);
        });
    });
});

Route::group([
    'namespace'  => 'Botble\Ecommerce\Http\Controllers',
    'middleware' => ['web', 'core'],
    'as'         => 'order.',
], function () {
    Route::get('productCategories', 'ProductController@productCategories')->name('productCategories.get');
    Route::post('appProductListing', 'ProductController@appProductListing')->name('appProductListing.post');
    Route::post('appProductDetail', 'ProductController@appProductDetail')->name('appProductDetail.post');
    Route::post('addToCart', 'ProductController@addToCart')->name('addToCart.post');
    Route::post('appProductFav', 'ProductController@appProductFav')->name('appProductFav.post');
    Route::post('addToCart', 'ProductController@addToCart')->name('addToCart.post');
    Route::post('editCart', 'ProductController@editCart')->name('editCart.post');
    Route::post('removeFromCart', 'ProductController@removeFromCart')->name('removeFromCart.post');
    Route::post('productSearch', 'ProductController@productSearch')->name('productSearch.post');
    Route::post('similarProducts', 'ProductController@similarProducts')->name('similarProducts.post');
    Route::post('productFilter', 'ProductController@productFilter')->name('productFilter.post');
    Route::post('productFilterTags', 'ProductController@productFilterTags')->name('productFilterTags.post');
    Route::post('getProductCharges', 'ProductController@getProductCharges')->name('getProductCharges.post');
    Route::post('checkProductDiscount', 'ProductController@checkProductDiscount')->name('checkProductDiscount.post');
    Route::post('returnProduct', 'ProductController@returnProduct')->name('returnProduct.post');
    Route::post('addInstructionCart', 'ProductController@addInstructionCart')->name('addInstructionCart.post');
    Route::post('subCategories', 'ProductController@subCategories')->name('subCategories.post');
    Route::post('productSubCategories', 'ProductController@productSubCategories')->name('productSubCategories.post');
    Route::post('categorySearch', 'ProductController@categorySearch')->name('categorySearch.post');
    Route::get('offers', 'ProductController@offers')->name('offers.post');
    Route::get('return_policy', 'ProductController@return_policy')->name('return_policy.post');
    Route::get('terms_and_conditions', 'ProductController@terms_and_conditions')->name('terms_and_conditions.post');
    Route::post('offerProducts', 'ProductController@offerProducts')->name('offerProducts.post');
    Route::post('returnOrderList', 'ProductController@returnOrderList')->name('returnOrderList.post');
   /* Vendor Routes */
    Route::post('create-slug', 'ProductController@createSlug')->name('createSlug.post');
    Route::post('appAddProduct', 'ProductController@appAddProduct')->name('appAddProduct.post');
    Route::post('appUpdateProduct', 'ProductController@appUpdateProduct')->name('appUpdateProduct.post');
    Route::post('appProductsList', 'ProductController@appProductsList')->name('appProductsList.post');
    Route::post('appDeleteProduct', 'ProductController@appDeleteProduct')->name('appDeleteProduct.post');
    Route::post('getEarningBalance', 'ServiceController@getEarningBalance')->name('getEarningBalance.post');
    Route::post('getStats', 'ServiceController@getStats')->name('getStats.post');

    Route::post('/service-listing', 'ServiceController@listing')->name('serviceListing');
    Route::post('/create-service', 'ServiceController@createService')->name('createService');
    Route::post('/update-service', 'ServiceController@updateService')->name('updateService');
    Route::post('/service-booking', 'ServiceController@ServiceBooking')->name('serviceBooking');
    Route::post('/service-booking-payment', 'ServiceController@ServiceBookingPayment')->name('bookingPayment');
    Route::post('/deleteService', 'ServiceController@deleteService')->name('deleteService');
    Route::post('/appUpdateBookedServiceStatus', 'ServiceController@updateBookedServiceStatus')->name('appUpdateBookedServiceStatus.post');
    Route::post('/attachAccount', 'ServiceController@attachAccount')->name('attachAccount');
    Route::post('/accountBalance', 'ServiceController@accountBalance')->name('accountBalance');
    Route::post('/getShopInfo', 'ServiceController@getShopInfo')->name('getShopInfo');
    Route::post('/getOrders', 'OrderController@appOrderList')->name('getOrders');
    Route::post('/orderStatusUpdate', 'OrderController@appOrderStatusUpdate')->name('orderStatusUpdate');
    Route::post('/appCreateUpdateShop', 'ProductController@appCreateUpdateShop')->name('appCreateUpdateShop.post');
    Route::post('/appCategories', 'ProductController@appCategories')->name('appCategories.post');
    Route::post('/getAccountDetails', 'ServiceController@getAccountDetails')->name('getAccountDetails.post');
    Route::post('/transferBalanceToBankAccount', 'ServiceController@transferBalanceToBankAccount')->name('transferBalanceToBankAccount.post');
    Route::post('/withDrawalRequest', 'ServiceController@withDrawalRequest')->name('withDrawalRequest.post');
    Route::post('/appImageUpload', 'ServiceController@appImageUpload')->name('appImageUpload.post');


});