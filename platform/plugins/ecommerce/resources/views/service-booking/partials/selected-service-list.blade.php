<div class="list-selected-products @if (!$services->count()) hidden @endif">
    <div class="mt20"><label class="text-title-field">{{ trans('plugins/ecommerce::products.selected_services') }}:</label></div>
    <div class="table-wrapper p-none mt10 mb20 ps-relative">
        <table class="table-normal">
            <tbody>
            @foreach($services as $relatedService)
                <tr>
                    <td class="width-60-px min-width-60-px">
                        <div class="wrap-img vertical-align-m-i">
                            <img class="thumb-image" src="{{ RvMedia::getImageUrl($relatedService->image, 'thumb', false, RvMedia::getDefaultImage()) }}" alt="{{ $relatedService->name }}"></div>
                    </td>
                    <td class="pl5 p-r5 min-width-200-px">
                        <a class="hover-underline pre-line" href="{{ route('services.edit', $relatedService->id) }}">{{ $relatedService->name }}</a>
                        @if ($includeVariation)
                            <p class="type-subdued">
                                @if ($relatedService->variationInfo->id)
                                    @foreach($relatedService->variationInfo->variationItems as $variationItem)
                                        {{ $variationItem->attribute->title }}
                                        @if (!$loop->last)
                                            /
                                        @endif
                                    @endforeach
                                @endif
                            </p>
                        @endif
                    </td>
                    <td class="pl5 p-r5 text-right width-20-px min-width-20-px">
                        <a href="#" class="btn-trigger-remove-selected-product" title="{{ trans('plugins/ecommerce::products.delete') }}" data-id="{{ $relatedService->id }}">
                            <i class="fa fa-times"></i>
                        </a>
                    </td>
                </tr>
            @endforeach
            </tbody>
        </table>
    </div>
</div>
