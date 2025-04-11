<?php

use App\Http\Controllers\Api\RegisterController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::post('/register/user', [RegisterController::class,'registerUser']);
Route::post('/login/user', [RegisterController::class,'loginUser']);

Route::get('/profile',function (Request $request ){
    return response()->json([
        'user' => $request->user()->only([
            'id',
            'first_name',
            'last_name',
            'email',
            'phone_number',
            'gender',
            'date_of_birth',
            'role',
            'status'
        ])
    ]);
})->middleware('auth:sanctum');

Route::post('/logout',[RegisterController::class,'logoutUser'])->middleware('auth:sanctum');
