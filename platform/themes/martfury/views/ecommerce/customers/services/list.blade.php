@extends(Theme::getThemeNamespace() . '::views.ecommerce.customers.master')
@section('content')
    <div class="ps-section__header">
        <h3>{{ SeoHelper::getTitle() }}</h3>
    </div>
    <div class="ps-section__content">
        <div class="table-responsive">
            <table class="table ps-table--whishlist">
                <thead>
                <tr>
                    <th>{{ __('ID number') }}</th>
                    <th>{{ __('Date') }}</th>
                    <th>{{ __('Total') }}</th>
                    <th>{{ __('Status') }}</th>
                    <th>{{ __('Actions') }}</th>
                </tr>
                </thead>
                <tbody>
                @if (count($services) > 0)
                    @foreach ($services as $service)
                        <tr>
                            <td>{{ get_order_code($service->id) }}</td>
                            <td>{{ $service->date }}</td>
                            <td>{{ format_price($service->amount) }}</td>
                            <td>{{ $service->status}}</td>
                            <td>
                                <a class="ps-btn ps-btn--sm ps-btn--small" href="{{ route('customer.services.view', $service->id) }}">{{ __('View') }}</a>
                            </td>
                        </tr>
                    @endforeach
                @else
                    <tr>
                        <td colspan="5" class="text-center">{{ __('No Services!') }}</td>
                    </tr>
                @endif
                </tbody>
            </table>
        </div>

        <div class="ps-pagination">
            {!! $services->links() !!}
        </div>
    </div>
@endsection
