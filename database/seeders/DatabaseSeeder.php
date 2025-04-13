<?php

namespace Database\Seeders;

use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->call([
            AcademicLevelSeeder::class,
            InstitutionSeeder::class,
            TrackSeeder::class,
            BatchSeeder::class,
            PaymentMethodSeeder::class,
            PaymentSeeder::class,
            UserSeeder::class,
            UserBatchSeeder::class,
            InstructorBatchSeeder::class,
        ]);
    }

}
