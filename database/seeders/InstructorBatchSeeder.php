<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class InstructorBatchSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('instructor__batches')->insert([
            [
                'id' => 1,
                'batch_id' => 1,
                'user_id' => 3,
                'assigned_date' => '2023-01-01 00:00:00',
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 2,
                'batch_id' => 2,
                'user_id' => 3,
                'assigned_date' => '2023-06-01 00:00:00',
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 3,
                'batch_id' => 3,
                'user_id' => 3,
                'assigned_date' => '2023-11-01 00:00:00',
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
        ]);
    }
}
