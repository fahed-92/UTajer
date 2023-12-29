<div id="product-variations-wrapper">

    @if (!$serviceVariations->isEmpty())
        <table class="table table-hover-variants">
            <thead>
            <tr>
                <th><input class="table-check-all" data-set=".table-hover-variants .checkboxes" type="checkbox"></th>
                <th>{{ trans('plugins/ecommerce::products.form.image') }}</th>
                @foreach ($serviceAttributeSets->where('is_selected', '<>', null)->whereIn('id', $serviceVariations->pluck('attribute_set_id')->all())->sortBy('id') as $attributeSet)
                    <th>{{ $attributeSet->title }}</th>
                @endforeach
                <th>{{ trans('plugins/ecommerce::products.form.price') }}</th>
                <th>{{ trans('plugins/ecommerce::products.form.is_default') }}</th>
                <th class="text-center">{{ trans('plugins/ecommerce::products.form.action') }}</th>
            </tr>
            </thead>
            <tbody>
            @foreach($serviceVariations as $variation)
                @php
                    $currentRelatedProduct = $serviceRelatedToVariation->where('variation_id', $variation->id)->first();
                @endphp
                <tr id="variation-id-{{ $variation->id }}">
                    <td style="width: 20px;"><input type="checkbox" class="checkboxes m-0" name="id[]" value="{{ $variation->id }}"></td>
                    <td>
                        <div class="wrap-img-product">
                            <img src="{{ RvMedia::getImageUrl($currentRelatedProduct && $currentRelatedProduct->image ? $currentRelatedProduct->image : $product->image, 'thumb', false, RvMedia::getDefaultImage()) }}" alt="{{ trans('plugins/ecommerce::products.form.image')  }}">
                        </div>
                    </td>
                    @foreach ($productVariationsInfo->where('variation_id', $variation->id)->sortBy('attribute_set_id') as $key => $item)
                        <td>{{ $item->title }}</td>
                    @endforeach
                    @for($index = 0; $index < ($productAttributeSets->where('is_selected', '<>', null)->count() - $productVariationsInfo->where('variation_id', $variation->id)->count()); $index++)
                        <td>--</td>
                    @endfor
                    <td>
                        {{ format_price($service->price) }}
                    </td>
                    <td>
                        <label>
                            <input type="radio" class="hrv-radio"
                                   {{ $variation->is_default ? 'checked' : '' }}
                                   name="variation_default_id"
                                   value="{{ $variation->id }}">
                        </label>
                    </td>
                    <td class="text-center">-</td>
                </tr>
            @endforeach
            </tbody>
        </table>
    @else
        <p>{{ trans('plugins/ecommerce::products.variations_box_description') }}</p>
    @endif

    <br>
</div>

{!! Form::modalAction('select-attribute-sets-modal', trans('plugins/ecommerce::products.select_attribute'), 'info', view('plugins/ecommerce::products.partials.attribute-sets', compact('productAttributeSets'))->render(), 'store-related-attributes-button', trans('plugins/ecommerce::products.save_changes')) !!}
{!! Form::modalAction('add-new-product-variation-modal', trans('plugins/ecommerce::products.add_new_variation'), 'info', view('core/base::elements.loading')->render(), 'store-product-variation-button', trans('plugins/ecommerce::products.save_changes'), 'modal-lg') !!}
{!! Form::modalAction('edit-product-variation-modal', trans('plugins/ecommerce::products.edit_variation'), 'info', view('core/base::elements.loading')->render(), 'update-product-variation-button', trans('plugins/ecommerce::products.save_changes'), 'modal-lg') !!}
{!! Form::modalAction('generate-all-versions-modal', trans('plugins/ecommerce::products.generate_all_variations'), 'info', trans('plugins/ecommerce::products.generate_all_variations_confirmation'), 'generate-all-versions-button', trans('plugins/ecommerce::products.continue')) !!}
{!! Form::modalAction('confirm-delete-version-modal', trans('plugins/ecommerce::products.delete_variation'), 'danger', trans('plugins/ecommerce::products.delete_variation_confirmation'), 'delete-version-button', trans('plugins/ecommerce::products.continue')) !!}
{!! Form::modalAction('delete-variations-modal', trans('plugins/ecommerce::products.delete_variations'), 'danger', trans('plugins/ecommerce::products.delete_variations_confirmation'), 'delete-selected-variations-button', trans('plugins/ecommerce::products.continue')) !!}
