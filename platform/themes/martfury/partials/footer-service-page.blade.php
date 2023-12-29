@if (EcommerceHelper::isCartEnabled())
    <form class="add-to-cart-form" method="POST" action="{{ route('public.cart.add-to-cart') }}">
        <nav class="navigation--mobile-product">
            @csrf
            <input type="hidden" name="id" class="hidden-product-id" value="{{ ($services->is_variation || !$services->defaultVariation->product_id) ? $services->id : $services->defaultVariation->product_id }}"/>
            <input type="hidden" name="qty" value="1">
            <button class="ps-btn ps-btn--black @if ($services->isOutOfStock()) btn-disabled @endif" type="submit">{{ __('Add to cart') }}</button>
            @if (EcommerceHelper::isQuickBuyButtonEnabled())
                <button class="ps-btn @if ($services->isOutOfStock()) btn-disabled @endif" type="submit" name="checkout">{{ __('Buy Now') }}</button>
            @endif
        </nav>
    </form>
@endif
