<?php

namespace App\Http\Controllers\SwaggerDocument;


class BasicInfoController extends Controller {

    /**
     * @OA\Get(
     *      path="/common-info",
     *      operationId="Common Info",
     *      tags={"Basic Info"},
     *      summary="Basic information of User",
     *      description="Return basic info of panel data data",
     *      @OA\Response(
     *          response=200,
     *          description="Basic Info Data.",
     *         @OA\JsonContent(ref="#")
     *      ),
     * )
     */

}
