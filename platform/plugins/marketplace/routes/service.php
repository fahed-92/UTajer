<?php

Route::group([
    'namespace'  => 'Botble\Marketplace\Http\Controllers\Fronts',
    'middleware' => ['web', 'core'],
], function () {
    Route::group(['prefix' => 'vendor', 'as' => 'marketplace.vendor.', 'middleware' => ['vendor']], function () {
        Route::group(['prefix' => 'services', 'as' => 'services.'], function () {
            Route::resource('', 'ServiceController')
                ->parameters(['' => 'service']);

            Route::delete('items/destroy', [
                'as'   => 'deletes',
                'uses' => 'ServiceController@deletes',
            ]);
            Route::get('get-relations-box/{id?}', [
                'as'   => 'get-relations-boxes',
                'uses' => 'ServiceController@getRelationBoxes',
            ]);
        });
        Route::group(['prefix' => 'booked-services', 'as' => 'booked-services.'], function () {
            Route::resource('', 'BookedServiceController')
                ->parameters(['' => 'booked-services']);
            Route::delete('items/destroy', [
                'as'   => 'deletes',
                'uses' => 'BookedServiceController@deletes',
            ]);
            Route::get('complete/{id}', [
                'as'         => 'complete',
                'uses'       => 'BookedServiceController@complete',
            ]);
        });

    });
});
