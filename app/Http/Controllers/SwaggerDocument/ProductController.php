<?php

namespace App\Http\Controllers\SwaggerDocument;


class ProductController extends Controller {


     /**
     * @OA\Post(
     *      path="/appProductListing",
     *      operationId="appProductListing",
     *      tags={"Auth"},
     *      summary="Product List",
     *      description="Return array product list",
     *      @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 @OA\Property(
     *                     property="user_id",
     *                     type="integer",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Product list",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *         response=422,
     *         description="Empty list",
     *         @OA\JsonContent(ref="#")
     *      ),
     *     )
     */

     

     /**
     * @OA\Post(
     *      path="/productCategories",
     *      operationId="productCategories",
     *      tags={"Auth"},
     *      summary="Product Categories",
     *      description="Return array product Categories list",
     *      @OA\RequestBody(
     *         description="Input data format",
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Product Category list",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *         response=422,
     *         description="Empty list",
     *         @OA\JsonContent(ref="#")
     *      ),
     *     )
     */

     /**
     * @OA\Post(
     *      path="/subCategories",
     *      operationId="subCategories",
     *      tags={"Auth"},
     *      summary="Sub Categories",
     *      description="Return array",
     *      @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 @OA\Property(
     *                     property="category_id",
     *                     type="integer",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="List of Sub categories.",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *         response=422,
     *         description="Empty list",
     *         @OA\JsonContent(ref="#")
     *      ),
     *     )
     */

     /**
     * @OA\Post(
     *      path="/categorySearch",
     *      operationId="categorySearch",
     *      tags={"Auth"},
     *      summary="Categories Search",
     *      description="Return array",
     *      @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 @OA\Property(
     *                     property="category",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="search",
     *                     type="string",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Search Result",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *         response=422,
     *         description="Empty list",
     *         @OA\JsonContent(ref="#")
     *      ),
     *     )
     */

     /**
     * @OA\Post(
     *      path="/productSubCategories",
     *      operationId="productSubCategories",
     *      tags={"Auth"},
     *      summary="Product Sub Categories",
     *      description="Return array product sub categories list",
     *      @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 @OA\Property(
     *                     property="category_id",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="user_id",
     *                     type="integer",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Product Sub-Category list",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *         response=422,
     *         description="Empty list",
     *         @OA\JsonContent(ref="#")
     *      ),
     *     )
     */


     /**
     * @OA\Post(
     *      path="/similarProducts",
     *      operationId="similarProducts",
     *      tags={"Auth"},
     *      summary="Similar Product List",
     *      description="Return array Similar product list",
     *      @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 @OA\Property(
     *                     property="product_id",
     *                     type="integer",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Similar Product list",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *         response=422,
     *         description="Empty list",
     *         @OA\JsonContent(ref="#")
     *      ),
     *     )
     */

     /**
     * @OA\Post(
     *      path="/appProductDetail",
     *      operationId="appProductDetail",
     *      tags={"Auth"},
     *      summary="Product Details",
     *      description="Return object of product detail",
     *      @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 @OA\Property(
     *                     property="user_id",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="product_id",
     *                     type="integer",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Product Detail",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *         response=422,
     *         description="Empty list",
     *         @OA\JsonContent(ref="#")
     *      ),
     *     )
     */

     /**
     * @OA\Post(
     *      path="/appProductFav",
     *      operationId="appProductFav",
     *      tags={"Auth"},
     *      summary="Add to Favourites list",
     *      description="Return string",
     *      @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 @OA\Property(
     *                     property="user_id",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="product_id",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="is_fav",
     *                     type="integer",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Add to Favourites",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *         response=422,
     *         description="User not found",
     *         @OA\JsonContent(ref="#")
     *      ),
     *     )
     */

     /**
     * @OA\Post(
     *      path="/addToCart",
     *      operationId="addToCart",
     *      tags={"Auth"},
     *      summary="Add to cart ",
     *      description="Return string",
     *      @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 @OA\Property(
     *                     property="user_id",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="product_id",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="quantity",
     *                     type="integer",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Add to Cart",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *         response=422,
     *         description="User not found",
     *         @OA\JsonContent(ref="#")
     *      ),
     *     )
     */

     /**
     * @OA\Post(
     *      path="/editCart",
     *      operationId="editCart",
     *      tags={"Auth"},
     *      summary="Edit cart ",
     *      description="Return string",
     *      @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 @OA\Property(
     *                     property="user_id",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="product_id",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="quantity",
     *                     type="integer",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Update Cart Successfully",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *         response=422,
     *         description="User not found",
     *         @OA\JsonContent(ref="#")
     *      ),
     *     )
     */

     /**
     * @OA\Post(
     *      path="/removeFromCart",
     *      operationId="removeFromCart",
     *      tags={"Auth"},
     *      summary="Remove from cart ",
     *      description="Return string",
     *      @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 @OA\Property(
     *                     property="user_id",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="product_id",
     *                     type="integer",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Remove items from Cart Successfully",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *         response=422,
     *         description="User not found",
     *         @OA\JsonContent(ref="#")
     *      ),
     *     )
     */


     /**
     * @OA\Post(
     *      path="/productFilter",
     *      operationId="productFilter",
     *      tags={"Auth"},
     *      summary="Product list ",
     *      description="Return string",
     *      @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 @OA\Property(
     *                     property="user_id",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="end_price",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="start_price",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="brand",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="color",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="category",
     *                     type="string",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Product list",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *         response=422,
     *         description="empty array",
     *         @OA\JsonContent(ref="#")
     *      ),
     *     )
     */

     /**
     * @OA\Post(
     *      path="/productSearch",
     *      operationId="productSearch",
     *      tags={"Auth"},
     *      summary="Product Search ",
     *      description="Return string",
     *      @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 @OA\Property(
     *                     property="user_id",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="search",
     *                     type="string",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Product search result",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *         response=422,
     *         description="empty array",
     *         @OA\JsonContent(ref="#")
     *      ),
     *     )
     */

     /**
     * @OA\Post(
     *      path="/productFilterTags",
     *      operationId="productFilterTags",
     *      tags={"Auth"},
     *      summary="Product Filter tags ",
     *      description="Return string",
     *      @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Product Filter tags",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *         response=422,
     *         description="empty array",
     *         @OA\JsonContent(ref="#")
     *      ),
     *     )
     */

     /**
     * @OA\Post(
     *      path="/getProductCharges",
     *      operationId="getProductCharges",
     *      tags={"Auth"},
     *      summary="Product Charges ",
     *      description="return string",
     *      @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 @OA\Property(
     *                     property="user_id",
     *                     type="integer",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Product Charges",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *         response=422,
     *         description="empty array",
     *         @OA\JsonContent(ref="#")
     *      ),
     *     )
     */

     /**
     * @OA\Post(
     *      path="/checkProductDiscount",
     *      operationId="checkProductDiscount",
     *      tags={"Auth"},
     *      summary="Check Discount Price on Product",
     *      description="Return string",
     *      @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 @OA\Property(
     *                     property="user_id",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="promo_code",
     *                     type="string",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Discount Percentage",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *         response=422,
     *         description="empty array",
     *         @OA\JsonContent(ref="#")
     *      ),
     *     )
     */

     /**
     * @OA\Post(
     *      path="/returnProduct",
     *      operationId="returnProduct",
     *      tags={"Auth"},
     *      summary="Return Product",
     *      description="Return string",
     *      @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 @OA\Property(
     *                     property="user_id",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="email",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="subject",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="reason",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="product_id",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="order_id",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="order_date",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="estimate_delivery_date",
     *                     type="string",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Return Product",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *         response=422,
     *         description="error message",
     *         @OA\JsonContent(ref="#")
     *      ),
     *     )
     */

     /**
     * @OA\Post(
     *      path="/returnOrderList",
     *      operationId="returnOrderList",
     *      tags={"Auth"},
     *      summary="Return Order List",
     *      description="Return array",
     *      @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 @OA\Property(
     *                     property="user_id",
     *                     type="integer",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Return Order List",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *         response=422,
     *         description="empty array",
     *         @OA\JsonContent(ref="#")
     *      ),
     *     )
     */

     /**
     * @OA\Post(
     *      path="/addInstructionCart",
     *      operationId="addInstructionCart",
     *      tags={"Auth"},
     *      summary="Add Instruction Cart",
     *      description="Return string",
     *      @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 @OA\Property(
     *                     property="user_id",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="note",
     *                     type="string",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Return string",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *         response=422,
     *         description="string",
     *         @OA\JsonContent(ref="#")
     *      ),
     *     )
     */


     /**
     * @OA\Get(
     *      path="/offers",
     *      operationId="offers",
     *      tags={"Auth"},
     *      summary="Offers",
     *      description="Return array",
     *      @OA\RequestBody(
     *         description="Input data format",
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Return Offers List",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *         response=422,
     *         description="empty array",
     *         @OA\JsonContent(ref="#")
     *      ),
     *     )
     */
     
     /**
     * @OA\Get(
     *      path="/return_policy",
     *      operationId="return_policy",
     *      tags={"Auth"},
     *      summary="Return Policy",
     *      description="Return array",
     *      @OA\RequestBody(
     *         description="Input data format",
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Return array",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *         response=422,
     *         description="empty array",
     *         @OA\JsonContent(ref="#")
     *      ),
     *     )
     */

     /**
     * @OA\Get(
     *      path="/terms_and_conditions",
     *      operationId="terms_and_conditions",
     *      tags={"Auth"},
     *      summary="Terms and Conditions",
     *      description="Return array",
     *      @OA\RequestBody(
     *         description="Input data format",
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Return array",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *         response=422,
     *         description="empty array",
     *         @OA\JsonContent(ref="#")
     *      ),
     *     )
     */

     /**
     * @OA\Get(
     *      path="/offerProducts",
     *      operationId="offerProducts",
     *      tags={"Auth"},
     *      summary="Offer Product list",
     *      description="Return array",
     *      @OA\RequestBody(
     *         description="Input data format",
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Return array",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *         response=422,
     *         description="empty array",
     *         @OA\JsonContent(ref="#")
     *      ),
     *     )
     */

}
