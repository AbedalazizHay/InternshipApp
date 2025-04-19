<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
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

    public function paymentMethod(): BelongsTo
    {
        return $this->BelongsTo(Payment_method::class);
    }
    public function userBatches(): Payment|HasMany
    {
        return $this->hasMany(User_Batch::class);
    }
}
