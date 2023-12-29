<?php

namespace App\Http\Controllers\SwaggerDocument;


class OrderController extends Controller {


    /**
     * @OA\Post(
     *      path="/appOrderHistory",
     *      operationId="appOrderHistory",
     *      tags={"Auth"},
     *      summary="Order History",
     *      description="Return order history array",
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
     *          description="Order History list",
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
     *      path="/appOrderCreate",
     *      operationId="appOrderCreate",
     *      tags={"Auth"},
     *      summary="Order create",
     *      description="return string",
     *      @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *            @OA\Schema(
     *                 type="object",
     *                 @OA\Property(
     *                     property="user_id",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="customer_id",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="amount",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="shipping_amount",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="discount_amount",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="tax_amount",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="shipping_option",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="coupon_code",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="discount_description",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="store_id",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="product_id",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="qty",
     *                     type="string",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Order Created Successfully.",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *          response=422,
     *          description="Unprocessable Entity",
     *         @OA\JsonContent(ref="#")
     *      ),
     * )
     */

    /**
     * @OA\Post(
     *      path="/downloadInvoice",
     *      operationId="downloadInvoice",
     *      tags={"Auth"},
     *      summary="Download Invoice",
     *      description="Return invoice pdf",
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
     *                     property="order_id",
     *                     type="integer",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Download Invoice",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *         response=422,
     *         description="Unprocessable Entity",
     *         @OA\JsonContent(ref="#")
     *      ),
     *     )
     */

     /**
     * @OA\Post(
     *      path="/orderPlacedConfirmation",
     *      operationId="orderPlacedConfirmation",
     *      tags={"Auth"},
     *      summary="Order Placed Confirmation",
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
     *                 ),
     *                 @OA\Property(
     *                     property="order_id",
     *                     type="integer",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Order Placed Confirmation",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *         response=422,
     *         description="Unprocessable Entity",
     *         @OA\JsonContent(ref="#")
     *      ),
     *     )
     */

     /**
     * @OA\Post(
     *      path="/orderHistoryDetails",
     *      operationId="orderHistoryDetails",
     *      tags={"Auth"},
     *      summary="Order History Details",
     *      description="Return order history detail array",
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
     *                     property="order_id",
     *                     type="integer",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Order History Details",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *         response=422,
     *         description="Empty list",
     *         @OA\JsonContent(ref="#")
     *      ),
     *     )
     */

     

}
