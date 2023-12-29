@php
    $menus = [
        [
            'key'   => 'marketplace.vendor.dashboard',
            'icon'  => 'icon-home',
            'name'  => __('Dashboard')
        ],
        [
            'key'   => 'marketplace.vendor.products.index',
            'icon'  => 'icon-store',
            'name'  => __('Products')
        ],
        [
            'key'   => 'marketplace.vendor.services.index',
            'icon'  => 'icon-rocket',
            'name'  => __('Services')
        ],
        [
            'key'   => 'marketplace.vendor.booked-services.index',
            'icon'  => 'icon-hourglass',
            'name'  => __('Booked Services')
        ],
        [
            'key'   => 'marketplace.vendor.orders.index',
            'icon'  => 'icon-bag2',
            'name'  => __('Orders')
        ],
        [
            'key'   => 'marketplace.vendor.withdrawals.index',
            'icon'  => 'icon-linearicons',
            'name'  => __('Withdrawals')
        ],
        [
            'key'   => 'marketplace.vendor.revenues.index',
            'icon'  => 'icon-bag-dollar',
            'name'  => __('Revenue History')
        ],
        [
            'key'   => 'marketplace.vendor.settings',
            'icon'  => 'icon-cog',
            'name'  => __('Settings')
        ],
    ]
@endphp

<ul class="menu" style="
    flex-direction: column;
    align-items: flex-start;
    width: 100%;">
    @foreach ($menus as $item)
        <li style="width: 100%; text-align: left">
            <a  style="width: 100%; padding-left: 0px" @if (Route::currentRouteName() == $item['key']) class="active" @endif href= "{{ route($item['key']) }}" >
                <i class="{{ $item['icon'] }}"></i>{{ $item['name'] }}
            </a>
        </li>
    @endforeach
    <!-- <li><a href="{{ route('customer.overview') }}"><i class="icon-user"></i>{{ __('Customer dashboard') }}</a></li> -->
</ul>
