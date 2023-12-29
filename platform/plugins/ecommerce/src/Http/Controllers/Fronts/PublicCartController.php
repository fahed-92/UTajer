<?php

namespace Botble\Ecommerce\Http\Controllers\Fronts;

use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Ecommerce\Http\Requests\CartRequest;
use Botble\Ecommerce\Http\Requests\UpdateCartRequest;
use Botble\Ecommerce\Repositories\Interfaces\ProductInterface;
use Botble\Ecommerce\Repositories\Interfaces\WishlistInterface;
use Botble\Ecommerce\Services\HandleApplyPromotionsService;
use Cart;
use EcommerceHelper;
use Exception;
use Illuminate\Support\Facades\Session;
use ServiceBooking;
use Illuminate\Http\RedirectResponse;
use Illuminate\Routing\Controller;
use Illuminate\Support\Arr;
use OrderHelper;
use Response;
use SeoHelper;
use Theme;

class PublicCartController extends Controller
{
    /**
     * @var ProductInterface
     */
    protected $productRepository;

    /**
     * @var WishlistInterface
     */
    protected $wishListRepository;

    /**
     * PublicCartController constructor.
     * @param ProductInterface $productRepository
     */
    public function __construct(WishlistInterface $wishListRepository,ProductInterface $productRepository)
    {
        $this->productRepository = $productRepository;
        $this->wishListRepository = $wishListRepository;
    }


    /**
     * @param CartRequest $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function store(CartRequest $request, BaseHttpResponse $response)
    {
        if (!EcommerceHelper::isCartEnabled()) {
            return $response->setError(true);
        }

        $product = $this->productRepository->findById($request->id);

        if (!$product) {
            return $response
                ->setError()
                ->setMessage(__('This product is out of stock or not exists!'));
        }

        if ($product->variations->count() > 0 && !$product->is_variation) {
            $product = $product->defaultVariation->product;
        }

        if ($product->isOutOfStock()) {
            return $response
                ->setError()
                ->setMessage(__('Product :product is out of stock!', ['product' => $product->original_product->name]));
        }

        $maxQuantity = $product->quantity;
        $minQuantity = $product->min_quantity;

        if (!$product->canAddToCart($request->input('qty', 1))) {
            return $response
                ->setError()
                ->setMessage(__('Maximum quantity is ' . $maxQuantity . '!'));
        }
        if ($request->input('sample_order') == "sample") {
            if (!$product->canAddToCart($request->input('qty') > 1)) {
                return $response
                    ->setError()
                    ->setMessage(__('Maximum quantity is 1 !'));
            }
        }
        if (($request->input('qty') < $minQuantity) && ($request->input('sample_order') != "sample")){
            return $response
                ->setError()
                ->setMessage(__('Minimum '. $minQuantity.' quantity required for this order !'));
        }

        $product->quantity -= $request->input('qty', 1);

        $outOfQuantity = false;
        foreach (Cart::instance('cart')->content() as $item) {
            if ($item->id == $product->id) {
                $originalQuantity = $product->quantity;
                $product->quantity = (int)$product->quantity - $item->qty;
                if ($product->quantity < 0) {
                    $product->quantity = 0;
                }
                if ($product->isOutOfStock()) {
                    $outOfQuantity = true;
                    break;
                }
                $product->quantity = $originalQuantity;
            }
        }

        if ($outOfQuantity) {
            return $response
                ->setError()
                ->setMessage(__('Product :product is out of stock!', ['product' => $product->original_product->name]));
        }

        $cartItems = OrderHelper::handleAddCart($product, $request);

        $token = OrderHelper::getOrderSessionToken();

        $nextUrl = route('public.checkout.information', $token);

        if (EcommerceHelper::getQuickBuyButtonTarget() == 'cart') {
            $nextUrl = route('public.cart');
        }

        if ($request->has('checkout')) {
            if ($request->ajax() && $request->wantsJson()) {
                return $response->setData(['next_url' => route('public.checkout.information', $token)]);
            }
            return $response->setNextUrl($nextUrl);
        }
        if ($request->input('sample_order') == "sample") {
            if (Cart::instance('cart')->count() > 0) {
                $sampleOrderSession = [
                  'orderId' => $request->id,
                  'orderType' => "sample_order",
                ];
                session(['sampleOrderId' => $sampleOrderSession]);
            }
            if ($request->ajax() && $request->wantsJson()) {
                return $response->setData(['next_url' => route('public.checkout.information', $token)]);
            }
            return $response->setNextUrl($nextUrl);

            return $response->setData([
                'status'      => true,
                'next_url'    => $nextUrl,
            ])
                ->setMessage(__('Added product :product to cart successfully!',
                    ['product' => $product->original_product->name]));
        }

        $this->wishListRepository->deleteBy([
            'product_id'  => $request->id,
            'customer_id' => auth('customer')->id(),
        ]);

        return $response
            ->setData([
                'status'      => true,
                'count'       => Cart::instance('cart')->count(),
                'total_price' => format_price(Cart::instance('cart')->rawSubTotal()),
                'content'     => $cartItems,
                'next_url'    => $nextUrl,
            ])
            ->setMessage(__('Added product :product to cart successfully!',
                ['product' => $product->original_product->name]));
    }

    /**
     * @param HandleApplyPromotionsService $applyPromotionsService
     * @return Response
     */
    public function getView(HandleApplyPromotionsService $applyPromotionsService)
    {
        if (!EcommerceHelper::isCartEnabled()) {
            abort(404);
        }

        Theme::asset()
            ->container('footer')
            ->add('ecommerce-checkout-js', 'vendor/core/plugins/ecommerce/js/checkout.js', ['jquery']);

        $promotionDiscountAmount = 0;
        $couponDiscountAmount = 0;

        $products = [];
        $services = [];
        $crossSellProducts = collect([]);

        if (Cart::instance('cart')->count() > 0) {
            $products = Cart::instance('cart')->products();

            $promotionDiscountAmount = $applyPromotionsService->execute();

            $sessionData = OrderHelper::getOrderSessionData();

            if (session()->has('applied_coupon_code')) {
                $couponDiscountAmount = Arr::get($sessionData, 'coupon_discount_amount', 0);
            }

            $parentIds = $products->pluck('original_product.id')->toArray();

            $crossSellProducts = get_cart_cross_sale_products($parentIds, theme_option('number_of_cross_sale_product', 4));
        }
        if (ServiceBooking::instance('service_booking')->count() > 0){
            $services =ServiceBooking::instance('service_booking')->services();
        }

        SeoHelper::setTitle(__('Shopping Cart'));

        Theme::breadcrumb()->add(__('Home'), route('public.index'))->add(__('Shopping Cart'), route('public.cart'));

        return Theme::scope(
            'ecommerce.cart',
            compact('promotionDiscountAmount', 'couponDiscountAmount', 'products', 'crossSellProducts','services'),
            'plugins/ecommerce::themes.cart'
        )->render();
    }

    /**
     * @param UpdateCartRequest $request
     * @param BaseHttpResponse $response
     * @return array|BaseHttpResponse|RedirectResponse
     */
    public function postUpdate(UpdateCartRequest $request, BaseHttpResponse $response)
    {
        if (!EcommerceHelper::isCartEnabled()) {
            return $response->setError(true);
        }

        if ($request->has('checkout')) {
            $token = OrderHelper::getOrderSessionToken();
            return $response->setNextUrl(route('public.checkout.information', $token));
        }
        $data = $request->input('items', []);
        $outOfQuantity = false;
        foreach ($data as $item) {
            $cartItem = Cart::instance('cart')->get($item['rowId']);
            $product = null;

            if ($cartItem) {
                $product = $this->productRepository->findById($cartItem->id);
            }

            if ($product) {
                $originalQuantity = $product->quantity;
                $product->quantity = (int)$product->quantity - Arr::get($item, 'values.qty', 0) + 1;

                if ($product->quantity < 0) {
                    $product->quantity = 0;
                }

                if ($product->isOutOfStock()) {
                    $outOfQuantity = true;
                } else {
                    Cart::instance('cart')->update($item['rowId'], Arr::get($item, 'values'));
                }

                $product->quantity = $originalQuantity;
            }
        }

        if ($outOfQuantity) {
            return $response
                ->setError()
                ->setData([
                    'count'       => Cart::instance('cart')->count(),
                    'total_price' => format_price(Cart::instance('cart')->rawSubTotal()),
                    'content'     => Cart::instance('cart')->content(),
                ])
                ->setMessage(__('One or all products are not enough quantity so cannot update!'));
        }

        return $response
            ->setData([
                'count'       => Cart::instance('cart')->count(),
                'total_price' => format_price(Cart::instance('cart')->rawSubTotal()),
                'content'     => Cart::instance('cart')->content(),
            ])
            ->setMessage(__('Update cart successfully!'));
    }

    /**
     * @param string $id
     * @param BaseHttpResponse $response
     * @return array|BaseHttpResponse|RedirectResponse
     */
    public function getRemove($id, BaseHttpResponse $response)
    {
        if (!EcommerceHelper::isCartEnabled()) {
            abort(404);
        }

        try {
            Session::forget('sampleOrderId');
            Cart::instance('cart')->remove($id);
        } catch (Exception $exception) {
            return $response->setError()->setMessage(__('Cart item is not existed!'));
        }

        return $response
            ->setData([
                'count'       => Cart::instance('cart')->count(),
                'total_price' => format_price(Cart::instance('cart')->rawSubTotal()),
                'content'     => Cart::instance('cart')->content(),
            ])
            ->setMessage(__('Removed item from cart successfully!'));
    }
    /**
     * @param string $id
     * @param BaseHttpResponse $response
     * @return array|BaseHttpResponse|RedirectResponse
     */
    public function getServiceRemove($id, BaseHttpResponse $response)
    {
        if (!EcommerceHelper::isCartEnabled()) {
            abort(404);
        }

        try {
//            $serviceModel = \Botble\Ecommerce\Models\ServiceBooking::find($id);
//            dd($serviceModel , $id);
//            $serviceModel->status = \Botble\Ecommerce\Models\ServiceBooking::DELETED_STATUS;
//            $serviceModel->update();
            ServiceBooking::instance('service_booking')->remove($id);
        } catch (Exception $exception) {
            return $response->setError()->setMessage(__('Services is not existed in cart!'));
        }

        return $response
            ->setData([
                'count'       => ServiceBooking::instance('service_booking')->count(),
                'total_price' => format_price(ServiceBooking::instance('service_booking')->rawSubTotal()),
                'content'     => ServiceBooking::instance('service_booking')->content(),
            ])
            ->setMessage(__('Removed item from cart successfully!'));
    }

    /**
     * @param BaseHttpResponse $response
     * @return array|BaseHttpResponse|RedirectResponse
     */
    public function getDestroy(BaseHttpResponse $response)
    {
        if (!EcommerceHelper::isCartEnabled()) {
            abort(404);
        }

        Cart::instance('cart')->destroy();

        return $response
            ->setData(Cart::instance('cart')->content())
            ->setMessage(__('Empty cart successfully!'));
    }
}
