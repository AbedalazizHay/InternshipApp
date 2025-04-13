<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class TrackSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('tracks')->insert([
            [
                'id' => 1,
                'name' => 'Web Development',
                'description' => 'Build, test, maintain websites',
                'code' => 'WD',
                'is_active' => true,
                'max_students' => 100,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 2,
                'name' => 'Mobile Development',
                'description' => 'Develop apps for mobile',
                'code' => 'MD',
                'is_active' => true,
                'max_students' => 100,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 3,
                'name' => 'Quality Assurance',
                'description' => 'Test, report, fix bugs',
                'code' => 'QA',
                'is_active' => true,
                'max_students' => 100,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 4,
                'name' => 'Project Management',
                'description' => 'Plan, track, deliver projects',
                'code' => 'PM',
                'is_active' => true,
                'max_students' => 100,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 5,
                'name' => 'Data Science',
                'description' => 'Analyze data, generate insights',
                'code' => 'DS',
                'is_active' => true,
                'max_students' => 100,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 6,
                'name' => 'Cyber Security',
                'description' => 'Protect systems, monitor threats',
                'code' => 'CS',
                'is_active' => true,
                'max_students' => 100,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
        ]);
    }
}
