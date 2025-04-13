<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PaymentSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('payments')->insert([
            [
                'id' => 1,
                'payment_method_id' => 2,
                'amount' => 100,
                'status' => 'approved',
                'payment_reference' => 'images/payment_9774.png',
                'payment_date' => '2023-04-09',
                'payment_type' => 'registration Fee',
                'notes' => 'paid through visa',
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 2,
                'payment_method_id' => 2,
                'amount' => 50,
                'status' => 'approved',
                'payment_reference' => 'images/payment_9890.png',
                'payment_date' => '2023-09-17',
                'payment_type' => 'registration Fee',
                'notes' => 'paid through visa',
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
        ]);
    }
}
