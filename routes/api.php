<?php

use App\Http\Controllers\Api\BatchController;
use App\Http\Controllers\Api\RegisterController;
use App\Http\Controllers\Api\TrackController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\InstitutionController;
use App\Http\Controllers\Api\AcademicLevelController;

Route::post('/register', [RegisterController::class,'registerUser']);
Route::post('/login', [RegisterController::class,'loginUser']);

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

// routes/api.php


Route::get('/institutions', [InstitutionController::class, 'index']);
Route::get('/academic-levels', [AcademicLevelController::class, 'index']);
Route::post('/institutions', [InstitutionController::class, 'store']);
Route::post('/academic-levels', [AcademicLevelController::class, 'store']);