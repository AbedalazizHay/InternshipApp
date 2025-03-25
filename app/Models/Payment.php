<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Payment extends Model
{
    use HasFactory;

    protected $fillable = [
        'payment_method_id',
        'amount',
        'status',
        'payment_reference',
        'payment_date',
        'payment_type',
        'notes',
    ];

    public function paymentMethod():HasOne
    {
        return $this->HasOne(Payment::class);
    }
}
