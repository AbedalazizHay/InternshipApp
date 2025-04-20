<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\DashboardController;

Route::get('/', fn () => redirect('/login'));

// Auth routes
Route::get('/login', [AuthController::class, 'showLoginForm'])->name('login');
Route::post('/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout'])->name('logout');

// Dashboards
Route::get('/instructor/dashboard', [DashboardController::class, 'instructor'])
    ->middleware('auth')->name('instructor.dashboard');

Route::get('/student/dashboard', [DashboardController::class, 'student'])
    ->middleware('auth')->name('student.dashboard');
