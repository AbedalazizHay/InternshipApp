<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    public function instructor()
{
    $user = Auth::user();

    if ($user->role !== 'instructor') {
        abort(403, 'Unauthorized access.');
    }

    if ($user->status === 'inactive') {
        return view('auth.instructor-inactive');
    }

    return view('dashboards.instructor');
}


    public function student()
    {
        $user = Auth::user();

        if ($user->role !== 'student') {
            abort(403, 'Unauthorized access.');
        }

        if (!$user->has_paid || $user->status === 'inactive') {
            return redirect()->route('payment.notice');
        }

        return view('dashboards.student');
    }

}
