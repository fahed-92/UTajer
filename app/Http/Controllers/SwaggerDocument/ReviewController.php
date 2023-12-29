<?php

namespace App\Http\Controllers\SwaggerDocument;


class ReviewController extends Controller {


    /**
     * @OA\Post(
     *      path="/addReview",
     *      operationId="addReview",
     *      tags={"Auth"},
     *      summary="Add Review",
     *      description="Return String",
     *      @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 @OA\Property(
     *                     property="customer_id",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="product_id",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="star",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="comment",
     *                     type="string",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Added Review Successfully",
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
     *      path="/productReviewList",
     *      operationId="productReviewList",
     *      tags={"Auth"},
     *      summary="Product Review List",
     *      description="return array",
     *      @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *            @OA\Schema(
     *                 type="object",
     *                 @OA\Property(
     *                     property="customer_id",
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
     *          description="Product Review list.",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *          response=422,
     *          description="Unprocessable Entity",
     *         @OA\JsonContent(ref="#")
     *      ),
     * )
     */
}
