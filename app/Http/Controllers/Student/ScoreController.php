<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Lesson;
use App\Models\Chapter;
use App\Models\Course;
use App\Models\StudentQuizze;
use App\Models\LiveCourse;

class ScoreController extends Controller
{
    public function score_sheet(){
        $lessons = Lesson::
        with('quizze')
        ->all();
        $chapters = Chapter::all();
        $courses = Course::all();

        return view('Student.ScoreSheet.ScoreSheet', compact('lessons', 'chapters', 'courses'));
    }

    public function lesson_score_sheet( Request $req ) {
        $data = StudentQuizze::
        where('student_id', auth()->user()->id)
        ->where('lesson_id', $req->lesson_id)
        ->with('quizze')
        ->get();
        $arr = []; 
        foreach ( $data as $item ) {
            $arr[$item->quizze_id] = $item;
        }

        return response()->json([
            'data' => array_values($arr)
        ]);
    }

    public function course_score_sheet( Request $req ) {
        // https://login.mathshouse.net/api/course_score_sheet
        // Keys
        // course_id
        $studentId = auth()->user()->id;
        $data = Chapter::
        where('course_id', $req->course_id)
        ->with(['lessons.quizs.student_quizs' => function($query) use ($studentId) {
            $query->where('student_id', $studentId);
        }])
        ->get();

        return response()->json([
            'data' => $data
        ]);
    }

    public function student_courses( Request $req ) {
        // https://login.mathshouse.net/api/student_courses
        $courses = LiveCourse::
        where('user_id', auth()->user()->id)
        ->with('course')
        ->get();

        return response()->json([
            'courses' => $courses
        ]);
    }

}
