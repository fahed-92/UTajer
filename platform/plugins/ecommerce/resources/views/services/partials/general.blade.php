<div class="row price-group">
    <div class="col-md-12">
        <div class="form-group">
            <label class="text-title-field">{{ trans('plugins/ecommerce::products.price_type') }}</label>
            <select name="price_type"
                    class="next-input input-mask-number regular-price next-input--invisible">
                <option value="" selected>select Option</option>
                <option value="hourly">Hourly</option>
                <option value="fixed">Fixed</option>
            </select>

        </div>
    </div>
</div>
<div class="col-md-12 scheduled-time hidden" @if (old('price_type') == "hourly") style="display: block;" @endif>
    <div class="form-group">
        <label class="text-title-field">{{ trans('plugins/ecommerce::products.start_date') }}</label>
        <input name="start_date"
               class="next-input form-date-time"
               value="{{ old('start_date', $service ? $service->start_date : ($service->start_date ?? null)) }}"
               type="date">
    </div>
</div>
<div class="col-md-12 scheduled-time hidden" @if (old('price_type') == "hourly") style="display: block;" @endif>
    <div class="form-group">
        <label class="text-title-field">{{ trans('plugins/ecommerce::products.end_date') }}</label>
        <input name="end_date"
               class="next-input form-date-time"
               value="{{ old('end_date', $service ? $service->end_date : ($service->end_date ?? null)) }}"
               type="date">
    </div>
</div>

<hr/>
