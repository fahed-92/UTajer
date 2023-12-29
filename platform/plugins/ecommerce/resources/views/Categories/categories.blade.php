@php
    Theme::set('stickyHeader', 'false');
    Theme::set('pageId', 'categories');
@endphp
<div class="ps-page--shop">
    <div class="ps-container">
        <div class="ps-layout--shop">
            <div class="ps-shopping ps-tab-root">
                <div class="row bg-light py-2 mb-3">
                    <div class="col-lg-6 col-md-6 col-sm-12 d-none d-md-block">
                        <div class="products-found pt-2">
                            <strong>{{ __('All Categories') }}</strong>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                @php
                    $categories =  get_product_categories(['status' => \Botble\Base\Enums\BaseStatusEnum::PUBLISHED], ['slugable', 'children', 'children.slugable', 'children.children', 'children.children.slugable', 'icon'], [], true);
                @endphp
                <div class="row m-5 gx-4">
                    @foreach($categories as $key => $category)
                        <div class="col-3 mb-5">
                            <a href="{{ $category->url }}">
                                <div class="m-auto text-center rounded-lg d-flex align-items-center justify-content-center" style="background-color: {{$category->colour}} ; max-width:97%; height: 120px;">
                                     <span style="letter-spacing: 1px; color:white;">
                                        {{$category->name}}
                                     </span>
                                </div>
                            </a>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</div>


