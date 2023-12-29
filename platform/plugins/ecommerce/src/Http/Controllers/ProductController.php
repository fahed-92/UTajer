<?php

namespace Botble\Ecommerce\Http\Controllers;

use Assets;
use Botble\Ecommerce\Models\Categories;
use Botble\Ecommerce\Models\ProductVariation;
use Botble\Ecommerce\Models\Review;
use Botble\Ecommerce\Models\Service;
use Botble\Ecommerce\Models\Store;
use Botble\Ecommerce\Services\Products\UpdateDefaultProductService;
use Botble\Marketplace\Http\Requests\BecomeVendorRequest;
use Botble\Slug\Models\Slug;
use Exception;
use Illuminate\Support\Str;
use Throwable, URL;
use Illuminate\View\View;
use Illuminate\Http\Request;
use Botble\Ecommerce\Models\Tax;
use Botble\Ecommerce\Models\Cart;
use Botble\Ecommerce\Models\Page;
use Illuminate\Http\JsonResponse;
use Botble\Base\Forms\FormBuilder;
use Botble\Base\Supports\Language;
use Botble\Ecommerce\Models\Brand;
use Botble\Ecommerce\Models\Order;
use Botble\Ecommerce\Models\Slugs;
use Illuminate\Support\Collection;
use Botble\Ecommerce\Models\Product;
use Botble\Ecommerce\Models\Customer;
use Botble\Ecommerce\Models\Discount;
use Illuminate\Http\RedirectResponse;
use Illuminate\Contracts\View\Factory;
use Botble\Ecommerce\Forms\ProductForm;
use Botble\Ecommerce\Models\FilterTags;
use Botble\Ecommerce\Models\ProductFav;
use Botble\Ecommerce\Tables\ProductTable;
use Botble\Ecommerce\Models\ReturnProduct;
use Botble\Ecommerce\Models\DiscountProduct;
use Botble\Ecommerce\Models\ProductCategory;
use Botble\Ecommerce\Models\ProductAttribute;
use Botble\Ecommerce\Models\ProductTranslation;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Ecommerce\Traits\ProductActionsTrait;
use Botble\Ecommerce\Http\Requests\ProductRequest;
use Botble\Ecommerce\Services\StoreProductTagService;
use Botble\Ecommerce\Services\Products\StoreProductService;
use Botble\Ecommerce\Repositories\Interfaces\GroupedProductInterface;
use Botble\Ecommerce\Repositories\Interfaces\ProductVariationInterface;
use Botble\Ecommerce\Services\Products\StoreAttributesOfProductService;
use Botble\Ecommerce\Repositories\Interfaces\ProductVariationItemInterface;
use SlugHelper;
use function GuzzleHttp\json_encode;

class ProductController extends BaseController
{
    use ProductActionsTrait;

    /**
     * @param ProductTable $dataTable
     * @return Factory|View
     * @throws Throwable
     */
    public function index(ProductTable $dataTable)
    {
        page_title()->setTitle(trans('plugins/ecommerce::products.name'));

        Assets::addScripts(['bootstrap-editable'])
            ->addStyles(['bootstrap-editable']);

        return $dataTable->renderTable();
    }

    /**
     * @param FormBuilder $formBuilder
     * @return string
     */
    public function create(FormBuilder $formBuilder)
    {
        page_title()->setTitle(trans('plugins/ecommerce::products.create'));

        Assets::addStyles(['datetimepicker'])
            ->addScripts([
                'moment',
                'datetimepicker',
                'jquery-ui',
                'input-mask',
                'blockui',
            ])
            ->addStylesDirectly(['vendor/core/plugins/ecommerce/css/ecommerce.css'])
            ->addScriptsDirectly([
                'vendor/core/plugins/ecommerce/libraries/bootstrap-confirmation/bootstrap-confirmation.min.js',
                'vendor/core/plugins/ecommerce/js/edit-product.js',
            ]);

        return $formBuilder->create(ProductForm::class)->renderForm();
    }

    /**
     * @param int $id
     * @param FormBuilder $formBuilder
     * @return string
     */
    public function edit($id, FormBuilder $formBuilder)
    {
        $product = $this->productRepository->findOrFail($id);
        if ($product->is_variation) {
            abort(404);
        }
        page_title()->setTitle(trans('plugins/ecommerce::products.edit', ['name' => $product->name]));

        Assets::addStyles(['datetimepicker'])
            ->addScripts([
                'moment',
                'datetimepicker',
                'jquery-ui',
                'input-mask',
                'blockui',
            ])
            ->addStylesDirectly(['vendor/core/plugins/ecommerce/css/ecommerce.css'])
            ->addScriptsDirectly([
                'vendor/core/plugins/ecommerce/libraries/bootstrap-confirmation/bootstrap-confirmation.min.js',
                'vendor/core/plugins/ecommerce/js/edit-product.js',
            ]);

        return $formBuilder
            ->create(ProductForm::class, ['model' => $product])
            ->renderForm();
    }

    /**
     * @param ProductRequest $request
     * @param StoreProductService $service
     * @param BaseHttpResponse $response
     * @param ProductVariationInterface $variationRepository
     * @param ProductVariationItemInterface $productVariationItemRepository
     * @param GroupedProductInterface $groupedProductRepository
     * @param StoreAttributesOfProductService $storeAttributesOfProductService
     * @param StoreProductTagService $storeProductTagService
     * @return BaseHttpResponse
     * @throws Exception
     */
    public function store(
        ProductRequest $request,
        StoreProductService $service,
        BaseHttpResponse $response,
        ProductVariationInterface $variationRepository,
        ProductVariationItemInterface $productVariationItemRepository,
        GroupedProductInterface $groupedProductRepository,
        StoreAttributesOfProductService $storeAttributesOfProductService,
        StoreProductTagService $storeProductTagService
    ) {
        $product = $this->productRepository->getModel();

        $product = $service->execute($request, $product);
        $storeProductTagService->execute($request, $product);

        $addedAttributes = $request->input('added_attributes', []);

        if ($request->input('is_added_attributes') == 1 && $addedAttributes) {
            $storeAttributesOfProductService->execute($product, array_keys($addedAttributes));

            $variation = $variationRepository->create([
                'configurable_product_id' => $product->id,
            ]);

            foreach ($addedAttributes as $attribute) {
                $productVariationItemRepository->createOrUpdate([
                    'attribute_id' => $attribute,
                    'variation_id' => $variation->id,
                ]);
            }

            $variation = $variation->toArray();

            $variation['variation_default_id'] = $variation['id'];

            $variation['sku'] = $product->sku;
            $variation['auto_generate_sku'] = true;

            $variation['images'] = $request->input('images', []);

            $this->postSaveAllVersions([$variation['id'] => $variation], $variationRepository, $product->id, $response);
        }

        if ($request->has('grouped_products')) {
            $groupedProductRepository->createGroupedProducts($product->id, array_map(function ($item) {
                return [
                    'id'  => $item,
                    'qty' => 1,
                ];
            }, array_filter(explode(',', $request->input('grouped_products', '')))));
        }

        return $response
            ->setPreviousUrl(route('products.index'))
            ->setNextUrl(route('products.edit', $product->id))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    /**
     * @param int $id
     * @param ProductRequest $request
     * @param StoreProductService $service
     * @param GroupedProductInterface $groupedProductRepository
     * @param BaseHttpResponse $response
     * @param ProductVariationInterface $variationRepository
     * @param ProductVariationItemInterface $productVariationItemRepository
     * @param StoreProductTagService $storeProductTagService
     * @return BaseHttpResponse|JsonResponse|RedirectResponse
     */
    public function update(
        $id,
        ProductRequest $request,
        StoreProductService $service,
        GroupedProductInterface $groupedProductRepository,
        BaseHttpResponse $response,
        ProductVariationInterface $variationRepository,
        ProductVariationItemInterface $productVariationItemRepository,
        StoreProductTagService $storeProductTagService
    ) {
        $product = $this->productRepository->findOrFail($id);
        $parsedUrl = parse_url(URL::previous());
        if (array_key_exists('query', $parsedUrl)) {
            parse_str($parsedUrl['query'], $query);
            $findProduct = ProductTranslation::where('ec_products_id',$id)->first();
            if(!empty($findProduct)){
                $findProduct->delete();
            }
            $pro = new ProductTranslation();
            $pro->lang_code =   $query['ref_lang'];
            $pro->ec_products_id =   $id;
            $pro->name =   $request->name;
            $pro->description =   $request->description ? $request->description : '';
            $pro->content =   $request->content ? $request->content : '';
            $pro->save();

        }else{
            $product = $service->execute($request, $product);
            $storeProductTagService->execute($request, $product);

            $variationRepository
                ->getModel()
                ->where('configurable_product_id', $product->id)
                ->update(['is_default' => 0]);

            $defaultVariation = $variationRepository->findById($request->input('variation_default_id'));
            if ($defaultVariation) {
                $defaultVariation->is_default = true;
                $defaultVariation->save();
            }

            $addedAttributes = $request->input('added_attributes', []);

            if ($request->input('is_added_attributes') == 1 && $addedAttributes) {
                $result = $variationRepository->getVariationByAttributesOrCreate($id, $addedAttributes);

                /**
                 * @var Collection $variation
                 */
                $variation = $result['variation'];

                foreach ($addedAttributes as $attribute) {
                    $productVariationItemRepository->createOrUpdate([
                        'attribute_id' => $attribute,
                        'variation_id' => $variation->id,
                    ]);
                }

                $variation = $variation->toArray();
                $variation['variation_default_id'] = $variation['id'];

                $product->productAttributeSets()->sync(array_keys($addedAttributes));

                $variation['sku'] = $product->sku;
                $variation['auto_generate_sku'] = true;

                $this->postSaveAllVersions([$variation['id'] => $variation], $variationRepository, $product->id, $response);
            } elseif ($product->variations()->count() === 0) {
                $product->productAttributeSets()->detach();
                $product->productAttributes()->detach();
            }

            if ($request->has('grouped_products')) {
                $groupedProductRepository->createGroupedProducts($product->id, array_map(function ($item) {
                    return [
                        'id'  => $item,
                        'qty' => 1,
                    ];
                }, array_filter(explode(',', $request->input('grouped_products', '')))));
            }

            $relatedProductIds = $product->variations()->pluck('product_id')->all();

            $this->productRepository->update([['id', 'IN', $relatedProductIds]], ['status' => $product->status]);
        }

        return $response
            ->setPreviousUrl(route('products.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    public function productCategories()
    {
        $Categorylist = ProductCategory::where('status', 'published')->where('parent_id', '0')->get();
        foreach ($Categorylist as $iKey => $iValues) {
            if (!empty($iValues->image)) {
                $Categorylist[$iKey]['image'] = url("storage/" . $iValues->image);
            } else {
                $Categorylist[$iKey]['image'] = "";
            }
        }
        return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.CategoryList'), $Categorylist);
    }

    public function subCategories()
    {
        $input = request()->all();
        $subCategorylist = ProductCategory::where('parent_id', $input['category_id'])->where('status', 'published')->get();
        foreach ($subCategorylist as $iKey => $iValues) {
            if (!empty($iValues->image)) {
                $subCategorylist[$iKey]['image'] = url('storage/' . $iValues->image);
            } else {
                $subCategorylist[$iKey]['image'] = "";
            }
        }
//        $services = Service::where('status',Service::ACTIVE_STATUS)->get();
//        $data = [
//            'subCategories' => $subCategorylist,
//            'services' => $services
//        ];
        $data= $subCategorylist;
        return returnResponse(true, 200, '', 'List of Services And '.__('alias.controller.auth.apAuthController.SubCategoryList') , $data);
    }
    public function appServices()
    {
        $services = Service::where('status',Service::ACTIVE_STATUS)->get();
        $data= $services;
        return returnResponse(true, 200, '', 'List of Services ', $data);
    }

    public function categorySearch()
    {
        $input = request()->all();

        if ($input['category'] == 1) {
            $Categorylist = ProductCategory::whereRaw("name LIKE '%" . $input['search'] . "%'")->where('parent_id', '0')->where('status', 'published')->get();
        } else if ($input['category'] == 0) {
            $Categorylist = ProductCategory::whereRaw("name LIKE '%" . $input['search'] . "%'")->where('status', 'published')->where('parent_id', $input['category_id'])->get();
        }
        if (!empty($Categorylist)) {
            foreach ($Categorylist as $iKey => $iValues) {
                if (!empty($iValues->image)) {
                    $Categorylist[$iKey]['image'] = "http://15.184.143.70/storage/" . $iValues->image;
                } else {
                    $Categorylist[$iKey]['image'] = "";
                }
            }
        }
        return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.SearchResult'), $Categorylist);
    }

    public function productSubCategories()
    {
        $input = request()->all();

        $productIdsList = ProductCategory::select('id')
            ->where('status', 'published')
            ->with(array('products' => function ($query) {
                $query->select('product_id');
            }))->Where('id', $input['category_id'])->get();

        foreach ($productIdsList as $piKey => $pvalues) {
            foreach ($pvalues['products'] as $pkey => $ppvalue) {
                $product_ids[] = $ppvalue["product_id"];
            }
        }

        $productDataList = [];
        if (!empty($product_ids)) {
            $productIdsData = array_unique($product_ids);
            foreach ($productIdsData as $piskey => $pisvalue) {
                $ProductDetail = Product::where('id', $pisvalue)->first();
                $ProductDetail->short_description = "abcj";
                $ProductDetail->description = strip_tags($ProductDetail->description);
                $product_images = [];
                foreach ($ProductDetail->images as $iKey => $iValues) {
                    $product_images[$iKey] = "http://15.184.143.70/storage/" . $iValues;
                }

                $ProductDetail->app_image = $product_images;
                $fav_data = ProductFav::where('product_id', $ProductDetail->id)->where('user_id', $input['user_id'])->first();
                // echo "<pre>";print_r($fav_data);
                if (!empty($fav_data)) {
                    if ($fav_data->is_fav == 1) {
                        $ProductDetail->fav = true;
                    } else {
                        $ProductDetail->fav = false;
                    }
                } else {
                    $ProductDetail->fav = false;
                }
                $productDataList[$piskey] = $ProductDetail;
            } //die;
        }
        return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.SubCategoryProduct'), $productDataList);
    }

    public function similarProducts()
    {
        $input = request()->all();
        $product_id = $input['product_id'];
        $ProductDetail = Product::where('id', $input['product_id'])->first();
        if (!empty($ProductDetail)) {
            $product_id = $input['product_id'];

            $productIdsList = Product::select('*')
                ->with(array('categories' => function ($query) {
                    $query->select('*');
                }))
                ->where('id', $product_id)->first();

            $category_ids = [];
            foreach ($productIdsList['categories'] as $piKey => $values) {
                $category_ids[] = $values["pivot"]['category_id'];
            }

            $productData = ProductCategory::where('status', 'published')->whereIn('id', $category_ids)
                ->with(array('products' => function ($query) {
                    $query->select('*');
                }))
                ->get();

            $productDataList = [];
            $product_ids = [];
            foreach ($productData as $pKey => $pValues) {
                foreach ($pValues["products"] as $ppkey => $ppvalue) {
                    $product_ids[] = $ppvalue['product_id'];
                }
            }

            if (!empty($product_ids)) {
                $productIdsData = array_unique($product_ids);

                foreach ($productIdsData as $piskey => $pisvalue) {
                    if ($pisvalue != $input['product_id']) {
                        $ProductDetail = Product::where('id', $pisvalue)->first();
                        $ProductDetail->short_description = "abcj";
                        $ProductDetail->description = strip_tags($ProductDetail->description);
                        $product_images = [];
                        foreach ($ProductDetail->images as $iKey => $iValues) {
                            $product_images[$iKey] = "http://15.184.143.70/storage/" . $iValues;
                        }

                        $ProductDetail->app_image = $product_images;
                        $fav_data = ProductFav::where('product_id', $ProductDetail->id)->where('user_id', $input['user_id'])->first();
                        if (!empty($fav_data)) {
                            if ($fav_data->is_fav == 1) {
                                $ProductDetail->fav = true;
                            } else {
                                $ProductDetail->fav = false;
                            }
                        } else {
                            $ProductDetail->fav = false;
                        }
                        $productDataList[] = $ProductDetail;
                    }
                }
                //return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.SearchResult'),$productDataList);
            }

            /*foreach($productDataList as $key => $value) {
                $productDataList[$key]['short_description'] = "abcj";
                if(!empty($value->description)) {
                    $productDataList[$key]['description'] = strip_tags($value->description);
                }
                $product_images = [];
                if(!empty($value->images)) {
                    foreach($value->images as $iKey => $iValues) {
                        $product_images[$iKey] = "http://15.184.143.70/storage/".$iValues;
                    }
                }
                $productDataList[$key]['app_image'] = $product_images;

                $fav_data = ProductFav::where('product_id',$value->id)->where('user_id',$input['user_id'])->first();
                if(!empty($fav_data)) {
                    if($fav_data->is_fav == 1) {
                        $productDataList[$key]['fav'] = true;
                    } else {
                        $productDataList[$key]['fav'] = false;
                    }
                } else {
                    $productDataList[$key]['fav'] = false;
                }
            }*/
        }
        return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.SimilarProducts'), $productDataList);
    }

    public function appProductListing(Request $request)
    {
        $input = request()->all();
        $language = $request->server('HTTP_ACCEPT_LANGUAGE');
        $lang_pref = isset($language) ? $language : 'en' ;
        $customer = Customer::where('id', $input['user_id'])->first();
        if ($customer) {
            $productlist = Product::get();
            foreach ($productlist as $key => $value) {
                $info = ProductTranslation::where('lang_code',$lang_pref)->where('ec_products_id',$value->id)->first();
                if(!empty($info)){
                    $productlist[$key]['language']  = $info;
                }
                $productlist[$key]['short_description'] = "abcj";
                $productlist[$key]['description'] = strip_tags($value->description);
                $product_images = [];
                foreach ($value->images as $iKey => $iValues) {
                    $product_images[$iKey] = "storage/" . $iValues;
                }
                $productlist[$key]['app_image'] = $product_images;

                $fav_data = ProductFav::where('product_id', $value->id)->where('user_id', $input['user_id'])->first();
                if (!empty($fav_data)) {
                    if ($fav_data->is_fav == 1) {
                        $productlist[$key]['fav'] = true;
                    } else {
                        $productlist[$key]['fav'] = false;
                    }
                } else {
                    $productlist[$key]['fav'] = false;
                }
            }

            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.ProductListing'), $productlist);
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function appProductDetail()
    {
        $input = request()->all();
        $customer = Customer::where('id', $input['user_id'])->first();
        if ($customer) {
            $ProductDetail = Product::where('id', $input['product_id'])->first();
            $ProductDetail->short_description = "abcj";
            $ProductDetail->description = strip_tags($ProductDetail->description);
            $product_images = [];
            foreach ($ProductDetail->images as $iKey => $iValues) {
                $product_images[$iKey] = "storage/" . $iValues;
            }

            $ProductDetail->app_image = $product_images;
            $fav_data = ProductFav::where('product_id', $input['product_id'])->where('user_id', $input['user_id'])->first();
            if (!empty($fav_data)) {
                if ($fav_data->is_fav == 1) {
                    $ProductDetail->fav = true;
                } else {
                    $ProductDetail->fav = false;
                }
            } else {
                $ProductDetail->fav = false;
            }

            $ProductDetail->url = "";
            $slug_name = Slugs::select('*')->where('reference_id', $input['product_id'])->where('prefix', 'products')->first();
            if (!empty($slug_name)) {
                //echo "<pre>";print_r($slug_name);die;
                $ProductDetail->url = url("products/" . $slug_name->key);
            }

            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.ProductDetail'), $ProductDetail);
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function appProductFav()
    {
        $input = request()->all();
        $customer = Customer::where('id', $input['user_id'])->first();
        if ($customer) {

            $ProductDetail = Product::where('id', $input['product_id'])->first();
            if (!empty($ProductDetail)) {
                $fav_data = ProductFav::where('product_id', $input['product_id'])->where('user_id', $input['user_id'])->first();
                if (empty($fav_data)) {
                    ProductFav::create($input);
                } else {
                    $fav_data->is_fav = $input['is_fav'];
                    $fav_data->save();
                }
            }
            if ($input['is_fav'] == 1) {
                return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.Productfav'));
            } else {
                return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.ProductNotFav'));
            }
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function addToCart()
    {
        $input = request()->all();
        $customer = Customer::where('id', $input['user_id'])->first();
        if ($customer) {
            $ProductDetail = Product::where('id', $input['product_id'])->first();
            if (!empty($ProductDetail)) {
                $cartData = Cart::where('user_id', $input['user_id'])->where('product_id', $input['product_id'])->first();
                if (!empty($cartData)) {
                    $cartData->quantity = $cartData->quantity + $input['quantity'];
                    $cartData->save();
                } else {
                    Cart::create($input);
                }
            }
            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.AddToCart'));
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function editCart()
    {
        $input = request()->all();
        $customer = Customer::where('id', $input['user_id'])->first();
        if ($customer) {
            $ProductDetail = Product::where('id', $input['product_id'])->first();
            if (!empty($ProductDetail)) {
                $cartData = Cart::where('user_id', $input['user_id'])->where('product_id', $input['product_id'])->first();
                if (!empty($cartData)) {
                    if ($input['quantity'] == 0) {
                        $cartData->delete();
                    } else {
                        $cartData->quantity = $input['quantity'];
                        $cartData->save();
                    }
                }
            }
            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.editCart'));
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function removeFromCart()
    {
        $input = request()->all();
        $customer = Customer::where('id', $input['user_id'])->first();
        if ($customer) {
            $ProductDetail = Product::where('id', $input['product_id'])->first();
            if (!empty($ProductDetail)) {
                $cartData = Cart::where('user_id', $input['user_id'])->where('product_id', $input['product_id'])->delete();
            }
            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.RemoveFromCart'));
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function productSearch()
    {
        $input = request()->all();
        $customer = Customer::where('id', $input['user_id'])->first();
        if ($customer) {
            $productlist = Product::whereRaw("name LIKE '%" . $input['search'] . "%'")->orWhereRaw("description LIKE '%" . $input['search'] . "%'")->get();
            if (!empty($productlist)) {
                foreach ($productlist as $key => $value) {
                    $productlist[$key]['short_description'] = "abcj";
                    $productlist[$key]['description'] = strip_tags($value->description);
                    $product_images = [];
                    foreach ($value->images as $iKey => $iValues) {
                        $product_images[$iKey] = "storage/" . $iValues;
                    }
                    $productlist[$key]['app_image'] = $product_images;
                    $fav_data = ProductFav::where('product_id', $value->id)->where('user_id', $input['user_id'])->first();
                    if (!empty($fav_data)) {
                        if ($fav_data->is_fav == 1) {
                            $productlist[$key]['fav'] = true;
                        } else {
                            $productlist[$key]['fav'] = false;
                        }
                    } else {
                        $productlist[$key]['fav'] = false;
                    }
                }
                return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.SearchResult'), $productlist);
            } else {
                return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.NoSearchResult'), $productlist);
            }
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function productFilter()
    {
        $input = request()->all();
        $customer = Customer::where('id', $input['user_id'])->first();
        if ($customer) {
            $product_ids = [];
            $productlist = [];
            foreach ($input['start_price'] as $spkey => $spvalue) {
                $productlist[] = Product::select('id')->whereBetween('price', [$spvalue, $input['end_price'][$spkey]])->orWhereIn('brand_id', $input['brand'])->get();
            }

            foreach ($productlist as $key => $values) {
                foreach ($values as $ppkey => $pppvalue) {
                    $product_ids[] = $pppvalue["id"];
                }
            }

            $productIdsList = ProductCategory::select('id')
                ->where('status', 'published')
                ->with(array('products' => function ($query) {
                    $query->select('product_id');
                }))->WhereIn('id', $input['category'])->get();

            foreach ($productIdsList as $piKey => $pvalues) {
                foreach ($pvalues['products'] as $pkey => $ppvalue) {
                    $product_ids[] = $ppvalue["product_id"];
                }
            }

            $color = $input['color'];
            $color_id = Product::select('id')
                ->with(array('productAttributes' => function ($query) use ($color) {
                    $query->select('product_id')->whereIn('attribute_id', $color);
                }))->get();

            foreach ($color_id as $cKey => $cvalues) {
                foreach ($cvalues['productAttributes'] as $pakey => $pavalue) {
                    $product_ids[] = $pavalue["product_id"];
                }
            }

            $productDataList = [];
            if (!empty($product_ids)) {
                $productIdsData = array_values(array_unique($product_ids));
                // $productIdsData = array_unique($product_ids);
                foreach ($productIdsData as $piskey => $pisvalue) {
                    $ProductDetail = Product::where('id', $pisvalue)->first();
                    $ProductDetail->short_description = "product filter";
                    $ProductDetail->description = strip_tags($ProductDetail->description);
                    $product_images = [];
                    foreach ($ProductDetail->images as $iKey => $iValues) {
                        $product_images[$iKey] = "storage/" . $iValues;
                    }

                    $ProductDetail->app_image = $product_images;
                    $fav_data = ProductFav::where('product_id', $ProductDetail->id)->where('user_id', $input['user_id'])->first();
                    if (!empty($fav_data)) {
                        if ($fav_data->is_fav == 1) {
                            $ProductDetail->fav = true;
                        } else {
                            $ProductDetail->fav = false;
                        }
                    } else {
                        $ProductDetail->fav = false;
                    }
                    $productDataList[$piskey] = $ProductDetail;
                }
                return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.SearchResult'), $productDataList);
            } else {
                $productlist = Product::get();
                foreach ($productlist as $key => $value) {
                    $productlist[$key]['short_description'] = "product filter";
                    $productlist[$key]['description'] = strip_tags($value->description);
                    $product_images = [];
                    foreach ($value->images as $iKey => $iValues) {
                        $product_images[$iKey] = "storage/" . $iValues;
                    }
                    $productlist[$key]['app_image'] = $product_images;

                    $fav_data = ProductFav::where('product_id', $value->id)->where('user_id', $input['user_id'])->first();
                    if (!empty($fav_data)) {
                        if ($fav_data->is_fav == 1) {
                            $productlist[$key]['fav'] = true;
                        } else {
                            $productlist[$key]['fav'] = false;
                        }
                    } else {
                        $productlist[$key]['fav'] = false;
                    }
                }
                return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.NoSearchResult'), $productlist);
            }
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function productFilterTags()
    {
        $filterTags = FilterTags::get();

        foreach ($filterTags as $key => $value) {
            $filterTags[$key]['data'] = [];
            if ($value->model_name == 'Brand') {
                $filterTags[$key]['data'] = Brand::select('id', 'name')->get();
            }
            if ($value->model_name == 'ProductCategory') {
                $filterTags[$key]['data'] = ProductCategory::select('id', 'name')->where('status', 'published')->get();
            }
            if ($value->model_name == 'Gender') {
                $genderData[0] = ["id" => 1, "name" => "Men"];
                $genderData[1] = ["id" => 2, "name" => "Women"];
                $filterTags[$key]['data'] = $genderData;
            }
            if ($value->model_name == 'Color') {
                $filterTags[$key]['data'] = ProductAttribute::select('id', 'title')->where('attribute_set_id', 1)->get();
            }
        }

        return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.FilterTags'), $filterTags);
    }

    public function getProductCharges()
    {
        $input = request()->all();
        $customer = Customer::where('id', $input['user_id'])->first();
        if ($customer) {
            $chargesData['tax_percentage'] = 0;
            $chargesData['shipping_percentage'] = 0;

            $cart_data = Cart::where('user_id', $input['user_id'])->first();
            if (!empty($cart_data)) {
                $ProductDetail = Product::where('id', $cart_data->product_id)->first();
                if (!empty($ProductDetail)) {
                    if (!empty($ProductDetail->tax_id)) {
                        $taxData = Tax::where('id', $ProductDetail->tax_id)->first();
                        $chargesData['tax_percentage'] = $taxData->percentage;
                    }
                }
            }
            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.ProductChargesDetails'), $chargesData);
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function checkProductDiscount()
    {
        $input = request()->all();
        $customer = Customer::where('id', $input['user_id'])->first();
        if ($customer) {
            $chargesData['discount_percentage'] = 0;
            if (!empty($input['promo_code'])) {
                $discount = Discount::where('code', $input['promo_code'])->first();
                if (!empty($discount)) {
                    $chargesData['discount_percentage'] = $discount->value;
                }
            }
            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.ProductDicountDetails'), $chargesData);
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function returnProduct()
    {
        $input = request()->all();
        $customer = Customer::where('id', $input['user_id'])->first();
        if ($customer) {
            $productReturnData['email'] = $input['email'];
            $productReturnData['subject'] = $input['subject'];
            $productReturnData['reason'] = $input['reason'];
            $productReturnData['user_id'] = $input['user_id'];
            $productReturnData['product_id'] = $input['product_id'];
            $productReturnData['order_id'] = $input['order_id'];
            $productReturnData['order_date'] = date('Y-m-d', strtotime($input['order_date']));
            $productReturnData['estimate_delivery_date'] = date('Y-m-d', strtotime($input['estimate_delivery_date']));

            $productReturn = ReturnProduct::create($productReturnData);
            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.ProductReturn'));
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function returnOrderList()
    {
        $input = request()->all();
        $customer = Customer::where('id', $input['user_id'])->first();
        if ($customer) {
            $returnProduct = ReturnProduct::where('user_id', $input['user_id'])->get();
            if($returnProduct){
                $status = true;
            }else{
                $status = false;
            }
            foreach ($returnProduct as $key => $value) {
                $returnProduct[$key]['product'] = [];
                $ProductDetail = Product::select('id', 'name', 'price', 'images')->where('id', $value['product_id'])->first();
                if (!empty($ProductDetail)) {
                    $product_images = [];
                    foreach ($ProductDetail->images as $iKey => $iValues) {
                        $product_images[$iKey] = "storage/" . $iValues;
                    }
                    $ProductDetail->app_image = $product_images;
                    $returnProduct[$key]['product'] = $ProductDetail;
                    $returnProduct[$key]['isReturnRequested'] = $status;

                }
//                $returnProduct[$key]['product'] = $ProductDetail;
                //		$returnProduct[$key]['isReturnRequested'] = $status;

            }
            $returnProducts = [];
            foreach( $returnProduct as $return  => $retVal){
                if(!empty($retVal['product'])){
                    $returnProducts[] = $retVal;
                }
            }
            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.OrderReturnList'), $returnProducts);
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function addInstructionCart()
    {
        $input = request()->all();
        $customer = Customer::where('id', $input['user_id'])->first();
        if ($customer) {
            foreach ($input['product_id'] as $key => $value) {
                $cartData = Cart::where('user_id', $input['user_id'])->where('product_id', $value)->first();
                if ($cartData) {
                    if (isset($input['note'][$key])) {
                        if (!empty($input['note'][$key])) {
                            $cartData->note = $input['note'][$key];
                            $cartData->save();
                        }
                    } else {
                        $cartData->note = "";
                        $cartData->save();
                    }
                }
            }
            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.editCart'));
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function offers()
    {
        $offers[0] = array(
            "id" => 1,
            'image' => 'http://15.184.143.70/storage/products/offer1.png'
        );
        $offers[1] = array(
            "id" => 2,
            'image' => 'http://15.184.143.70/storage/products/offer2.png'
        );
        $offers[2] = array(
            "id" => 3,
            'image' => 'http://15.184.143.70/storage/products/offer1.png'
        );
        $offers[3] = array(
            "id" => 4,
            'image' => 'http://15.184.143.70/storage/products/offer2.png'
        );

        return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.Offers'), $offers);
    }

    public function return_policy()
    {
        $data = Page::select('name', 'content')->where('name', 'Refund Policy')->where('status', 'published')->first();

        return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.ReturnPolicy'), $data);
    }

    public function terms_and_conditions()
    {
        $data = Page::select('name', 'content')->where('name', 'Terms & Conditions')->where('status', 'published')->first();

        return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.TermsAndConditions'), $data);
    }

    public function offerProducts()
    {
        $input = request()->all();

        $productList = Product::where('sale_price', '!=', NULL)->where('sale_price', '!=', 'price')->get();

        $productDataList = [];
        if (!empty($productList)) {
            foreach ($productList as $piskey => $ProductDetail) {
                $ProductDetail->short_description = "abcj";
                $ProductDetail->description = strip_tags($ProductDetail->description);
                $product_images = [];
                foreach ($ProductDetail->images as $iKey => $iValues) {
                    $product_images[$iKey] = "storage/" . $iValues;
                }

                $ProductDetail->app_image = $product_images;
                $fav_data = ProductFav::where('product_id', $ProductDetail->id)->where('user_id', $input['user_id'])->first();
                // echo "<pre>";print_r($fav_data);
                if (!empty($fav_data)) {
                    if ($fav_data->is_fav == 1) {
                        $ProductDetail->fav = true;
                    } else {
                        $ProductDetail->fav = false;
                    }
                } else {
                    $ProductDetail->fav = false;
                }
                $productDataList[$piskey] = $ProductDetail;
            } //die;
        }
        return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.OfferProduct'), $productDataList);
    }

    public function appAddProduct(
        ProductRequest $request,
        StoreProductService $service,
        BaseHttpResponse $response,
        ProductVariationInterface $variationRepository,
        ProductVariationItemInterface $productVariationItemRepository,
        GroupedProductInterface $groupedProductRepository,
        StoreAttributesOfProductService $storeAttributesOfProductService,
        StoreProductTagService $storeProductTagService
    ){
        $customer = Customer::where('id', $request->user_id)->first();
        if ($customer) {
            $product = $this->productRepository->getModel();
            $product = $service->execute($request, $product);
            $storeProductTagService->execute($request, $product);

            $addedAttributes = $request->input('added_attributes', []);

            if ($request->input('is_added_attributes') == 1 && $addedAttributes) {
                $storeAttributesOfProductService->execute($product, array_keys($addedAttributes));

                $variation = $variationRepository->create([
                    'configurable_product_id' => $product->id,
                ]);

                foreach ($addedAttributes as $attribute) {
                    $productVariationItemRepository->createOrUpdate([
                        'attribute_id' => $attribute,
                        'variation_id' => $variation->id,
                    ]);
                }

                $variation = $variation->toArray();

                $variation['variation_default_id'] = $variation['id'];

                $variation['sku'] = $product->sku;
                $variation['auto_generate_sku'] = true;

                $variation['images'] = $request->input('images', []);

                $this->postSaveAllVersions([$variation['id'] => $variation], $variationRepository, $product->id, $response);
            }

            if ($request->has('grouped_products')) {
                $groupedProductRepository->createGroupedProducts($product->id, array_map(function ($item) {
                    return [
                        'id'  => $item,
                        'qty' => 1,
                    ];
                }, array_filter(explode(',', $request->input('grouped_products', '')))));
            }
            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.ProductAddedSuccessfully'), $product);
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }
    public function appUpdateProduct(
        ProductRequest $request,
        StoreProductService $service,
        GroupedProductInterface $groupedProductRepository,
        BaseHttpResponse $response,
        ProductVariationInterface $variationRepository,
        ProductVariationItemInterface $productVariationItemRepository,
        StoreProductTagService $storeProductTagService
    ) {
        $customer = Customer::where('id', $request->user_id)->first();
        if ($customer) {
            $id = $request->id;
            $product = $this->productRepository->findOrFail($id);
            $parsedUrl = parse_url(URL::previous());
            if (array_key_exists('query', $parsedUrl)) {
                parse_str($parsedUrl['query'], $query);
                $findProduct = ProductTranslation::where('ec_products_id',$id)->first();
                if(!empty($findProduct)){
                    $findProduct->delete();
                }
                $pro = new ProductTranslation();
                $pro->lang_code =   $query['ref_lang'];
                $pro->ec_products_id =   $id;
                $pro->name =   $request->name;
                $pro->description =   $request->description ? $request->description : '';
                $pro->content =   $request->content ? $request->content : '';
                $pro->save();

            }else{
                $product = $service->execute($request, $product);
                $storeProductTagService->execute($request, $product);

                $variationRepository
                    ->getModel()
                    ->where('configurable_product_id', $product->id)
                    ->update(['is_default' => 0]);

                $defaultVariation = $variationRepository->findById($request->input('variation_default_id'));
                if ($defaultVariation) {
                    $defaultVariation->is_default = true;
                    $defaultVariation->save();
                }

                $addedAttributes = $request->input('added_attributes', []);

                if ($request->input('is_added_attributes') == 1 && $addedAttributes) {
                    $result = $variationRepository->getVariationByAttributesOrCreate($id, $addedAttributes);

                    /**
                     * @var Collection $variation
                     */
                    $variation = $result['variation'];

                    foreach ($addedAttributes as $attribute) {
                        $productVariationItemRepository->createOrUpdate([
                            'attribute_id' => $attribute,
                            'variation_id' => $variation->id,
                        ]);
                    }

                    $variation = $variation->toArray();
                    $variation['variation_default_id'] = $variation['id'];

                    $product->productAttributeSets()->sync(array_keys($addedAttributes));

                    $variation['sku'] = $product->sku;
                    $variation['auto_generate_sku'] = true;

                    $this->postSaveAllVersions([$variation['id'] => $variation], $variationRepository, $product->id, $response);
                } elseif ($product->variations()->count() === 0) {
                    $product->productAttributeSets()->detach();
                    $product->productAttributes()->detach();
                }

                if ($request->has('grouped_products')) {
                    $groupedProductRepository->createGroupedProducts($product->id, array_map(function ($item) {
                        return [
                            'id'  => $item,
                            'qty' => 1,
                        ];
                    }, array_filter(explode(',', $request->input('grouped_products', '')))));
                }

                $relatedProductIds = $product->variations()->pluck('product_id')->all();

                $this->productRepository->update([['id', 'IN', $relatedProductIds]], ['status' => $product->status]);
            }
            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.ProductUpdatedSuccessfully'), $product);
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }

    }

    public function appDeleteProduct(Request $request)
    {
        $customer = Customer::where('id', $request->user_id)->first();
        if ($customer) {
            $product = Product::find($request->id);
            $variation = ProductVariation::where('product_id', $product->id)->first();
            if ($variation) {
                $variation->delete();
            }

            $productVariations = ProductVariation::where('configurable_product_id', $product->id)->get();
            foreach ($productVariations as $productVariation) {
                $productVariation->delete();
            }
            $product->categories()->detach();
            $product->productAttributeSets()->detach();
            $product->productAttributes()->detach();
            $product->productCollections()->detach();
            $product->discounts()->detach();
            $product->crossSales()->detach();
            $product->upSales()->detach();
            $product->groupedProduct()->detach();

            Review::where('product_id', $product->id)->delete();

            if (is_plugin_active('language-advanced')) {
                $product->translations()->delete();
            }
            $product->delete();
            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.ProductDeletedSuccessfully'), 'Product Deleted Successfully!');
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function appProductsList(Request $request){
        $customer = Customer::where('id', $request->user_id)->first();
        if ($customer) {
            $store = Store::where('customer_id',$customer->id)->first();
            $products = Product::where('store_id',$store->id)
                ->with('products')
                ->paginate(10);
            return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.ProductsList'), $products);
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }

    public function appCategories(Request $request){
        $categories = Categories::where('status','published')
            ->paginate(10);
        return returnResponse(true, 200, '', __('alias.controller.auth.apAuthController.ProductsList'), $categories);
    }

    public function appCreateUpdateShop(Request $request){
        $customer = Customer::where('id', $request->user_id)->first();
        if ($customer) {
            $store = Store::where('customer_id',$customer->id)->first();
            if ($store){
                $store->name=  isset($request->shop_name) ? $request->shop_name : $store->name;
                $store->phone= isset($request->shop_phone) ? $request->shop_phone : $store->phone;
                $store->email= isset($request->shop_email) ?$request->shop_email : $store->email;
                $store->address= isset($request->address) ? $request->address : $store->address;
                $store->country= isset($request->country) ? $request->country : $store->country;
                $store->state= isset($request->state) ? $request->state : $store->state;
                $store->city= isset($request->city) ? $request->city : $store->city;
                $store->description= isset($request->description) ? $request->description : $store->description;
                $store->content= isset($request->content) ? $request->content :  $store->content;
                if ($request->hasFile('logo')) {
                    $imagePath = $request->file('logo')->store('stores', 'public');
                    $store->logo = $imagePath ;
                }
                $store->update();

                return returnResponse(true, 201, '', __('alias.controller.auth.apAuthController.ProductsListUpdate'), $store);

            } else {
                $existing = SlugHelper::getSlug($request->input('shop_url'), SlugHelper::getPrefix(\Botble\Marketplace\Models\Store::class), Store::class);
                if ($existing) {
                    return returnResponse(true, 401, '', __('Shop URL is existing. Please choose another one!'));
                } else {
                    $store =  Store::create([
                        'name'=> $request->input('shop_name'),
                        'phone'=> $request->input('shop_phone'),
                        'email'=> $request->input('shop_email'),
                        'address'=> $request->input('address'),
                        'country'=> $request->input('country'),
                        'state'=> $request->input('state'),
                        'city'=> $request->input('city'),
                        'description'=> $request->input('description'),
                        'content'=> $request->input('content'),
                        'customer_id' => $customer->id,
                        'status'=> 'published',
                    ]);
                    Slug::create([
                        'reference_type' => Store::class,
                        'reference_id'   => $store->id,
                        'key'            => Str::slug($request->input('shop_url')),
                        'prefix'         => SlugHelper::getPrefix(Store::class),
                    ]);
                    if ($request->hasFile('logo')) {
                        $imagePath = $request->file('logo')->store('stores', 'public');
                        $store->logo = $imagePath ;
                        $store->update();
                    }
                    $customer->is_vendor = true;
                    $customer->update();
                }
            }
            return returnResponse(true, 201, '', __('alias.controller.auth.apAuthController.ProductsListUpdate'), $store);
        } else {
            return returnResponse(false, 401, '', __('alias.controller.auth.apAuthController.userNotFound'));
        }
    }



}

