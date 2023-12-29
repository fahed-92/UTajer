<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVendorPayoutTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('mp_payout', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id')->nullable();
            $table->string('stripe_account',70)->nullable();
            $table->string('bank_token')->nullable();
            $table->string('bank_account')->nullable();
            $table->string('account_type')->nullable();
            $table->longText('bank_information')->nullable();
            $table->double('balance','',2)->default(0.00);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('mp_payout');
    }
}
