<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Batch extends Model
{
    use HasFactory;

    protected $fillable =[
        'track_id',
        'name',
        'start_date',
        'end_date',
        'max_students',
        'is_active',
    ];

    public function tracks():HasMany
    {
        return$this->HasMany(Track::class);
    }
}
