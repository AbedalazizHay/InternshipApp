<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Payment_method extends Model
{
    use HasFactory;

    protected $fillable =[
        'payment_id',
        'type',
        'details',
    ];
    public function payment():BelongsTo
    {
        return $this->belongsTo(Payment::class);
    }
}
