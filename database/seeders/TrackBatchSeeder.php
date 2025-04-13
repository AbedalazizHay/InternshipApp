<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class TrackBatchSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('track_batch')->insert([
            [
                'id' => 1,
                'track_id' => 1,
                'batch_id' => 1,
            ],
            [
                'id' => 2,
                'track_id' => 2,
                'batch_id' => 1,
            ],
            [
                'id' => 3,
                'track_id' => 3,
                'batch_id' => 1,
            ],
            [
                'id' => 4,
                'track_id' => 4,
                'batch_id' => 1,
            ],
            [
                'id' => 5,
                'track_id' => 5,
                'batch_id' => 1,
            ],
            [
                'id' => 6,
                'track_id' => 6,
                'batch_id' => 1,
            ],
        ]);
    }
}
