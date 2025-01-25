<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Resources\TeacherReportResource;
use Illuminate\Http\Request;

use App\Models\User;
use App\Models\Session;

class TeacherReportController extends Controller
{
    public function __construct(private Session $sessions, private User $users){}
    public function data(){
        // https://login.mathshouse.net/api/TeacherReport
        $teachers = $this->users
        ->with(['session_explanation' => function($query){
            return $query->withCount('attendce as student_count')
            ->with('lesson.chapter.course.category');
        }, 'session_re_explanation' => function($query){
            return $query->withCount('attendce as student_count')
            ->with('lesson.chapter.course.category');
        }, 'session_mistakes' => function($query){
            return $query->withCount('attendce as student_count')
            ->with('course.category');
        }])
        ->where('position', 'teacher')
        ->get(); 

        $teachers = TeacherReportResource::collection($teachers);
        return response()->json([
            'teachers' => $teachers
        ]);
    }
}
