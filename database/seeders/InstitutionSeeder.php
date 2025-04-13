<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class InstitutionSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('institutions')->insert([
            [
                'id' => 1,
                'name' => 'American University of Beirut',
                'type' => 'University',
                'is_verified' => true,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 2,
                'name' => 'Lebanese American University',
                'type' => 'University',
                'is_verified' => true,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 3,
                'name' => 'Saint Joseph University',
                'type' => 'University',
                'is_verified' => true,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 4,
                'name' => 'Holy Spirit University of Kaslik',
                'type' => 'University',
                'is_verified' => true,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 5,
                'name' => 'University of Balamand',
                'type' => 'University',
                'is_verified' => true,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 6,
                'name' => 'Beirut Arab University',
                'type' => 'University',
                'is_verified' => true,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 7,
                'name' => 'Notre Dame University-Louaize',
                'type' => 'University',
                'is_verified' => true,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 8,
                'name' => 'University of La Sagesse',
                'type' => 'University',
                'is_verified' => true,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 9,
                'name' => 'Lebanese International University',
                'type' => 'University',
                'is_verified' => true,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 10,
                'name' => 'University of Tripoli',
                'type' => 'University',
                'is_verified' => true,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 11,
                'name' => 'American University of Science And Technology',
                'type' => 'University',
                'is_verified' => true,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 12,
                'name' => 'Haigazian University',
                'type' => 'University',
                'is_verified' => true,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 13,
                'name' => 'Lebanese University',
                'type' => 'University',
                'is_verified' => true,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ]

        ]);
    }
}
