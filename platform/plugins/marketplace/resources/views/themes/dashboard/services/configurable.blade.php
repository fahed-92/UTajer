<div id="product-variations-wrapper">
    <div class="variation-actions">
        <a href="#" class="btn-trigger-select-product-attributes" data-target="{{ route('marketplace.vendor.services.edit', $service->id) }}">{{ trans('plugins/ecommerce::products.edit_attribute') }}</a>
    </div>
    @if (!$service)
        <table class="table table-hover-variants">
            <thead>
            <tr>
                <th>{{ trans('plugins/ecommerce::products.form.image') }}</th>
                @foreach ($serviceAttributeSets->where('is_selected', '<>', null)->whereIn('id', $serviceVariationsInfo->pluck('attribute_set_id')->all())->sortBy('id') as $attributeSet)
                    <th>{{ $attributeSet->title }}</th>
                @endforeach
                @foreach ($serviceAttributeSets->where('is_selected', '<>', null)->whereNotIn('id', $serviceVariationsInfo->pluck('attribute_set_id')->all())->sortBy('id') as $attributeSet)
                    <th>{{ $attributeSet->title }}</th>
                @endforeach
                <th>{{ trans('plugins/ecommerce::products.form.price') }}</th>
                <th>{{ trans('plugins/ecommerce::products.form.is_default') }}</th>
                <th class="text-center">{{ trans('plugins/ecommerce::products.form.action') }}</th>
            </tr>
            </thead>
            <tbody>
            @foreach($serviceVariations as $variation)

                <tr id="variation-id-{{ $variation->id }}">
                    <td>
                        <div class="wrap-img-product">
                            <img src="{{ RvMedia::getImageUrl($variation && $variation->image ? $variation->image : $service->image, 'thumb', false, RvMedia::getDefaultImage()) }}" alt="{{ trans('plugins/ecommerce::products.form.image')  }}">
                        </div>
                    </td>
                    @foreach ($serviceVariationsInfo->where('id', $variation->id)->sortBy('attribute_set_id') as $key => $item)
                        <td>{{ $item->title }}</td>
                    @endforeach
                    @for($index = 0; $index < ($serviceAttributeSets->where('is_selected', '<>', null)->count() - $serviceVariationsInfo->where('variation_id', $variation->id)->count()); $index++)
                        <td>--</td>
                    @endfor
                    <td>
                        @if ($variation)
                            {{ format_price($variation->front_sale_price) }}
                            @if ($variation->front_sale_price != $variation->price)
                                <del class="text-danger">{{ format_price($variation->price) }}</del>
                            @endif
                        @else
                            {{ format_price($service->front_sale_price) }}
                            @if ($service->front_sale_price != $service->price)
                                <del class="text-danger">{{ format_price($service->price) }}</del>
                            @endif
                        @endif
                    </td>
                    <td>
                        <label>
                            <input type="radio" class="hrv-radio"
                                   {{ $variation->is_default ? 'checked' : '' }}
                                   name="variation_default_id"
                                   value="{{ $variation->id }}">
                        </label>
                    </td>
                    <td style="width: 180px;" class="text-center">
                        <a href="#" class="btn btn-info btn-trigger-edit-product-version"
                           data-target="{{ route('marketplace.vendor.products.update-version', [$variation->id]) }}"
                           data-load-form="{{ route('marketplace.vendor.products.get-version-form', [$variation->id]) }}"
                        >{{ trans('plugins/ecommerce::products.edit_variation_item') }}</a>
                        <a href="#" data-target="{{ route('marketplace.vendor.products.delete-version', [$variation->id]) }}" data-id="{{ $variation->id }}"
                           class="btn-trigger-delete-version btn btn-danger">{{ trans('plugins/ecommerce::products.delete') }}</a>
                    </td>
                </tr>
            @endforeach
            </tbody>
        </table>
    @else
        <p>{{ trans('plugins/ecommerce::products.variations_box_description') }}</p>
    @endif

    <br>
{{--    <a href="#" class="btn-trigger-add-new-product-variation"--}}
{{--       data-target="{{ route('marketplace.vendor.products.add-version', $service->id) }}"--}}
{{--       data-load-form="{{ route('marketplace.vendor.products.get-version-form', ['id' => 0, 'service_id' => $service->id]) }}"--}}
{{--       data-processing="{{ trans('plugins/ecommerce::products.processing') }}"--}}
{{--    >{{ trans('plugins/ecommerce::products.add_new_variation') }}</a>--}}
 </div>

<style>
    .page-content .table-wrapper .table-responsive .dataTables_processing{
        display: none !important;
    }
</style>