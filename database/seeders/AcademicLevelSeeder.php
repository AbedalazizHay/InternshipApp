<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AcademicLevelSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('academic_levels')->insert([
            [
                'id' => 1,
                'name' => 'School',
                'is_active' => true,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 2,
                'name' => 'Freshman',
                'is_active' => true,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 3,
                'name' => 'Junior',
                'is_active' => true,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 4,
                'name' => 'Sophmore',
                'is_active' => true,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 5,
                'name' => 'Senior',
                'is_active' => true,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
        ]);
    }
}
