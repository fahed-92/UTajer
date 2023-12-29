<?php
/**
 * @var string $value
 */
$value = isset($value) ? (array)$value : [];
?>
@if($categories)
    <ul>
        @foreach($categories as $category)
            @if (is_object($category))
                @if($category->id != $currentId)
                    <li value="{{ $category->id ?? '' }}"
                            {{ $category->id == $value ? 'selected' : '' }}>
                        {!! Form::customCheckbox([
                            [
                                $name, $category->id, $category->name, in_array($category->id, $value),
                            ]
                        ]) !!}
                        @include('plugins/ecommerce::product-categories.partials.categories-checkbox-option-line', [
                            'categories' => $category->child_cats,
                            'value'      => $value,
                            'currentId'  => $currentId,
                            'name'       => $name,
                            'attr'       => ['class' => 'categorySelection']
                        ])
                    </li>
                @endif
            @else
                <li value="other-category"
                        {{ $category == $value ? 'selected' : '' }}>
                    {!! Form::customCheckbox([
                        [
                            $name, $category, 'Other Category', in_array($category, $value),
                        ]
                    ]) !!}

                </li>

            @endif

        @endforeach
    </ul>
@endif
