<?php

namespace App\Http\Controllers\Visitor;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Package;
use App\Models\Category;
use App\Models\Course;

class V_LiveController extends Controller
{

    public function live_package(){
        
        $package = [];
        $courses = Course::get();
        $categories = Category::get();
        $module = 'Live';

        return view('Student.Exam.Exam_Package', 
        compact('package', 'courses', 'categories', 'module'));
    }

}
