<header class="header header--product" data-sticky="true">
    <nav class="navigation">
        <div class="container">
            @foreach($services as $service)
                <article class="ps-product--header-sticky">
                    <div class="ps-product__thumbnail">
                        @if($service->image)
                            @php
                                $img = json_decode($service->image,true);
                            @endphp
                            <img src="{{ asset('storage/'. $img['imgPath']) }}"
                                 alt="{{ $service->name }}" class="product-item-thumb" style="height: 150px">
                        @else
                            <img src="{{ asset('storage/general/newsletter-790x510.jpg') }}"
                                 alt="{{ $service->name }}" class="product-item-thumb" style="height: 150px">
                        @endif
                    </div>
                    <div class="ps-product__wrapper">
                        <div class="ps-product__content"><a class="ps-product__title" href="{{url('service-details/'.$service->id)}}">{{ $service->name }}</a>
                            <ul class="ps-tab-list">
                                <li class="active"><a href="#tab-description">{{ __('Description') }}</a></li>

                            </ul>
                        </div>
                        <div class="ps-product__shopping">
                        <span class="ps-product__price">
                            <span>{{ format_price($service->price) }}</span>
                            @if ($service->price_type == 1)
                                / Per Day
                            @else
                                / Per Hour
                            @endif
                        </span>
                            @if (EcommerceHelper::isCartEnabled())
                                <form class="add-to-cart-form" method="POST" action="{{ route('public.cart.add-to-cart') }}">
                                    @csrf
                                    <input type="hidden" name="id" class="hidden-product-id" value="{{ ($service->id || !$service->id) ? $service->id : $service->id }}"/>
                                    <input type="hidden" name="qty" value="1">
                                    <button class="ps-btn" type="submit">{{ __('Add to cart') }}</button>
                                </form>
                            @endif
                        </div>
                    </div>
                </article>
            @endforeach
        </div>
    </nav>
</header>
