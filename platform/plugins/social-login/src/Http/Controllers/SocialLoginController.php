<?php

namespace Botble\SocialLogin\Http\Controllers;

use Assets;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Ecommerce\Repositories\Interfaces\CustomerInterface;
use Botble\Setting\Supports\SettingStore;
use Botble\SocialLogin\Http\Requests\SocialLoginRequest;
use Exception;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use RvMedia;
use Socialite;
use Illuminate\Http\Request;
use GuzzleHttp\Client;

class SocialLoginController extends BaseController
{

    /**
     * Redirect the user to the {provider} authentication page.
     *
     * @param string $provider
     * @return mixed
     */
    public function redirectToProvider($provider)
    {
        $this->setProvider($provider);

        return Socialite::driver($provider)->redirect();
    }

    /**
     * @param string $provider
     */
    protected function setProvider(string $provider)
    {
        config()->set([
            'services.' . $provider => [
                'client_id'     => setting('social_login_' . $provider . '_app_id'),
                'client_secret' => setting('social_login_' . $provider . '_app_secret'),
                'redirect'      => route('auth.social.callback', $provider),
            ],
        ]);

        return true;
    }

    /**
     * Obtain the user information from {provider}.
     * @param string $provider
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function handleProviderCallback($provider, BaseHttpResponse $response)
    {
        $this->setProvider($provider);

        try {
            /**
             * @var \Laravel\Socialite\AbstractUser $oAuth
             */
            $oAuth = Socialite::driver($provider)->user();
        } catch (Exception $ex) {
            return $response
                ->setError()
                ->setNextUrl(route('customer.login'))
                ->setMessage($ex->getMessage());
        }

        if (!$oAuth->getEmail()) {
            return $response
                ->setError()
                ->setNextUrl(route('customer.login'))
                ->setMessage(__('Cannot login, no email provided!'));
        }

        $account = app(CustomerInterface::class)->getFirstBy(['email' => $oAuth->getEmail()]);

        if (!$account) {
            $avatarId = null;
            try {
                $url = $oAuth->getAvatar();
                if ($url) {
                    $result = RvMedia::uploadFromUrl($url, 0, 'accounts', 'image/png');
                    if (!$result['error']) {
                        $avatarId = $result['data']->id;
                    }
                }
            } catch (Exception $exception) {
                info($exception->getMessage());
            }

            // $account = app(CustomerInterface::class)->createOrUpdate([
            //     'name'         => $oAuth->getName() ?: $oAuth->getEmail(),
            //     'email'        => $oAuth->getEmail(),
            //     'password'     => bcrypt(Str::random(36)),
            //     'avatar_id'    => $avatarId,
            // ]);

            // $account->confirmed_at = now();
            // $account->save();
        }

        $social_data = array('name' =>$oAuth->getName() ?: $oAuth->getEmail(),
                                 'email'=>$oAuth->getEmail()); 
        // Auth::guard('customer')->login($account, true);

        return redirect(route('customer.register'))->with(['data'=> $social_data]);
        // return $response
        //     ->setNextUrl(route('customer.register'))
            // ->setMessage(trans('core/acl::auth.login.success'));
    }

    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function getSettings()
    {
        page_title()->setTitle(trans('plugins/social-login::social-login.settings.title'));

        Assets::addScriptsDirectly('vendor/core/plugins/social-login/js/social-login.js');

        return view('plugins/social-login::settings');
    }

    /**
     * @param SocialLoginRequest $request
     * @param BaseHttpResponse $response
     * @param SettingStore $setting
     * @return BaseHttpResponse
     */
    public function postSettings(SocialLoginRequest $request, BaseHttpResponse $response, SettingStore $setting)
    {
        foreach ($request->except(['_token']) as $settingKey => $settingValue) {
            $setting->set($settingKey, $settingValue);
        }

        $setting->save();

        return $response
            ->setPreviousUrl(route('social-login.settings'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    //instagram auth function
    public function redirectToInstagramProvider()
    {
        $appId = config('services.instagram.client_id');
        $redirectUri = urlencode(config('services.instagram.redirect'));
        return redirect()->to("https://api.instagram.com/oauth/authorize?app_id={$appId}&redirect_uri={$redirectUri}&scope=public_profile,user_profile&response_type=code");
    }

    public function instagramProviderCallback(Request $request)
    {
        // die("here");
        $code = $request->code;
        if (empty($code)) return redirect()->route('customer.register')->with('error', 'Failed to login with Instagram.');

        $appId = config('services.instagram.client_id');
        $secret = config('services.instagram.client_secret');
        $redirectUri = config('services.instagram.redirect');

        $client = new Client();

        // Get access token
        $response = $client->request('POST', 'https://api.instagram.com/oauth/access_token', [
            'form_params' => [
                'app_id' => $appId,
                'app_secret' => $secret,
                'grant_type' => 'authorization_code',
                'redirect_uri' => $redirectUri,
                'code' => $code,
            ]
        ]);

        // echo "<pre>"; print_r($response->getBody()->getContents()); die;
        if ($response->getStatusCode() != 200) {
            return redirect()->route('customer.register')->with('error', 'Unauthorized login to Instagram.');
        }

        $content = $response->getBody()->getContents();
        $content = json_decode($content);

        $accessToken = $content->access_token;
        $userId = $content->user_id;

        // Get user info
        $response = $client->request('GET', "https://graph.instagram.com/v12.0/me?fields=id,name,username,email&access_token={$accessToken}");

        $content = $response->getBody()->getContents();
        $oAuth = json_decode($content);
        // echo "<pre>"; print_r($content);die;

        // Get instagram user name 
        $username = $oAuth->username;

        $social_data = array('name' =>$username); 
        
        return redirect(route('customer.register'))->with(['data'=> $social_data]);

        // do your code here

    }
}
