<?php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\V1\AuthController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method, Authorization");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");

$prefix = 'v1';
/**
 *
 * All Api without Authentication
 *
 */


Route::group(['prefix' => $prefix], function () {
    Route::post('/register', [AuthController::class, 'register']);
    Route::post('/login', [AuthController::class, 'login']);
});

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/service-listing', [\Botble\Ecommerce\Http\Controllers\ServiceController::class, 'listing']);
Route::post('/create-service', [\Botble\Ecommerce\Http\Controllers\ServiceController::class, 'createService']);
Route::post('/update-service', [\Botble\Ecommerce\Http\Controllers\ServiceController::class, 'updateService']);
Route::delete('/delete-service/{id}', [\Botble\Ecommerce\Http\Controllers\ServiceController::class, 'deleteService']);

Route::post('/service-booking', [\Botble\Ecommerce\Http\Controllers\ServiceController::class, 'ServiceBooking']);
Route::post('/service-booking-payment', [\Botble\Ecommerce\Http\Controllers\ServiceController::class, 'ServiceBookingPayment']);
Route::post('/attach-account', [\Botble\Ecommerce\Http\Controllers\ServiceController::class, 'attachAccount']);
Route::post('/account-balance', [\Botble\Ecommerce\Http\Controllers\ServiceController::class, 'accountBalance']);

