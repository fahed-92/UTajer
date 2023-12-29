@extends('core/base::layouts.master')
@section('content')
    @if ($showStart)
        {!! Form::open(Arr::except($formOptions, ['template'])) !!}
    @endif

    @php do_action(BASE_ACTION_TOP_FORM_CONTENT_NOTIFICATION, request(), $form->getModel()) @endphp
    @php  $model = $form->getModel()->customer; @endphp

    <div class="row">
        <div class="col-md-9">
            <div class="tabbable-custom">
                <ul class="nav nav-tabs ">
                    <li class="nav-item">
                        <a href="#tab_detail" class="nav-link active" data-toggle="tab">{{ trans('core/base::tabs.detail') }} </a>
                    </li>
                    @if (!empty($model))
                        <li class="nav-item">
                            <a href="#tab_bank_info" class="nav-link" data-toggle="tab">{{ __('Bank information') }} </a>
                        </li>
                    @else
                        {!! apply_filters(BASE_FILTER_REGISTER_CONTENT_TABS, null, $form->getModel()) !!}
                    @endif
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="tab_detail">
                        @if ($showFields)
                            @foreach ($fields as $key => $field)
                                @if ($field->getName() == $form->getBreakFieldPoint())
                                    @break
                                @else
                                    @unset($fields[$key])
                                @endif
                                @if (!in_array($field->getName(), $exclude))
                                    {!! $field->render() !!}
                                    @if ($field->getName() == 'name' && defined('BASE_FILTER_SLUG_AREA'))
                                        {!! apply_filters(BASE_FILTER_SLUG_AREA, null, $form->getModel()) !!}
                                    @endif
                                @endif
                            @endforeach
                        @endif
                        <div class="clearfix"></div>
                    </div>
                    @if (!empty($model))
                        <div class="tab-pane" id="tab_bank_info">
                            <div class="form-group">
                                <div class="ps-form__content">
                                    <div class="form-group">
                                        <label for="bank_info_name">{{ __('Bank name') }}:</label>
                                        <input id="bank_info_name"
                                               type="text"
                                               class="form-control"
                                               name="bank_info[name]"
                                               placeholder="{{ __('Bank name') }}"
                                               value="{{ Arr::get($model->bank_info, 'name') }}">
                                    </div>
                                    {!! Form::error('bank_info[name]', $errors) !!}

                                    <div class="form-group">
                                        <label for="account_holder_name">{{ __('Account Holder Name') }}:</label>
                                        <input id="account_holder_name"
                                               type="text"
                                               class="form-control"
                                               placeholder="{{ __('Account Holder Name') }}"
                                               name="bank_info[account_holder_name]"
                                               value="{{ Arr::get($model->bank_info, 'account_holder_name') }}">
                                    </div>
                                    {!! Form::error('bank_info[account_holder_name]', $errors) !!}

                                    <div class="form-group">
                                        <label for="routing_number">{{ __('Routing Number') }}:</label>
                                        <input id="routing_number"
                                               type="text"
                                               class="form-control"
                                               placeholder="{{ __('Routing Number') }}"
                                               name="bank_info[routing_number]"
                                               value="{{ Arr::get($model->bank_info, 'routing_number') }}">
                                    </div>
                                    {!! Form::error('bank_info[routing_number]', $errors) !!}

                                    <div class="form-group">
                                        <label for="ssn">{{ __('SSN') }}:</label>
                                        <input id="ssn"
                                               type="text"
                                               class="form-control"
                                               placeholder="{{ __('SSN') }}"
                                               name="bank_info[ssn]"
                                               value="{{ Arr::get($model->bank_info, 'ssn') }}">
                                    </div>
                                    {!! Form::error('bank_info[ssn]', $errors) !!}

                                    <div class="form-group">
                                        <label for="bank_info_number">{{ __('Bank number') }}:</label>
                                        <input id="bank_info_number"
                                               type="text"
                                               class="form-control"
                                               placeholder="{{ __('Bank number') }}"
                                               name="bank_info[number]"
                                               value="{{ Arr::get($model->bank_info, 'number') }}">
                                    </div>
                                    {!! Form::error('bank_info[name]', $errors) !!}
                                    <div class="form-group">
                                        <label for="dob">{{ __('Date of Birth') }}:</label>
                                        <input id="dob"
                                               type="text"
                                               class="form-control"
                                               placeholder="{{ __('Date of Birth') }}"
                                               name="bank_info[dob]"
                                               value="{{ Arr::get($model->bank_info, 'dob') }}">
                                    </div>
                                    {!! Form::error('bank_info[dob]', $errors) !!}

                                    <div class="form-group">
                                        <label for="bank_info_full_name">{{ __('Full name') }}:</label>
                                        <input id="bank_info_full_name"
                                               type="text"
                                               class="form-control"
                                               placeholder="{{ __('Full name') }}"
                                               name="bank_info[full_name]"
                                               value="{{ Arr::get($model->bank_info, 'full_name') }}">
                                    </div>
                                    {!! Form::error('bank_info[name]', $errors) !!}

                                    <div class="form-group">
                                        <label for="bank_info_description">{{ __('Description') }}:</label>
                                        <textarea id="bank_info_description"
                                                  type="text"
                                                  class="form-control"
                                                  placeholder="{{ __('Description') }}"
                                                  name="bank_info[description]"
                                                  rows="4">{{ Arr::get($model->bank_info, 'description') }}</textarea>
                                    </div>
                                    {!! Form::error('bank_info[description]', $errors) !!}
                                </div>
                            </div>
                        </div>
                    @else
                        {!! apply_filters(BASE_FILTER_REGISTER_CONTENT_TAB_INSIDE, null, $form->getModel()) !!}
                    @endif
                </div>
            </div>

            @foreach ($form->getMetaBoxes() as $key => $metaBox)
                {!! $form->getMetaBox($key) !!}
            @endforeach

            @php do_action(BASE_ACTION_META_BOXES, 'advanced', $form->getModel()) @endphp
        </div>
        <div class="col-md-3 right-sidebar">
            {!! $form->getActionButtons() !!}
            @php do_action(BASE_ACTION_META_BOXES, 'top', $form->getModel()) @endphp

            @foreach ($fields as $field)
                @if (!in_array($field->getName(), $exclude))
                    <div class="widget meta-boxes">
                        <div class="widget-title">
                            <h4>{!! Form::customLabel($field->getName(), $field->getOption('label'), $field->getOption('label_attr')) !!}</h4>
                        </div>
                        <div class="widget-body">
                            {!! $field->render([], false) !!}
                        </div>
                    </div>
                @endif
            @endforeach

            @php do_action(BASE_ACTION_META_BOXES, 'side', $form->getModel()) @endphp
        </div>
    </div>

    @if ($showEnd)
        {!! Form::close() !!}
    @endif
@stop

@if ($form->getValidatorClass())
    @if ($form->isUseInlineJs())
        {!! Assets::scriptToHtml('jquery') !!}
        {!! Assets::scriptToHtml('form-validation') !!}
        {!! $form->renderValidatorJs() !!}
    @else
        @push('footer')
            {!! $form->renderValidatorJs() !!}
        @endpush
    @endif
@endif

