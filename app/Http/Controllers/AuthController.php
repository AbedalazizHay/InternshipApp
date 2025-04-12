<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;


class AuthController extends Controller
{
    public function index()
    {
        return view('auth.login');
    }

    public function login(Request $request)
    {
        $request->validate([
            'email'=>'required|email',
            'password'=>'required|min:8'
        ]);

        $user = User::where('email',$request->email)->first();

        if(!$user || !Hash::check($request->password,$user->password)){
            return back()->with('error','Invalid Credentials');
        }
        if($user->role === 'student' && ($user->status !== 'active' || $user->has_paid === false)){
            return back()->with('error','Your account is not active or payment incomplete');
        }

        Auth::login($user);

        return match ($user->role) {
            'admin' => redirect('/admin/dashboard'),
            'instructor' => redirect('/instructor/dashboard'),
            'student' => redirect('/student/dashboard'),
            default => redirect('/login')->with('error', 'Unauthorized role'),
        };
    }
    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect('/login');
    }
}
