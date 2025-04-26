<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Academic_level extends Model
{ use HasFactory;
     protected $fillable=[
         'name',
         'is_active',
     ];
}
