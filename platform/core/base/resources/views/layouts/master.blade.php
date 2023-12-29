@extends('core/base::layouts.base')

@section ('page')
    @include('core/base::layouts.partials.svg-icon')
    <div class="page-wrapper">

        @include('core/base::layouts.partials.top-header')
        <div class="clearfix"></div>
        <div class="page-container">
            <div class="page-sidebar-wrapper">
                <div class="page-sidebar navbar-collapse collapse">
                    <div class="sidebar">
                        <div class="sidebar-content">
                            <ul class="page-sidebar-menu page-header-fixed" data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
                                @include('core/base::layouts.partials.sidebar')
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="page-content-wrapper">
                <div class="page-content @if (Route::currentRouteName() == 'media.index') rv-media-integrate-wrapper @endif" style="min-height: 100vh">
                    {!! Breadcrumbs::render('main', page_title()->getTitle(false)) !!}
                    <div class="clearfix"></div>
                    <div id="main">
                        <?php
                            $uri =  $_SERVER["REQUEST_URI"]; 
                            $uriArray = explode('/', $uri); 
                            if(isset($uriArray[3]) && isset($uriArray[4])){
                                if($uriArray[3] == 'products'&& $uriArray[4] == 'edit'){
                        ?>
                        <div class="boxed">
                            <?php
                            $lang = BaseHelper::getLocale() ;
                            echo "You are editing <strong> $lang </strong> version."
                            ?>
                          </div>
                          <?php
                            }
                        }
                    
                            ?>
                        @yield('content')
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
        @include('core/base::layouts.partials.footer')
    </div>
@stop

@section('javascript')
    @include('core/media::partials.media')
@endsection

@push('footer')
    @routes
@endpush

<style>
.boxed{
    background-color: #c0edf1;
    border-color: #58d0da;
    color: #000;
    border-left: 5px solid #eee;
    border-radius: 0 4px 4px 0;
    margin: 0 0 20px;
    padding: 15px 30px 15px 15px;
}
    </style>
