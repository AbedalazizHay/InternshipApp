<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('users')->insert(values: [
            [
                'id' => 1,
                'first_name' => 'Sarah',
                'last_name' => 'Chang',
                'email' => 'sarah.chang@gmail.com',
                'password' => Hash::make('NtIxqr4_&0'),
                'phone_number' => '961761679215',
                'date_of_birth' => '1994-10-31',
                'gender' => 'female',
                'role' => 'student',
                'status' => 'inactive',
                'has_paid' => true,
                'institution_id' => 1,
                'academic_level_id' => 3,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 2,
                'first_name' => 'Angela',
                'last_name' => 'Jefferson',
                'email' => 'angela.jefferson@gmail.com',
                'password' => Hash::make('^7Z3SKR%td'),
                'phone_number' => '961767007071',
                'date_of_birth' => '2001-01-26',
                'gender' => 'female',
                'role' => 'student',
                'status' => 'active',
                'has_paid' => true,
                'institution_id' => 2,
                'academic_level_id' => 3,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 3,
                'first_name' => 'Ali',
                'last_name' => 'Nasser',
                'email' => 'ali@gmail.com',
                'password' => Hash::make('12345678'),
                'phone_number' => '961767007071',
                'date_of_birth' => '2001-01-26',
                'gender' => 'male',
                'role' => 'admin',
                'status' => 'active',
                'has_paid' => true,
                'institution_id' => 3,
                'academic_level_id' => 3,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
            [
                'id' => 4,
                'first_name' => 'Carla',
                'last_name' => 'Manny',
                'email' => 'carla.manny@gmail.com',
                'password' => Hash::make('^7Z3SKR%td'),
                'phone_number' => '961767007871',
                'date_of_birth' => '2001-01-26',
                'gender' => 'female',
                'role' => 'instructor',
                'status' => 'active',
                'has_paid' => true,
                'institution_id' => 4,
                'academic_level_id' => 3,
                'created_at' => '2025-04-12 17:00:00',
                'updated_at' => '2025-04-12 17:00:00',
            ],
        ]);
    }
}
