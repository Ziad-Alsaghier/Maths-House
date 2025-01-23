<?php

namespace App\Http\Controllers\Admin\scoreSheet;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ScoreSheetExamController extends Controller
{
    // This Is Controller About All Reports Of Exams


   
    public function index(){
        
        return view('Admin.scoreSheet.scoreSheetExam');
    }
}
