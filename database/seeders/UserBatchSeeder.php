<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UserBatchSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('user__batches')->insert([
            [
                'id' => 1,
                'user_id' => 2,
                'track_id' => 2,
                'payment_id' => 1,
                'batch_id' => 2,
                'registration_date' => '2023-04-09',
                'status' => 'complete',
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 2,
                'user_id' => 2,
                'track_id' => 1,
                'payment_id' => 1,
                'batch_id' => 2,
                'registration_date' => '2023-04-09',
                'status' => 'complete',
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],

        ]);
    }
}
