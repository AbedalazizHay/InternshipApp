<?php

 
// app/Http/Controllers/Api/InstitutionController.php

namespace App\Http\Controllers\Api;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Institution;

class InstitutionController extends Controller
{  
    public function store(Request $request)
{
    $validated = $request->validate([
       'name' => 'required|string|max:255',
       'type'=>'required|string|max:255',
       'is_verified'=>'required|boolean',
    ]);

    $institution = Institution::create($validated);

    return response()->json([
        'message' => 'Institution created successfully',
        'data' => $institution
    ], 201);
}
  
    public function index()
    {
        $institutions = Institution::where('is_verified', true)->get();

        return response()->json([
            'success' => true,
            'data' => $institutions
        ]);
    }
}