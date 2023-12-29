
<div class="ps-page--shop">
    <div class="ps-container" @if (Route::currentRouteName() == 'services') id="app" @endif>
        <div class="ps-layout--shop">
            <div class="ps-layout__left">
                <div class="screen-darken"></div>
                <div class="ps-layout__left-container">
                    <div class="ps-filter__header d-block d-xl-none">
                        <h3>{{ __('Filter Services') }}</h3><a class="ps-btn--close ps-btn--no-boder" href="#"></a>
                    </div>
                    <div class="ps-layout__left-content">
                        <form action="{{ URL::current() }}" data-action="{{ route('services') }}" method="GET" id="products-filter-form">
                            @include(Theme::getThemeNamespace() . '::views/ecommerce/services/includes/filters')
                        </form>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="row product-list-item">
                        @if ($services->count() > 0)
                            @foreach($services as $service)
                                <div class="col-xl-2 col-lg-4 col-md-4 col-sm-6 col-6">
                                    <div class="ps-product">
                                        <div class="ps-product__thumbnail">
                                            <div class="product-item product-loop">
                                                @if($service->image)
                                                    @php
                                                        $img = json_decode($service->image,true);
                                                    @endphp
                                                    <a href="{{url('service-detail/'.$service->id)}}">
                                                        <img src="{{ asset($img['imgPath']) }}"
                                                             alt="{{ $service->name }}" class="product-item-thumb">
                                                    </a>
                                                @endif
                                                <h3>{{ $service->name }}</h3>
                                                <span class="price">{{ format_price($service->price) }}</span>
                                                <div class="product-action">
                                                    <a data-quantity='1' data-product='{{ $service->id }}' href="javascript: void(0);"
                                                       class="btn btn-info">{{ __('Book Service') }}</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    @endforeach
                                    @endif

                                </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>