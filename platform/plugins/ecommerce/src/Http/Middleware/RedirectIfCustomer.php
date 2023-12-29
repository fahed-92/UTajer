<?php

namespace Botble\Ecommerce\Http\Middleware;

use App\Models\User;
use Botble\Ecommerce\Models\Customer;
use Botble\Ecommerce\Models\MailOtp;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class RedirectIfCustomer
{
    /**
     * Handle an incoming request.
     *
     * @param Request $request
     * @param Closure $next
     * @param string|null $guard
     * @return mixed
     */
    public function handle(Request $request, Closure $next, $guard = 'customer')
    {
//        if (Auth::guard($guard)->check()) {
//            $user = auth('customer')->user();
//            if ($user) {
//                $mailOtp = MailOtp::where('email', $user->email)->first();
//                if ($mailOtp) {
//                    if ($mailOtp->status == MailOtp::StatusUnUsed) {
//                         return redirect(route('customer.otpVerification'));
//                    } else {
//                        return redirect(route('customer.overview'));
//                    }
//                }
//            }
//        }
        if (Auth::guard($guard)->check()) {
            return redirect(route('customer.overview'));
        }
        return $next($request);
    }
}
