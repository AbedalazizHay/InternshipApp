<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class BatchSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('batches')->insert([
            [
                'id' => 1,
                'name' => 'X-1',
                'start_date' => '2023-01-01 00:00:00',
                'end_date' => '2023-05-31 00:00:00',
                'max_students' => 50,
                'is_active' => false,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 2,
                'name' => 'X-2',
                'start_date' => '2023-01-01 00:00:00',
                'end_date' => '2023-05-31 00:00:00',
                'max_students' => 50,
                'is_active' => false,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 3,
                'name' => 'X-3',
                'start_date' => '2023-01-01 00:00:00',
                'end_date' => '2023-05-31 00:00:00',
                'max_students' => 50,
                'is_active' => false,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 4,
                'name' => 'X-4',
                'start_date' => '2023-01-01 00:00:00',
                'end_date' => '2023-05-31 00:00:00',
                'max_students' => 50,
                'is_active' => false,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 5,
                'name' => 'X-5',
                'start_date' => '2023-01-01 00:00:00',
                'end_date' => '2023-05-31 00:00:00',
                'max_students' => 50,
                'is_active' => false,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 6,
                'name' => 'X-6',
                'start_date' => '2023-01-01 00:00:00',
                'end_date' => '2023-05-31 00:00:00',
                'max_students' => 50,
                'is_active' => false,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 7,
                'name' => 'X-7',
                'start_date' => '2023-01-01 00:00:00',
                'end_date' => '2023-05-31 00:00:00',
                'max_students' => 50,
                'is_active' => true,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
        ]);
    }
}
