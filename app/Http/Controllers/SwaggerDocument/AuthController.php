<?php

namespace App\Http\Controllers\SwaggerDocument;


class AuthController extends Controller {


    /**
     * @OA\Post(
     *      path="/appLogin",
     *      operationId="appLogin",
     *      tags={"Auth"},
     *      summary="Authenticate User",
     *      description="Return auth user data",
     *      @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 @OA\Property(
     *                     property="email",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="password",
     *                     type="string",
     *                 ),
     *              @OA\Property(
     *                     property="device_token",
     *                     type="string",
     *                 ),
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Login Success",
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
     *      path="/appRegister",
     *      operationId="appRegister",
     *      tags={"Auth"},
     *      summary="Register User",
     *      description="Return auth user data",
     *     @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 @OA\Property(
     *                     property="name",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="username",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="email",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="phone",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="password",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="password_confirmation",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="role",
     *                     type="integer",
     *                 ),
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="User registered.",
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
     *      path="/reset-password",
     *      operationId="reset-password",
     *      tags={"Auth"},
     *      summary="Reset PAssword",
     *      description="return string",
     *      @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 @OA\Property(
     *                     property="email",
     *                     type="string",
     *                 ),
     *             @OA\Property(
     *                     property="new_password",
     *                     type="string",
     *                 ),
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Password reset successfully.",
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
     *      path="/register-mail-otp",
     *      operationId="register-mail-otp",
     *      tags={"Auth"},
     *      summary="Register Mail Otp",
     *      description="return string",
     *      @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 @OA\Property(
     *                     property="email",
     *                     type="string",
     *                 ),
     *               @OA\Property(
     *                     property="registered_user",
     *                     type="string",
     *                 ),
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Register Otp Send Successfully.",
     *         @OA\JsonContent(ref="#")
     *       ),
     * )
     */

    /**
     * @OA\Post(
     *      path="/register-mail-otp-verify",
     *      operationId="register-mail-otp-verify",
     *      tags={"Auth"},
     *      summary="Register Mail Otp Verify",
     *      description="return string",
     *      @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 @OA\Property(
     *                     property="email",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="otp",
     *                     type="string",
     *                 ),
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Register Otp Verified Successfully.",
     *         @OA\JsonContent(ref="#")
     *       ),
     * )
     */
    /**
     * @OA\Post(
     *      path="/appLogout",
     *      operationId="appLogout",
     *      tags={"Auth"},
     *      summary="Logout User",
     *      description="Return auth user data",
     *      @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 @OA\Property(
     *                     property="email",
     *                     type="string",
     *                 ),
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Logout Success",
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
     *      path="/appChangePasword",
     *      operationId="appChangePasword",
     *      tags={"Auth"},
     *      summary="Change Password",
     *      description="return string",
     *      @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 @OA\Property(
     *                     property="email",
     *                     type="string",
     *                 ),
     *             @OA\Property(
     *                     property="old_password",
     *                     type="string",
     *                 ),
     *              @OA\Property(
     *                     property="new_password",
     *                     type="string",
     *                 ),
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="User password changed successfully.",
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
     *      path="/getInfo",
     *      operationId="getInfo",
     *      tags={"Auth"},
     *      summary="Basic information of User",
     *      description="return string",
     *      @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 @OA\Property(
     *                     property="id",
     *                     type="string",
     *                 ),
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Basic information of User",
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
     *      path="/editUserInfo",
     *      operationId="editUserInfo",
     *      tags={"Auth"},
     *      summary="Edit User Info",
     *      description="Return auth user data",
     *     @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 @OA\Property(
     *                     property="name",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="first_name",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="last_name",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="phone",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="gender",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="job",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="dob",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="business_name",
     *                     type="string",
     *                 ),
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Update User info Successfully",
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
     *      path="/appChangeLang",
     *      operationId="appChangeLang",
     *      tags={"Auth"},
     *      summary="change Language",
     *      description="return string",
     *      @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 @OA\Property(
     *                     property="id",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="lang",
     *                     type="string",
     *                 ),
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Language changed Successfully.",
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
     *      path="/accountSetting",
     *      operationId="accountSetting",
     *      tags={"Auth"},
     *      summary="Account Setting",
     *      description="return array",
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
     *          description="Update Account Setting Successfully.",
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
     *      path="/userWishList",
     *      operationId="userWishList",
     *      tags={"Auth"},
     *      summary="User Wish List",
     *      description="return array",
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
     *          description="User Wish List.",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *          response=422,
     *          description="Empty array",
     *         @OA\JsonContent(ref="#")
     *      ),
     * )
     */

     /**
     * @OA\Post(
     *      path="/userCartList",
     *      operationId="userCartList",
     *      tags={"Auth"},
     *      summary="User Cart",
     *      description="return array",
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
     *          description="User Cart list.",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *          response=422,
     *          description="Empty array",
     *         @OA\JsonContent(ref="#")
     *      ),
     * )
     */

     /**
     * @OA\Post(
     *      path="/faq",
     *      operationId="faq",
     *      tags={"Auth"},
     *      summary="FAQ",
     *      description="return array",
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
     *          description="FAQ",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *          response=422,
     *          description="Empty array",
     *         @OA\JsonContent(ref="#")
     *      ),
     * )
     */

     /**
     * @OA\Post(
     *      path="/contact_us",
     *      operationId="contact_us",
     *      tags={"Auth"},
     *      summary="Contact Us",
     *      description="return string",
     *      @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 type="object",
     *                 @OA\Property(
     *                     property="email",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="subject",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="content",
     *                     type="string",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Your query has been submitted",
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
     *      path="/addBillingAddress",
     *      operationId="addBillingAddress",
     *      tags={"Auth"},
     *      summary="add Billing address",
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
     *                 ),
     *                 @OA\Property(
     *                     property="country",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="state",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="city",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="zip_code",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="address",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="type",
     *                     type="integer",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Added address Successfully.",
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
     *      path="/editBillingAddress",
     *      operationId="editBillingAddress",
     *      tags={"Auth"},
     *      summary="Edit Billing Address",
     *      description="return string",
     *      @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *            @OA\Schema(
     *                 type="object",
     *                 @OA\Property(
     *                     property="address_id",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="user_id",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="country",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="state",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="city",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="zip_code",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="address",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="type",
     *                     type="integer",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Updated Address Successfully",
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
     *      path="/deleteBillingAddress",
     *      operationId="deleteBillingAddress",
     *      tags={"Auth"},
     *      summary="Delete Billing Address",
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
     *                 ),
     *                 @OA\Property(
     *                     property="address_id",
     *                     type="integer",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Deleted Address Successfully",
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
     *      path="/listBillingAddress",
     *      operationId="listBillingAddress",
     *      tags={"Auth"},
     *      summary="List of Billing Address",
     *      description="return array",
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
     *                     property="type",
     *                     type="integer",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="List of Billing Addresses",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *          response=422,
     *          description="Empty array",
     *         @OA\JsonContent(ref="#")
     *      ),
     * )
     */

     /**
     * @OA\Post(
     *      path="/addDefaultBillingAddress",
     *      operationId="addDefaultBillingAddress",
     *      tags={"Auth"},
     *      summary="Add Default Billing Address",
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
     *                 ),
     *                 @OA\Property(
     *                     property="type",
     *                     type="integer",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Changed Default Billing Address Successfully.",
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
     *      path="/appUploadDoc",
     *      operationId="appUploadDoc",
     *      tags={"Auth"},
     *      summary="Upload Document",
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
     *                 ),
     *                 @OA\Property(
     *                     property="validity_date",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="doc_photo1",
     *                     type="file",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Upload Document Successfully",
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
     *      path="/addUserCardDetails",
     *      operationId="addUserCardDetails",
     *      tags={"Auth"},
     *      summary="add User Card Details",
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
     *                 ),
     *                 @OA\Property(
     *                     property="card_no",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="name",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="expires_on",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="cvv",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="type",
     *                     type="string",
     *                 ),
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Added User Card Details Successfully.",
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
     *      path="/editUserCardDetails",
     *      operationId="editUserCardDetails",
     *      tags={"Auth"},
     *      summary="Edit Billing Address",
     *      description="return string",
     *      @OA\RequestBody(
     *         description="Input data format",
     *         @OA\MediaType(
     *             mediaType="application/json",
     *            @OA\Schema(
     *                 type="object",
     *                 @OA\Property(
     *                     property="card_id",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="user_id",
     *                     type="integer",
     *                 ),
     *                 @OA\Property(
     *                     property="card_no",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="name",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="expires_on",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="cvv",
     *                     type="string",
     *                 ),
     *                 @OA\Property(
     *                     property="type",
     *                     type="string",
     *                 ),
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Updated Card Details Successfully",
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
     *      path="/deleteUserCardDetails",
     *      operationId="deleteUserCardDetails",
     *      tags={"Auth"},
     *      summary="Delete User Card Details",
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
     *                 ),
     *                 @OA\Property(
     *                     property="card_id",
     *                     type="integer",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Deleted Card Details Successfully",
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
     *      path="/listUserCardDetails",
     *      operationId="listUserCardDetails",
     *      tags={"Auth"},
     *      summary="List of Card Detail",
     *      description="return array",
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
     *          description="List of Card Details",
     *         @OA\JsonContent(ref="#")
     *       ),
     *      @OA\Response(
     *          response=422,
     *          description="Empty array",
     *         @OA\JsonContent(ref="#")
     *      ),
     * )
     */

     /**
     * @OA\Post(
     *      path="/addDefaultUserCardDetails",
     *      operationId="addDefaultUserCardDetails",
     *      tags={"Auth"},
     *      summary="Add Default Card Details",
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
     *                 ),
     *                 @OA\Property(
     *                     property="card_id",
     *                     type="integer",
     *                 )
     *             )
     *         )
     *      ),
     *      @OA\Response(
     *          response=200,
     *          description="Changed Default User Card Successfully.",
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
