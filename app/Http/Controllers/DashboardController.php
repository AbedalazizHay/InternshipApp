<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    public function instructor()
    {
        if (Auth::user()->role !== 'instructor') {
            abort(403);
        }

        return view('dashboards.instructor');
    }

    public function student()
    {
        if (Auth::user()->role !== 'student') {
            abort(403);
        }

        return view('dashboards.student');
    }
}
