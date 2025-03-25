<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('user__batches', function (Blueprint $table) {
             $table->foreignId('user_id')->constrained('users');
             $table->foreignId('batch_id')->constrained('batches');
             $table->foreignId('track_id')->constrained('tracks');
             $table->foreignId('payment_id')->constrained('payments');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('user__batches', function (Blueprint $table) {
            //
        });
    }
};
