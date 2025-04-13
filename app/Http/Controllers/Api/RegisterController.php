<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class RegisterController extends Controller
{
    public function registerUser(Request $request)
    {
        $validated = $request->validate([
            'first_name' => 'required |string',
            'last_name' => 'required |string',
            'phone_number' => 'required |string',
            'email' => 'required |string | unique:users',
            'password' => 'required |string | min:8',
            'date_of_birth' => 'date',
            'gender'=>'in:male,female',
        ]);
        $validated['password'] = \Hash::make($validated['password']);
        $validated['role'] ='student';

        $user = User::create($validated);

        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'message'=>'Register successfully',
            'token'=>$token,
            'user'=>$user->only([
                'first_name',
                'last_name',
                'phone_number',
                'email',
                'date_of_birth',
                'gender',
                'password',
                'role'
            ])
        ],201);
    }

    public function loginUser(Request $request)
    {
        $validated = $request->validate([
            'email' => 'required |string',
            'password' => 'required |string | min:8',
        ]);
        $user = User::where('email',$validated['email'])->first();
        if(!$user || !\Hash::check($validated['password'], $user->password)){
            return response()->json([
                'message'=>'User not found',
            ],401);
        }


        $token = $user->createToken('auth_token')->plainTextToken;
        return response()->json([
            'message'=>'Login successfully',
            'token'=>$token,
            'user'=>$user->only([
                'first_name',
                'last_name',
            ])
        ]);
    }
    public function logoutUser(Request $request)
    {
        $request->user()->tokens()->delete();
        return response()->json([
            'message'=>'Logout successfully',
        ],201);
    }
}
