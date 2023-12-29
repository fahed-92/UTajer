<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddTokenColumnsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('ec_service_booking', function (Blueprint $table) {
            $table->string('token')->nullable();
            $table->string('coupon_code',50)->nullable();
            $table->float('amount')->default(0.00);
            $table->float('discount_amount')->default(0.00);
            $table->float('tax')->default(0.00);
            $table->float('sub_total')->default(0.00);

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('ec_service_booking', function (Blueprint $table) {
            $table->dropColumn('token');
            $table->dropColumn('coupon_code');
            $table->dropColumn('amount');
            $table->dropColumn('discount_amount');
            $table->dropColumn('tax');
            $table->dropColumn('sub_total');
        });
    }
}
