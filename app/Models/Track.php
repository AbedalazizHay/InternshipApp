<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Track extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'description',
        'code',
        'is_active',
        'max_students'
    ];
    public function availableInBatches(): BelongsToMany
    {
        return $this->belongsToMany(Batch::class, 'batch_track');
    }


}
