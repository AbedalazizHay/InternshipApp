<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
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

    public function tracks(): BelongsToMany
    {
        return $this->belongsToMany(Track::class, 'batch_track');
    }
    public function userBatches()
    {
        return $this->hasMany(User_Batch::class);
    }



}
