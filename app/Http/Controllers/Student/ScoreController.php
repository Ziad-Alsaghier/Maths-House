<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Lesson;
use App\Models\Chapter;
use App\Models\StudentQuizze;

class ScoreController extends Controller
{
    public function score_sheet(){
        $lessons = Lesson::all();
        $chapters = Chapter::all();

        return view('Student.ScoreSheet.ScoreSheet', compact('lessons', 'chapters'));
    }

    public function lesson_score_sheet( Request $req ) {
        $data = StudentQuizze::
        where('student_id', auth()->user()->id)
        ->where('lesson_id', $req->lesson_id)
        ->get();
        $arr = [];

        foreach ( $data as $item ) {
            $arr[$item->quizze_id] = $item;
        }

        return response()->json([
            'data' => $arr
        ]);
    }

}
