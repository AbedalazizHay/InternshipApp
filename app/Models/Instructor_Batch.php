<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Instructor_Batch extends Model
{
    use HasFactory;
    protected $fillable = [
        'batch_id',
        'instructor_id',
        'assigned_date',
    ];
    public function user():BelongsTo
    {
        return $this->belongsTo(User::class);
    }
    public function batch():BelongsTo
    {
        return $this->belongsTo(Batch::class);
    }
}
