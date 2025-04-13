<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PaymentMethodSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('payment_methods')->insert([
            [
                'id' => 1,
                'type' => 'whish',
                'details' => json_encode(['description' => 'Whish App/Transfer in Store']),
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 2,
                'type' => 'credit',
                'details' => json_encode(['method' => 'Bank Wire']),
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ]
        ]);
    }
}
