@php
    Theme::set('stickyHeader', 'false');
    Theme::set('pageId', 'service-page');
@endphp
<div class="ps-page--shop">
    <div class="ps-container">
        <div class="ps-layout--shop">
            <div class="ps-layout__left">
                <div class="screen-darken"></div>
                <div class="ps-layout__left-container">
                    <div class="ps-filter__header d-block d-xl-none">
                        <h3>{{ __('Filter Services') }}</h3><a class="ps-btn--close ps-btn--no-boder" href="#"></a>
                    </div>
                    <div class="ps-layout__left-content">
                        <form action="{{ URL::current() }}" data-action="{{ route('public.services') }}" method="GET" id="products-filter-form">
                            @include(Theme::getThemeNamespace() . '::views/ecommerce/includes/serviceFilters')
                        </form>
                    </div>
                </div>
            </div>
            <div class="ps-layout__right">
                <div class="ps-shopping ps-tab-root">
                    <div class="row bg-light py-2 mb-3">
                        <div class="col-lg-6 col-md-6 col-sm-12 d-none d-md-block">
                            <div class="products-found pt-2">
                                <strong>{{ __('All Services') }}</strong>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        @if ($services->count() > 0)
                            @foreach($services as $service)
                                <div class="col-lg-3 col-md-4 col-sm-6">
                                    <div class="ps-product">
                                        <div class="ps-product__thumbnail">
                                            <div class="product-item product-loop">
                                                <a href="{{url('service-details/'.$service->id)}}">
                                                    @if($service->image)
                                                        @php
                                                            $img = json_decode($service->image,true);
                                                        @endphp
                                                        <img src="{{ asset('storage/'. $img['imgPath']) }}"
                                                             alt="{{ $service->name }}" class="product-item-thumb" style="height: 150px; object-fit: cover">
                                                    @else
                                                        <img src="{{ asset('storage/general/newsletter-790x510.jpg') }}"
                                                             alt="{{ $service->name }}" class="product-item-thumb" style="height: 150px">
                                                    @endif
                                                </a>

                                                <h3>{{ $service->name }}</h3>
                                                <span class="price">{{ format_price($service->price) }}</span>
                                                <div class="product-action">
                                                    <a data-quantity='1' data-product='{{ $service->id }}' href="{{url('service-details/'.$service->id)}}"
                                                       class="btn btn-info">{{ __('View Service Detail') }}</a>
                                                </div>
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