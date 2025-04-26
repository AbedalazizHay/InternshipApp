<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;

use App\Models\Academic_level;
use Illuminate\Http\Request;


class AcademicLevelController extends Controller
{
    public function store(Request $request)
{
    $validated = $request->validate([
       'name' => 'required|string|max:255',
       'is_active'=>'required|boolean',
    ]);

    $academiclevel= Academic_level::create($validated);

    return response()->json([
        'message' => ' Academic_level created successfully',
        'data' => $academiclevel
    ], 201);
}
  
   
public function index()
{
    $levels = Academic_level::where('is_active', true)->get();

    return response()->json([
        'success' => true,
        'data' => $levels
    ]);
}
}