@php
    Theme::set('stickyHeader', 'false');
    Theme::set('pageId', 'Service-page');
@endphp

<div class="ps-page--product">
    <div class="ps-container">
        <div class="ps-page__container">
            <div class=" ">
                <div class="ps-product--detail ps-product--fullwidth">
                    <div class="ps-product__header">
                        <div class="item">
                            @if($service->image)
                                @php
                                    $img = json_decode($service->image,true);
                                @endphp
                                <img src="{{ asset('storage/'. $img['imgPath']) }}"
                                     alt="{{ $service->name }}" class=" ">
                            @else
                                <img src="{{ asset('storage/general/newsletter-150x150.jpg') }}"
                                     alt="{{ $service->name }}" class="w-100">
                            @endif
                        </div>

                        <div class="ps-product__info">
                            <h1>{{ $service->name }}</h1>
                            <h4 class="ps-product__price @if ($service->price > 0) sale @endif">
                                <span>{{ format_price($service->price) }}</span> @if ($service->price_type == 1)/ Per day @elseif($service->price_type == 2) / Per Hour @endif</h4>
                            <div class="ps-product__desc">
                                <div class="ps-list--dot">
                                    <h4>
                                        @if ($service->service_type == 1) Individual @elseif($service->service_type == 2) Business @endif
                                    </h4>
                                </div>
                            </div>
                            <form class="add-to-cart-form" method="POST" action="{{ url('service-book') }}">
                                @csrf
                                {!! apply_filters(ECOMMERCE_PRODUCT_DETAIL_EXTRA_HTML, null) !!}
                                <div class="">
                                    <div class="row">
                                        <div class="@if ($service->price_type == 2) col-4 @else col-12 @endif">
                                            <div class="form-group">
                                                @php
                                                    $minDate = date('Y-m-d');
                                                    $maxDate = date('Y-m-d', strtotime('+60 days'));
                                                @endphp
                                                <input class="form-control" min="{{$minDate}}" max="{{$maxDate}}" required type="date" name="date">
                                            </div>
                                            <input class="form-control" value="{{$service->price_type}}" type="hidden" name="price_type">
                                        </div>
                                        @if ($service->price_type == 2)
                                            <div class="col-4">
                                                <div class="form-group">
                                                    <input class="form-control" required type="time" name="start_time">
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="form-group">
                                                    <input class="form-control" required type="time" name="end_time">
                                                </div>
                                            </div>
                                        @endif
                                        <input type="hidden" name="service_id" class="hidden-product-id" value="{{$service->id}}"/>
                                    </div>
                                </div>
                                <div class="">

                                    <div class="row">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <textarea class="form-control" rows="5" placeholder="Any Additional Information Write Down Here" ></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <button class="ps-btn ps-btn--black " type="submit">{{ __('Book Service') }}</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>
                    <div class="ps-product__content ps-tab-root">
                        <ul class="ps-tab-list">
                            <li class="active"><a href="#tab-description">{{ __('Description') }}</a></li>
                            <div class="ps-tabs">
                                <div class="ps-tab active" id="tab-description">
                                    <div class="ps-document">
                                        <div class="m-4">
                                            {!! clean($service->description) !!}
                                        </div>
                                        @if (theme_option('facebook_comment_enabled_in_product', 'yes') == 'yes')
                                            <br />
                                            {!! apply_filters(BASE_FILTER_PUBLIC_COMMENT_AREA, Theme::partial('comments')) !!}
                                        @endif
                                    </div>
                                </div>
                                @if (EcommerceHelper::isReviewEnabled())
                                    <div class="ps-tab" id="tab-reviews">
                                        <div class="row">
                                            <div class="col-lg-5">
                                                <div class="ps-block--average-rating">
                                                    <div class="ps-block__header">
                                                        <h3>{{ number_format($service->reviews_avg, 2) }}</h3>
                                                        @if ($service->reviews_count > 0)
                                                            <div class="rating_wrap">
                                                                <div class="rating">
                                                                    <div class="product_rate" style="width: {{ $service->reviews_avg * 20 }}%"></div>
                                                                </div>
                                                                <span class="rating_num">({{ $service->reviews_count }} {{ __('reviews') }})</span>
                                                            </div>
                                                        @endif
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                @endif


                            </div>
                        </ul>
                    </div>
                </div>
            </div>

        </div>



        <div class="ps-section--default" id="services">
            <div class="ps-section__header">
                <h3>{{ __('Relevant Services') }}</h3>
            </div>
            <related-products-component url="{{ route('public.ajax.related-products', $service->user_id) }}?limit=6"></related-products-component>
        </div>
    </div>
</div>
