<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class User_Batch extends Model
{
    use HasFactory;

    protected $fillable =[
        'user_id',
        'track_id',
        'payment_id',
        'batch_id',
        'registration_date',
        'status',
    ];
    public function user():BelongsTo
    {
        return $this->belongsTo(User::class);
    }
    public function track(): BelongsTo
    {
        return $this->belongsTo(Track::class);
    }
    public function payment():BelongsTo
    {
        return $this->belongsTo(Payment::class);
    }
    public function batch(): BelongsTo
    {
        return $this->belongsTo(Batch::class);
    }

}
