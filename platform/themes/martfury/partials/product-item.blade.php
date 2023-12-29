@if ($product)
    <div class="ps-product__thumbnail">
        <a href="{{ $product->url }}">
            <img src="{{ RvMedia::getImageUrl($product->image, 'small', false, RvMedia::getDefaultImage()) }}" alt="{{ $product->name }}">
        </a>
         @if ($product->isOutOfStock())
            <span class="ps-product__badge out-stock">{{ __('Out Of Stock') }}</span>
        @else
            @if ($product->productLabels->count())
                @foreach ($product->productLabels as $label)
                    <span class="ps-product__badge" @if ($label->color) style="background-color: {{ $label->color }}" @endif>{{ $label->name }}</span>
                @endforeach
            @else
                @if ($product->front_sale_price !== $product->price)
                    <div class="ps-product__badge">{{ get_sale_percentage($product->price, $product->front_sale_price) }}</div>
                @endif
            @endif
        @endif
        <ul class="ps-product__actions">
            @if (EcommerceHelper::isCartEnabled())
                <!-- here below cart li -->
            @endif
           
            <li><a class="js-add-to-wishlist-button" href="#" data-url="{{ route('public.wishlist.add', $product->id) }}" title="{{ __('Add to Wishlist') }}"><i class="icon-heart"></i></a></li>
            
        </ul>
    </div>
    <div class="ps-product__container">
        @if (is_plugin_active('marketplace') && @$product->store->id)
            <a class="ps-product__vendor" href="{{ @$product->store->url }}">{{ $product->store->name }}</a>
        @endif
        <div class="ps-product__content">
            <a class="ps-product__title" href="{{ $product->url }}">{{ $product->name }}</a>
            @if (EcommerceHelper::isReviewEnabled())
                <div class="rating_wrap">
                    <div class="rating">
                        <div class="product_rate" style="width: {{ $product->reviews_avg * 20 }}%"></div>
                    </div>
                    <span class="rating_num">({{ $product->reviews_count }})</span>
                </div>
            @endif
            <div class="price_cart">
                <p class="ps-product__price @if ($product->front_sale_price !== $product->price) sale @endif">{{ format_price($product->front_sale_price_with_taxes) }} @if ($product->front_sale_price !== $product->price) <span>/ Piece</span> @endif</p>
                <ul class="ps-product__actions">
                    @if (EcommerceHelper::isCartEnabled())
                        <li><a class="add-to-cart-button" data-id="{{ $product->id }}" href="#" data-url="{{ route('public.cart.add-to-cart') }}" title="{{ __('Add To Cart') }}"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a></li>
                    @endif                 
                </ul>
            </div>
        </div>
    </div>
@endif
