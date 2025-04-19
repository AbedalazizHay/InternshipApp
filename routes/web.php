<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

// Login form
Route::get('/login', function () {
    return view('auth.login');
})->name('login');

// Handle login
Route::post('/login', function (Request $request) {
    $credentials = $request->validate([
        'email' => ['required', 'email'],
        'password' => ['required'],
    ]);

    if (Auth::attempt($credentials, $request->boolean('remember'))) {
        $request->session()->regenerate();

        $role = Auth::user()->role;

        return match ($role) {
            'admin' => redirect('/admin'),
            'instructor' => redirect('/instructor/dashboard'),
            'student' => redirect('/student/dashboard'),
            default => abort(403),
        };
    }

    return back()->withErrors([
        'email' => 'Invalid credentials.',
    ])->onlyInput('email');
});

// Instructor Dashboard
Route::get('/instructor/dashboard', function () {
    if (Auth::user()->role !== 'instructor') {
        abort(403);
    }
    return view('dashboards.instructor');
})->middleware('auth')->name('instructor.dashboard');

// Student Dashboard
Route::get('/student/dashboard', function () {
    if (Auth::user()->role !== 'student') {
        abort(403);
    }
    return view('dashboards.student');
})->middleware('auth')->name('student.dashboard');

// Logout
Route::post('/logout', function (Request $request) {
    Auth::logout();
    $request->session()->invalidate();
    $request->session()->regenerateToken();
    return redirect('/login');
})->name('logout');
