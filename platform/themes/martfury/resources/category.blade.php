<div class="row m-5 gx-4">
    @foreach($cateogries as $category)
        <div class="col-3 mb-5">
            <a href="{{url('product-categories/'.$category->name)}}"></a>
            <div class="m-auto text-center rounded-lg d-flex align-items-center justify-content-center" style="background-color: {{$category->colour}} ; max-width:97%; height: 120px;">
             <span style="letter-spacing: 1px; color:white;">
                {{$category->name}}
             </span>
            </div>
        </div>
    @endforeach
</div>