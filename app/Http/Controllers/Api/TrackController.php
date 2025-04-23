<?php

namespace App\Http\Controllers;
use App\Models\Track;
use Illuminate\Http\Request;

class TrackController extends Controller
{      public function create(Request $request)
    {
        $request->validate([
            'name'         => 'required|string',
            'description'  => 'nullable|string',
            'code'         => 'required|string |unique:tracks,code',
            'is_active'    => 'required|boolean',
            'max_students' => 'required|integer'
        ]);
    
        $track = Track::create([
            'name'         => $request->name,
            'description'  => $request->description,
            'code'         => $request->code,
            'is_active'    => $request->is_active,
            'max_students' => $request->max_students
        ]);
    
        return response()->json([
            'message' => 'Track created successfully.',
            'track'   => $track
        ], 201);
    }
       // Get all active tracks
       public function index()
       {
           $tracks = Track::where('is_active', true)->get();
   
           return response()->json($tracks);
       }
   
       // (Optional) Get single track by id
       public function show($id)
       {
           $track = Track::find($id);
   
           if (!$track || !$track->is_active) {
               return response()->json(['message' => 'Track not found.'], 404);
           }
   
           return response()->json($track);

       }
}