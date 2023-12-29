<?php

Route::group(['namespace' => 'Botble\Marketplace\Http\Controllers', 'middleware' => ['web', 'core']], function () {

    Route::group(['prefix' => BaseHelper::getAdminPrefix(), 'middleware' => 'auth'], function () {

        Route::group(['prefix' => 'marketplaces', 'as' => 'marketplace.'], function () {
            Route::group(['prefix' => 'stores', 'as' => 'store.'], function () {
                Route::resource('', 'StoreController')->parameters(['' => 'store']);
                Route::delete('items/destroy', [
                    'as'         => 'deletes',
                    'uses'       => 'StoreController@deletes',
                    'permission' => 'marketplace.store.destroy',
                ]);
            });

            Route::group(['prefix' => 'withdrawals', 'as' => 'withdrawal.'], function () {
                Route::resource('', 'WithdrawalController')
                    ->parameters(['' => 'withdrawal'])
                    ->except([
                        'create',
                        'store',
                    ]);

                Route::delete('items/destroy', [
                    'as'         => 'deletes',
                    'uses'       => 'WithdrawalController@deletes',
                    'permission' => 'marketplace.withdrawal.destroy',
                ]);
              });
//            Services Controller
            Route::group(['prefix' => 'service', 'as' => 'service.'], function () {
                Route::resource('', 'ServiceController')
                    ->parameters(['' => 'service']);

                Route::delete('items/destroy', [
                    'as'         => 'deletes',
                    'uses'       => 'WithdrawalController@deletes',
                    'permission' => 'marketplace.service.destroy',
                ]);
              });
//            Services Controller
            Route::group(['prefix' => 'booked-service', 'as' => 'booked-service.'], function () {
                Route::resource('', 'BookedServiceController')
                    ->parameters(['' => 'booked-service']);

                Route::delete('items/destroy', [
                    'as'         => 'deletes',
                    'uses'       => 'BookedServiceController@deletes',
                    'permission' => 'marketplace.booked-service.destroy',
                ]);
                Route::get('items/complete', [
                    'as'         => 'complete',
                    'uses'       => 'BookedServiceController@complete',
                    'permission' => 'marketplace.booked-service.complete',
                ]);
              });

            Route::match(['get', 'post'], '/settings', [
                'as'   => 'settings',
                'uses' => 'MarketplaceController@settings',
            ]);
        });

    });

});
