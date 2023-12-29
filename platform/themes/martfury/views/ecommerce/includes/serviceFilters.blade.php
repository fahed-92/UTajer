@php
    $categories = \Botble\Ecommerce\Models\Categories::where('status','published')->get();
    $rand = mt_rand();
    $categoriesRequest = request()->input('categories', []);
    $urlCurrent = URL::current();
@endphp
<aside class="widget widget_shop">
    <h4 class="widget-title">{{ __('Service Categories') }}</h4>
    <ul class="ps-list--categories">
        @foreach($categories as $category)
            <li class="current-menu-item">
                <a href="{{url('services?category_id='. $category->id) }}">{{ $category->name }}</a>
            </li>
        @endforeach
    </ul>
</aside>


<aside class="widget widget_shop">
    <h4 class="widget-title">{{ __('By Price') }}</h4>
    <div class="widget__content nonlinear-wrapper">
        <div class="nonlinear" data-min="0" data-max="{{ theme_option('max_service_filter_price', 10000) }}"></div>
        <div class="ps-slider__meta">
            <div data-current-exchange-rate="{{ get_current_exchange_rate() }}"></div>
            <input class="product-filter-item product-filter-item-price-0" name="min_price" data-min="0" value="{{ request()->input('min_price', 0) }}" type="hidden">
            <input class="product-filter-item product-filter-item-price-1" name="max_price" data-max="{{ theme_option('max_service_filter_price', 10000) }}" value="{{ request()->input('max_price', theme_option('max_service_filter_price', 10000)) }}" type="hidden">
            <span class="ps-slider__value">
                <span class="ps-slider__min"></span> {{ get_application_currency()->title }}</span> -
            <span class="ps-slider__value"><span class="ps-slider__max"></span> {{ get_application_currency()->title }}
            </span>
        </div>
    </div>
</aside>

<input type="hidden" name="sort-by" class="product-filter-item" value="{{ request()->input('sort-by') }}">
<input type="hidden" name="layout" class="product-filter-item" value="{{ request()->input('layout') }}">
