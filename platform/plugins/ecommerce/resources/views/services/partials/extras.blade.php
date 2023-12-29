<div id="product-extras" class="widget meta-boxes">
    <div class="widget-title">
        <h4><span>Related Services</span></h4>
    </div>
    <div class="widget-body">
        <div class="form-group">
            <label class="control-label">{{ trans('plugins/ecommerce::services.related_services') }}</label>
             <div class="box-search-advance product">
                <div>
                    <input type="text" class="next-input textbox-advancesearch" placeholder="{{ trans('plugins/ecommerce::services.search_services') }}" data-target="{{ $dataUrl }}">
                </div>
                <div class="panel panel-default">

                </div>
            </div>
            @include('plugins/ecommerce::services.partials.selected-service-list', ['services' => $service ? $service->services : collect([]), 'includeVariation' => false])
        </div>
         @if (false)
            <hr>
            <div class="form-group">
                <label class="control-label">{{ trans('plugins/ecommerce::services.up_selling_services') }}</label>
                <input type="hidden" name="up_sale_services" value="@if ($service) {{ implode(',', $service->upSales()->allRelatedIds()->toArray()) }} @endif"/>
                <div class="box-search-advance product">
                    <div>
                        <input type="text" class="next-input textbox-advancesearch" placeholder="{{ trans('plugins/ecommerce::services.search_services') }}" data-target="{{ $dataUrl }}">
                    </div>
                    <div class="panel panel-default">

                    </div>
                </div>
                @include('plugins/ecommerce::services.partials.selected-services-list', ['services' => $service ? $service->upSales : collect([]), 'includeVariation' => false])
            </div>

            <hr>
            <div class="form-group">
                <label class="control-label">{{ trans('plugins/ecommerce::services.grouped_services') }}</label>
                <input type="hidden" name="grouped_services" value="@if ($service) {{ implode(',', $service->groupedItems()->pluck('id')->all()) }} @endif"/>
                <div class="box-search-advance product">
                    <div>
                        <input type="text" class="next-input textbox-advancesearch" placeholder="{{ trans('plugins/ecommerce::services.search_services') }}" data-target="{{ $dataUrl }}">
                    </div>
                    <div class="panel panel-default">

                    </div>
                </div>
                @include('plugins/ecommerce::services.partials.selected-services-list', ['services' => $service ? $service->groupedService : collect([]), 'includeVariation' => false])
            </div>
        @endif
    </div>
</div>

<script id="selected_product_list_template" type="text/x-custom-template">
    <tr>
        <td class="width-60-px min-width-60-px">
            <div class="wrap-img vertical-align-m-i">
                <img class="thumb-image" src="__image__" alt="__name__" title="__name__">
            </div>
        </td>
        <td class="pl5 p-r5 min-width-200-px">
            <a class="hover-underline pre-line" href="__url__">__name__</a>
            <p class="type-subdued">__attributes__</p>
        </td>
        <td class="pl5 p-r5 text-right width-20-px min-width-20-px">
            <a href="#" class="btn-trigger-remove-selected-product" title="{{ trans('plugins/ecommerce::services.delete') }}" data-id="__id__">
                <i class="fa fa-times"></i>
            </a>
        </td>
    </tr>
</script>
