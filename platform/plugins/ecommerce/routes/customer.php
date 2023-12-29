<?php

Route::group(['namespace' => 'Botble\Ecommerce\Http\Controllers\Customers', 'middleware' => ['web', 'core']],
    function () {
        Route::group(['prefix' => BaseHelper::getAdminPrefix(), 'middleware' => 'auth'], function () {
            Route::group(['prefix' => 'customers', 'as' => 'customers.'], function () {
                Route::resource('', 'CustomerController')->parameters(['' => 'customer']);

                Route::delete('items/destroy', [
                    'as'         => 'deletes',
                    'uses'       => 'CustomerController@deletes',
                    'permission' => 'customers.destroy',
                ]);
            });

            Route::group(['prefix' => 'customers', 'as' => 'customers.'], function () {
                Route::get('get-list-customers-for-select', [
                    'as'         => 'get-list-customers-for-select',
                    'uses'       => 'CustomerController@getListCustomerForSelect',
                    'permission' => 'customers.index',
                ]);

                Route::get('get-list-customers-for-search', [
                    'as'         => 'get-list-customers-for-search',
                    'uses'       => 'CustomerController@getListCustomerForSearch',
                    'permission' => ['customers.index', 'orders.index'],
                ]);

                Route::post('update-email/{id}', [
                    'as'         => 'update-email',
                    'uses'       => 'CustomerController@postUpdateEmail',
                    'permission' => 'customers.edit',
                ]);

                Route::get('get-customer-addresses/{id}', [
                    'as'         => 'get-customer-addresses',
                    'uses'       => 'CustomerController@getCustomerAddresses',
                    'permission' => ['customers.index', 'orders.index'],
                ]);

                Route::get('get-customer-order-numbers/{id}', [
                    'as'         => 'get-customer-order-numbers',
                    'uses'       => 'CustomerController@getCustomerOrderNumbers',
                    'permission' => ['customers.index', 'orders.index'],
                ]);

                Route::post('create-customer-when-creating-order', [
                    'as'         => 'create-customer-when-creating-order',
                    'uses'       => 'CustomerController@postCreateCustomerWhenCreatingOrder',
                    'permission' => ['customers.index', 'orders.index'],
                ]);
            });
        });
    });

Route::group([
    'namespace'  => 'Botble\Ecommerce\Http\Controllers\Customers',
    'middleware' => ['web', 'core', 'customer.guest'],
    'as'         => 'customer.',
], function () {
    Route::get('login', 'LoginController@showLoginForm')->name('login');
    Route::get('otp-verification', 'LoginController@registerMailOtp')->name('otpVerification');
    Route::post('otp-email-verify', 'LoginController@otpEmailVerification')->name('otpEmailVerification');
    Route::post('login', 'LoginController@login')->name('login.post');

    Route::get('register', 'RegisterController@showRegistrationForm')->name('register');
    Route::post('register', 'RegisterController@register')->name('register.post');
    Route::post('registerOtpVerify', 'RegisterController@registerOtpVerify')->name('registerOtpVerify.post');
    Route::post('password/email', 'ForgotPasswordController@sendResetLinkEmail')->name('password.request');
    Route::post('password/reset', 'ResetPasswordController@reset')->name('password.reset.post');
    Route::get('password/reset', 'ForgotPasswordController@showLinkRequestForm')->name('password.reset');
    Route::get('password/reset/{token}', 'ResetPasswordController@showResetForm')->name('password.reset.update');

    Route::get('verify', 'RegisterController@getVerify')->name('verify');

    Route::post('appLogin', 'LoginController@appLogin')->name('appLogin.post');

    Route::post('appRegister', 'RegisterController@appRegister')->name('appRegister.post');

    Route::post('getInfo', 'RegisterController@getInfo')->name('getInfo.post');
    Route::post('editUserInfo', 'RegisterController@editUserInfo')->name('editUserInfo.post');
    Route::post('appChangeLang', 'RegisterController@appChangeLang')->name('appChangeLang.post');
    Route::post('appUploadDoc', 'RegisterController@appUploadDoc')->name('appUploadDoc.post');
    Route::post('accountSetting', 'RegisterController@accountSetting')->name('accountSetting.post');
    Route::post('addBillingAddress', 'RegisterController@addBillingAddress')->name('addBillingAddress.post');
    Route::post('editBillingAddress', 'RegisterController@editBillingAddress')->name('editBillingAddress.post');
    Route::post('deleteBillingAddress', 'RegisterController@deleteBillingAddress')->name('deleteBillingAddress.post');
    Route::post('listBillingAddress', 'RegisterController@listBillingAddress')->name('listBillingAddress.post');
    Route::post('addDefaultBillingAddress', 'RegisterController@addDefaultBillingAddress')->name('addDefaultBillingAddress.post');
    
    Route::post('addUserCardDetails', 'CustomerController@addUserCardDetails')->name('addUserCardDetails.post');
    Route::post('editUserCardDetails', 'CustomerController@editUserCardDetails')->name('editUserCardDetails.post');
    Route::post('deleteUserCardDetails', 'CustomerController@deleteUserCardDetails')->name('deleteUserCardDetails.post');
    Route::post('listUserCardDetails', 'CustomerController@listUserCardDetails')->name('listUserCardDetails.post');
    Route::post('addDefaultUserCardDetails', 'CustomerController@addDefaultUserCardDetails')->name('addDefaultUserCardDetails.post');
    Route::post('contact_us', 'CustomerController@contact_us')->name('contact_us.post');
    Route::post('create_customer', 'CustomerController@create_customer')->name('create_customer.post');
    Route::post('userWishList', 'CustomerController@userWishList')->name('userWishList.post');
    Route::post('userCartList', 'CustomerController@userCartList')->name('userCartList.post');
    Route::post('faq', 'CustomerController@faq')->name('faq.post');
    Route::post('appUploadAvatar', 'RegisterController@appUploadAvatar')->name('appUploadAvatar.post');

    Route::post('appChangePasword', 'RegisterController@appChangePasword')->name('appChangePasword.post');

    Route::post('register-mail-otp-verify', 'RegisterController@registerMailOtpVerify')->name('register-mail-otp-verify.post');
    
    Route::post('register-mail-otp', 'RegisterController@registerMailOtp')->name('register-mail-otp.post');

    Route::post('reset-password', 'RegisterController@appResetPassword')->name('reset-password.post');
    Route::post('appLogout', 'LoginController@appLogout')->name('appLogout.post');
    Route::post('stripePost', 'StripeController@stripePost')->name('stripePost.post');
    Route::post('stripeToken', 'StripeController@stripeToken')->name('stripeToken.post');
    Route::post('saveData', 'StripeController@saveData')->name('saveData.post');
});

Route::group([
    'namespace'  => 'Botble\Ecommerce\Http\Controllers\Customers',
    'middleware' => [
        'web',
        'core',
        get_ecommerce_setting('verify_customer_email', 0) == 1 ? 'customer' : 'customer.guest',
    ],
    'as'         => 'customer.',
], function () {
    Route::get('register/confirm/resend', 'RegisterController@resendConfirmation')
        ->name('resend_confirmation');
    Route::get('register/confirm/{user}', 'RegisterController@confirm')
        ->name('confirm');
});

Route::group([
    'namespace'  => 'Botble\Ecommerce\Http\Controllers\Customers',
    'middleware' => ['web', 'core', 'customer'],
    'prefix'     => 'customer',
    'as'         => 'customer.',
], function () {
    Route::get('logout', 'LoginController@logout')->name('logout');

    Route::get('overview', [
        'as'   => 'overview',
        'uses' => 'PublicController@getOverview',
    ]);

    Route::get('edit-account', [
        'as'   => 'edit-account',
        'uses' => 'PublicController@getEditAccount',
    ]);

    Route::post('edit-account', [
        'as'   => 'edit-account.post',
        'uses' => 'PublicController@postEditAccount',
    ]);

    Route::get('change-password', [
        'as'   => 'change-password',
        'uses' => 'PublicController@getChangePassword',
    ]);

    Route::post('change-password', [
        'as'   => 'post.change-password',
        'uses' => 'PublicController@postChangePassword',
    ]);

    Route::get('orders', [
        'as'   => 'orders',
        'uses' => 'PublicController@getListOrders',
    ]);

    Route::get('services', [
        'as'   => 'services',
        'uses' => 'PublicController@getListServices',
    ]);

    Route::get('services/view/{id}', [
        'as'   => 'services.view',
        'uses' => 'PublicController@getViewService',
    ]);

    Route::get('orders/view/{id}', [
        'as'   => 'orders.view',
        'uses' => 'PublicController@getViewOrder',
    ]);

    Route::get('order/cancel/{id}', [
        'as'   => 'orders.cancel',
        'uses' => 'PublicController@getCancelOder',
    ]);

    Route::get('address', [
        'as'   => 'address',
        'uses' => 'PublicController@getListAddresses',
    ]);

    Route::get('address/create', [
        'as'   => 'address.create',
        'uses' => 'PublicController@getCreateAddress',
    ]);

    Route::post('address/create', [
        'as'   => 'address.create.post',
        'uses' => 'PublicController@postCreateAddress',
    ]);

    Route::get('address/edit/{id}', [
        'as'   => 'address.edit',
        'uses' => 'PublicController@getEditAddress',
    ]);

    Route::post('address/edit/{id}', [
        'as'   => 'address.edit.post',
        'uses' => 'PublicController@postEditAddress',
    ]);

    Route::get('address/delete/{id}', [
        'as'   => 'address.destroy',
        'uses' => 'PublicController@getDeleteAddress',
    ]);

    Route::get('orders/print/{id}', [
        'as'   => 'print-order',
        'uses' => 'PublicController@getPrintOrder',
    ]);

    Route::post('avatar', [
        'as'   => 'avatar',
        'uses' => 'PublicController@postAvatar',
    ]);
});
