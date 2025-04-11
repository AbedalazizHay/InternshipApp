<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasManyThrough;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable, HasApiTokens;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'first_name',
        'last_name',
        'email',
        'password',
        'phone_number',
        'date_of_birth',
        'gender',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }
    public function institution() :BelongsTo
    {
        return $this->belongsTo(Institution::class);
    }
    public function academicLevel():BelongsTo
    {
        return $this->belongsTo(Academic_level::class);
    }
    public function userBatches(): User|HasMany
    { return $this->hasMany(User_Batch::class); }
    public function tracks(): BelongsToMany
    { return $this->belongsToMany(Track::class, 'user__batches'); }
    public function batches(): BelongsToMany
    { return $this->belongsToMany(Batch::class, 'user__batches'); }
    public function payments(): HasManyThrough|User
    { return $this->hasManyThrough(Payment::class, User_Batch::class); }

}
