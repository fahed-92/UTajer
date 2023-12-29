@extends(Theme::getThemeNamespace() . '::views.ecommerce.customers.master')
@section('content')
    @php Theme::set('pageName', __('Service information')) @endphp
    <div class="card">
        <div class="card-header">
            <h3>{{ __('Service information') }}</h3>
        </div>
        <div class="card-body">
            <div class="customer-order-detail">
                <div class="row">
                    <div class="col-md-6">
                        <div class="order-slogan">
                            <img width="100" src="{{ RvMedia::getImageUrl(theme_option('logo')) }}"
                                 alt="{{ theme_option('site_title') }}">
                            <br/>
                            {{ setting('contact_address') }}
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="order-meta">
                            <p><span>{{ __('Service number') }}:</span> <span
                                        class="order-detail-value">{{ get_order_code($service->id) }}</span></p>
                            <span>{{ __('Time') }}:</span> <span
                                    class="order-detail-value">{{ $service->created_at->translatedFormat('M d, Y h:m') }}</span>
                        </div>
                    </div>
                </div>

                <h6>{{ __('Order information') }}</h6>
                <div class="col-12">
                    <span>{{ __('Order status') }}:</span> <span
                            class="order-detail-value">{{ $service->status }}</span>
                </div>



                <div class="col-12">
                    <span>{{ __('Amount') }}:</span> <span
                            class="order-detail-value"> {{ format_price($service->amount) }} </span>
                </div>

                @if (EcommerceHelper::isTaxEnabled())
                    <div class="col-12">
                        <span>{{ __('Tax') }}:</span> <span
                                class="order-detail-value"> {{ format_price($service->tax_amount) }} </span>
                    </div>
                @endif



                <div class="col-12">
                    @if ($service->note)
                        <span>{{ __('Note') }}:</span> <span class="order-detail-value text-warning">{{ $service->note }} </span>&nbsp;
                    @endif
                </div>
                <br>
                <h6>{{ __('Customer information') }}</h6>

                <div class="col-12">
                    <span>{{ __('Full Name') }}:</span> <span class="order-detail-value">{{ $service->customer->name }} </span>
                </div>
                <div class="col-12">
                    <span>{{ __('Phone') }}:</span> <span class="order-detail-value">{{ $service->customer->phone }} </span>
                </div>


                <h6>{{ __('Service detail') }}</h6>
                <div class="col-12">
                    <div class="table-responsive">
                        <table class="table table-striped table-hover">
                            <thead>
                            <tr>
                                <th class="text-center">#</th>
                                <th class="text-center">{{ __('Image') }}</th>
                                <th>{{ __('Service') }}</th>
                                <th class="text-center">{{ __('Amount') }}</th>
                                  <th class="price text-right">{{ __('Total') }}</th>
                            </tr>
                            </thead>
                            <tbody>
                             </tbody>
                        </table>
                    </div>
                </div>

                <br>
                <div>
                    <a href="{{ route('customer.print-order', $service->id) }}" class="ps-btn ps-btn--sm">{{ __('Print order') }}</a>
                    @if ($service->canBeCanceled())
                        <a href="{{ route('customer.orders.cancel', $service->id) }}" class="ps-btn ps-btn--sm">{{ __('Cancel order') }}</a>
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection
