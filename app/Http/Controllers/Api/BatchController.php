<?php

namespace App\Http\Controllers;
use Illuminate\Validation\ValidationException;
use App\Models\Track;
use Illuminate\Http\Request;
use App\Models\Batch;
class BatchController extends Controller
{   // 1. Get all batches
    public function index()
    {
        $batches = Batch::all();
        return response()->json($batches);
    }
     // 2. Create a new batch
     public function create(Request $request)
     {
         $request->validate([
            'track_id'=>'required|integer',
             'name' => 'required|string',
             'start_date' => 'required|date','track_id',
             'end_date' => 'required|date',
             'max_students'=>'required|integer',
             'is_active' => 'required|boolean'                     
   ]);
 
         $batch = Batch::create([
            'track_id'    =>$request->track_id,
             'name'       => $request->name,
             'start_date' => $request->start_date,
             'end_date'   => $request->end_date,
             'max_students'=>$request->max_students,
             'is_active'  => $request->is_active
         ]);
 
         return response()->json([
             'message' => 'Batch created successfully.',
             'batch'   => $batch
         ], 201);
     }
    public function active()
    {
        $batch = Batch::where('is_active', true)->first();

        if (!$batch) {
            return response()->json(['message' => 'No active batch found.'], 404);
        }

        return response()->json($batch);
    }
    public function inactive(){
        $batch= Batch::where('is_active',false)->first();
        if(!$batch){
            return response()->json(['message'=>'no inactive batch found'],404);
        }
    }}