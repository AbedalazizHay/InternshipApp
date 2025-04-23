<?php

use App\Http\Controllers\Api\RegisterController;
use App\Http\Controllers\BatchController;
use App\Http\Controllers\TrackController;
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
Route::group(['middleware'=>'auth:sanctum'],function(){
    Route::get('/batch/active/{batch}',[BatchController::class, 'active']);
    Route::get('/batch/inactive/{batch}',[BatchController::class,'inactive']);
    Route::post('/createBatch',[BatchController::class,'create']); 

});
Route::group(['middleware'=>'auth:sanctum'],function(){
    // Create new track
    Route::post('/tracks', [TrackController::class, 'create']);

    // List all tracks
    Route::get('/tracks', [TrackController::class, 'index']);

    // Show single track by id
    Route::get('/tracks/{id}', [TrackController::class, 'show']);

});