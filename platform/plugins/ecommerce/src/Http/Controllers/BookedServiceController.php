<?php

namespace Botble\Ecommerce\Http\Controllers;

use App\Models\City;
use App\Models\Country;
use App\Models\State;
use App\Models\UserProfile;
use Assets;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Ecommerce\Models\Address;
use Botble\Ecommerce\Models\Customer;
use Botble\Ecommerce\Models\Order;
use Botble\Ecommerce\Models\Payout;
use Botble\Ecommerce\Models\Product;
use Botble\Ecommerce\Models\Service;
use Botble\Ecommerce\Models\ServiceBooking;
use Botble\Ecommerce\Models\Store;
use Botble\Ecommerce\Tables\ServiceTable;
use Botble\Ecommerce\Traits\ServiceActionsTrait;
use Botble\Marketplace\Enums\WithdrawalStatusEnum;
use Botble\Marketplace\Models\VendorInfo;
use Botble\Marketplace\Models\Withdrawal;
use Botble\Media\Models\MediaFile;
use RvMedia;
use Botble\Payment\Enums\PaymentStatusEnum;
use Botble\Payment\Models\Payment;
use Carbon\CarbonPeriod;
use Exception;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\View\View;
use Throwable;
use EcommerceHelper;
use OrderHelper;

use function GuzzleHttp\json_encode;

class  BookedServiceController extends BaseController
{

    public $message;
    public $data;
    public $status;

    use ServiceActionsTrait;

    /**
     * @return BaseHttpResponse|Factory|View|string
     * @throws Throwable
     */
    public function index(ServiceTable $dataTable)
    {
        Assets::addScripts(['bootstrap-editable'])
            ->addStyles(['bootstrap-editable']);

        return $dataTable->renderTable();
    }


}
