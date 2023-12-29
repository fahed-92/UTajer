@if ($showLabel && $showField)
    @if ($options['wrapper'] !== false)
        <div {!! $options['wrapperAttrs'] !!}>
    @endif
@endif
{{-- {{ $options['title'] }} --}}
@if ($showLabel && $options['label'] !== false && $options['label_show'])
    {!! Form::customLabel($name, $options['label'], $options['label_attr']) !!}
@endif
@if ($showField)
@foreach($options['choices'] as $key => $opt)
    <div class="container">
        <a href={{ route('change-locale',$key) }} target="_blank"><?php echo $opt ?></a>
    </div>
    @include('core/base::forms.partials.help-block')
@endforeach 
@endif

@include('core/base::forms.partials.errors')

@if ($showLabel && $showField)
    @if ($options['wrapper'] !== false)
        </div>
    @endif
@endif
