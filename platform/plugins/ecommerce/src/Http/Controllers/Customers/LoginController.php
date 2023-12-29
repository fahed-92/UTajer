<?php

namespace Botble\Ecommerce\Http\Controllers\Customers;

use App\Http\Controllers\Controller;
use Botble\ACL\Traits\AuthenticatesUsers;
use Botble\ACL\Traits\LogoutGuardTrait;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Ecommerce\Models\MailOtp;
use Illuminate\Auth\Events\Registered;
use Illuminate\Contracts\Auth\StatefulGuard;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;
use SeoHelper;
use Symfony\Component\HttpFoundation\Response;
use Theme;
use Illuminate\Support\Facades\Hash;
use Botble\Ecommerce\Models\Customer;
use Botble\Ecommerce\Repositories\Interfaces\CustomerInterface;
use Illuminate\Support\Facades\Validator;
use Botble\Ecommerce\Helpers\Common;
use Illuminate\Support\Str;
use Cart;
/**
 * @OA\Info(
 *    title="Your super  ApplicationAPI",
 *    version="1.0.0",
 * )
 */
class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers, LogoutGuardTrait {
        AuthenticatesUsers::attemptLogin as baseAttemptLogin;
    }

    /**
     * Where to redirect users after login / registration.
     *
     * @var string
     */
    public $redirectTo;

    /**
     * @var CustomerInterface
     */
    protected $customerRepository;

    /**
     * Create a new controller instance.
     */
    public function __construct(CustomerInterface $customerRepository)
    {
        $this->middleware('customer.guest', ['except' => 'logout']);
        $this->customerRepository = $customerRepository;
    }

    /**
     * Show the application's login form.
     *
     * @return \Response
     */
    public function showLoginForm()
    {
        SeoHelper::setTitle(__('Login'));

        Theme::breadcrumb()->add(__('Home'), route('public.index'))->add(__('Login'), route('customer.login'));

        if (!session()->has('url.intended')) {
            if (!in_array(url()->previous(), [route('customer.login'), route('customer.register')])) {
                session(['url.intended' => url()->previous()]);
            }
        }

        return Theme::scope('ecommerce.customers.login', [], 'plugins/ecommerce::themes.customers.login')->render();
    }

    /**
     * Get the guard to be used during authentication.
     *
     * @return StatefulGuard
     */
    protected function guard()
    {
        return auth('customer');
    }

    /**
     * @param Request $request
     * @return Response|void
     * @throws ValidationException
     * @throws ValidationException
     */
    public function login(Request $request)
    {
        $this->validateLogin($request);
        if ($this->hasTooManyLoginAttempts($request)) {
            $this->fireLockoutEvent($request);
            $this->sendLockoutResponse($request);
        }
        $customer = Customer::where('email',$request->email)->first();
        if ($customer){
            if (Hash::check($request->password, $customer->password)) {
                $data = [
                    'otp' => str_pad(rand('000000', '999999'), 6, '0', STR_PAD_LEFT),
                    'status' => MailOtp::StatusUnUsed
                ];
                $mail = sendMail(request()->get('email'), 'Login Otp', $data, 'emails.registerMailOtp');
                if ($mail) {
                    session(['login_user' => $request->all()]);
                    $check = MailOtp::where(['email' => request()->get('email')])->first();
                    if ($check) {
                        $check->update($data);
                    } else {
                        MailOtp::create(array_merge(request()->all(), $data));
                    }
                    return redirect('otp-verification');
                } else {
                    $this->sendFailedLoginResponse();
                }
            } else {
                $this->sendFailedLoginResponse();
            }
        } else {
            $this->sendFailedLoginResponse();
        }
//        if ($this->attemptLogin($request)) {
//            return $this->sendLoginResponse($request) ?redirect('/login'): "";
//        }
        // If the login attempt was unsuccessful we will increment the number of attempts
        // to log in and redirect the user back to the login form. Of course, when this
        // user surpasses their maximum number of attempts they will get locked out.
//        $this->incrementLoginAttempts($request);
//        $this->sendFailedLoginResponse();
    }
    public function registerMailOtp() {
        return Theme::scope('ecommerce.customers.otp-screen', [], 'plugins/ecommerce::themes.customers.login')->render();
    }

    public function otpEmailVerification(request $request) {
        $loginSession = session()->get('login_user');
        $first = $request->first;
        $second = $request->second;
        $third = $request->third;
        $fourth = $request->fourth;
        $fifth = $request->fifth;
        $sixth = $request->sixth;
        $otp =  implode('', [$first,$second,$third,$fourth,$fifth,$sixth]);
        $check = MailOtp::where(array('otp'=>$otp, 'status' => MailOtp::StatusUnUsed))->first();
        if ($check) {
            $check->update(['status' => MailOtp::StatusUsed]);
            $customer = Customer::where('email',$loginSession['email'])->first();
            $request['email'] = $loginSession['email'];
            $request['password'] = $loginSession['password'];
            $request['_token'] = $loginSession['_token']; 
             if ($this->attemptLogin($request)) {
                return redirect('/customer/overview');
            }  else {
               $this->sendFailedLoginResponse();
                return redirect('/login');
            }
       } else {
             throw ValidationException::withMessages([
                 $this->username() => "Your given OTP is not matched.",
             ]);
         }
    }

    /**
     * Log the user out of the application.
     *
     * @param Request $request
     * @return RedirectResponse
     */
    public function logout(Request $request)
    {
        Cart::instance('cart')->destroy();
        $this->guard()->logout();

        return $this->loggedOut($request) ?: redirect('/');
    }

    /**
     * Attempt to log the user into the application.
     *
     * @param Request $request
     * @return bool
     * @throws ValidationException
     */
    protected function attemptLogin(Request $request)
    {
         if ($this->guard()->validate($this->credentials($request))) {

            $customer = $this->guard()->getLastAttempted();

            if (get_ecommerce_setting('verify_customer_email', 0) && empty($customer->confirmed_at)) {
                throw ValidationException::withMessages([
                    'confirmation' => [
                        __('The given email address has not been confirmed. <a href=":resend_link">Resend confirmation link.</a>',
                            [
                                'resend_link' => route('customer.resend_confirmation', ['email' => $customer->email]),
                            ]),
                    ],
                ]);
            }

            return $this->baseAttemptLogin($request);
        }
        return false;
    }

    public function appLogin(Request $request,CustomerInterface $customerRepository)
    {
        $validator = $this->appValidator($request->input());
        if($validator == "success"){

            $credential = [
                'email' => $request->input('email'),
                'password' => $request->input('password'),
                'device_token' => $request->input('device_token')
            ];

            $emailCheck = $customerRepository->getFirstBy(['email' => $request->input('email')]);
            if ($emailCheck) {

                if (Hash::check($request->input('password'), $emailCheck->getAuthPassword())) {

                    $customer = $customerRepository->getFirstBy(['email' => $request->input('email'),'password' => $emailCheck->getAuthPassword()]);

                    if($customer){
                        // echo
                        // Authentication passed...
                        /*Check if email is verified*/
                        $customer->device_token = $request->input('device_token');
                        $customer->api_token = Str::random(80);
                        $customer->save();
                        $customer['role'] = Customer::RoleCustomer;
                        $customer['phone'] = str_replace('+', '', $customer['phone']);
                        $customer['email_verified_at'] = now();
                        unset($customer['email_verify_token']);
                        unset($customer['confirmed_at']);
                        return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.loginSuccess'), $customer);
                    }else{
                        return returnResponse(false, 400, null, __('alias.requests.auth.login.deviceError'));
                    }
                }else{
                    return returnResponse(false, 400, null,__('alias.requests.auth.login.incorrectPassword'));
                }
            }else{
                return returnResponse(false, 400, null, __('alias.requests.auth.login.emailNotExist'));
            }
        }else{
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.unauthenticated'));
        }
    }
    public function appValidator(array $data)
    {
        $rules = [
            'email'    => 'required|email',
            'password' => 'required',
            'device_token'     => 'required|max:255',
        ];
        $validation = Validator::make($data, $rules);
        if($validation->passes()) {
            return 'success';
        } else {
            $errors = $validation->errors(); //here's the magic
            return $errors;
        }
    }

    public function resendVerificationMail($request) {
        if ($request->user()->hasVerifiedEmail()) {
            return false;
        }
        $request->user()->sendEmailVerificationNotification();
        return true;
    }

    public function appLogout(Request $request,CustomerInterface $customerRepository) {
        $input = request()->all();
        $customer = $customerRepository->getFirstBy(['email' => $request->input('email')]);
        if($customer) {
            $this->guard()->logout();
            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.logoutUserSuccessfully'));
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }
}
