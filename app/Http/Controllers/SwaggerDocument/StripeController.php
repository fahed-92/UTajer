<?php

namespace App\Http\Controllers\SwaggerDocument;


class StripeController extends Controller {


    /**
     * @OA\Post(
     *      path="/stripeToken",
     *      operationId="stripeToken",
     *      tags={"Auth"},
     *      summary="Create Stripe Token",
     *      description="Return Array",
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
     *                     property="card_number",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="exp_month",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="exp_year",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="cvc",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="first_name",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="last_name",
     *                     type="string",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Token Created Successfully",
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
     *      path="/stripePost",
     *      operationId="stripePost",
     *      tags={"Auth"},
     *      summary="Payment create",
     *      description="return array",
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
     *                     property="amount",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="stripeToken",
     *                     type="string",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Payment Successfull.",
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
     *      path="/saveData",
     *      operationId="saveData",
     *      tags={"Auth"},
     *      summary="Saved Data",
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
     *                     property="order_id",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="payment_id",
     *                     type="integer",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Data saved Successfully",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *         response=422,
     *         description="Unprocessable Entity",
     *         @OA\JsonContent(ref="#")
     *      ),
     *     )
     */

}
