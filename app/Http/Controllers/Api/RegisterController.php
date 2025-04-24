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
            'first_name' => 'required|string',
            'last_name' => 'required|string',
            'phone_number' => 'required|string',
            'email' => 'required|string|email|unique:users,email',
            'password' => 'required|string|min:8',
            'date_of_birth' => 'nullable|date',
            'gender' => 'required|in:male,female',
            'institution_id' => 'required|exists:institutions,id',
            'academic_level_id' => 'required|exists:academic_levels,id',
        ]);

        $validated['password'] = \Hash::make($validated['password']);

        $user = User::create([
            ...$validated,
            'role' => 'student',
            'status' => 'inactive',
            'has_paid' => false,
        ]);

        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'message' => 'Registered successfully',
            'token' => $token,
            'user' => $user->only([
                'id',
                'first_name',
                'last_name',
                'phone_number',
                'email',
                'date_of_birth',
                'gender',
                'role',
                'status',
                'has_paid',
                'institution_id',
                'academic_level_id',
            ])
        ], 201);
    }

    public function loginUser(Request $request)
    {
        $validated = $request->validate([
            'email' => 'required|string|email',
            'password' => 'required|string|min:8',
        ]);

        $user = User::where('email', $validated['email'])->first();

        if (!$user || !\Hash::check($validated['password'], $user->password)) {
            return response()->json([
                'message' => 'User not found or credentials incorrect.',
            ], 401);
        }
        if ($user->role === 'student' && (!$user->has_paid || $user->status === 'inactive')) {
            return response()->json([
                'message' => 'Your account is not yet active. Please complete your payment to proceed.',
                'payment_api_url' => url("/api/payment/initiate/{$user->id}")
            ], 403);
        }

        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'message' => 'Login successfully',
            'token' => $token,
            'user' => $user->only([
                'id',
                'first_name',
                'last_name',
                'email',
                'role',
                'status',
                'has_paid'
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
