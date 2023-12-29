<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColumnsServicesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('ec_services', function (Blueprint $table) {
            $table->tinyInteger('price_type')->nullable();
            $table->tinyInteger('service_type')->nullable();
            $table->integer('category_id')->nullable();
            $table->string('country')->nullable();
            $table->string('state')->nullable();
            $table->string('city')->nullable();

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('ec_services', function (Blueprint $table) {
            $table->dropColumn('price_type');
            $table->dropColumn('service_type');
            $table->dropColumn('category_id');
            $table->dropColumn('country');
            $table->dropColumn('state');
            $table->dropColumn('city');
        });
    }
}
