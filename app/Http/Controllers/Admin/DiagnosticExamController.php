<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Question;
use App\Models\quizze;
use App\Models\Category;
use App\Models\Course;
use App\Models\Chapter;
use App\Models\Lesson;
use App\Models\ExamCodes;
use App\Models\DiagnosticExam;
use App\Models\DiaQuestion;
use App\Models\ScoreSheet;

class DiagnosticExamController extends Controller
{
    
    public function index(){
        $questions = Question::
        select('*', 'questions.id as question_id')
        ->leftJoin('lessons', 'questions.lesson_id', '=', 'lessons.id')
        ->leftJoin('chapters', 'lessons.chapter_id', '=', 'chapters.id')
        ->leftJoin('courses', 'chapters.course_id', '=', 'courses.id')
        ->orderByDesc('question_id')
        ->get();
        $chapters = Chapter::all();
        $lessons = Lesson::all();
        $exams = DiagnosticExam::
        orderByDesc('id')
        ->simplePaginate(10);
        $categories = Category::all();
        $courses = Course::all();
        $scores = ScoreSheet::all();
        $codes = ExamCodes::all();
        
        return view('Admin.courses.Dia Exam.DiagnosticExam', 
        compact('questions', 'exams', 'categories', 'courses', 'scores', 'chapters', 'lessons', 'codes'));
    }

    public function dia_exam_data( Request $req ){

        $quizzes = [];

        return $quizzes;
    }

    public function del_dia_exam( $id ){
        DiagnosticExam::where('id', $id)
        ->delete();

        return redirect()->back();
    }

    public function exam_add_q( Request $req ){
        return $req->all();
    }

    public function exam_del_q( Request $req ){
        DiaQuestion::where('id', $req->id)
        ->delete();

        return $req->all();
    }

    public function add_diaexam( Request $req ){ 
        $req->validate([
            'score'=>'required',
            'course_id'=>'required',
            'score_id'=>'required',
        ]);
        $questions = json_decode($req->ques_id);
       $arr = $req->only('title', 'description', 'score', 'pass_score', 'course_id', 'score_id', 'state');
       $arr['time'] = $req->time_h_1 . $req->time_h_2 . ':' . $req->time_m_1 . $req->time_m_2 . ':00';
       $dia_exam = DiagnosticExam::create($arr);
       foreach ($questions as $ques) {
        DiaQuestion::create([
            'diagnostic_exam_id' => $dia_exam->id,
            'question_id' => $ques->id,
        ]);
       }

       return redirect()->back();
    }

    public function edit_dia_exam_item( $id, Request $req){
        $questions = json_decode($req->ques_id);
       $arr = $req->only('title', 'description', 'score', 'pass_score', 'course_id', 'score_id');
       $arr['state'] = isset($req->state) ? 1 : 0;
       $arr['time'] = $req->time_h . ':' . $req->time_m . ':00';
       $dia_exam = DiagnosticExam::
       where('id', $id)
       ->update($arr);
       
       DiaQuestion::where('diagnostic_exam_id', $id)
       ->delete();
       for ($i=0, $end = count($req->question_id); $i < $end; $i++) { 
            DiaQuestion::create([
                'diagnostic_exam_id' => $id,
                'question_id' => $req->question_id[$i]
            ]);
       }

       return redirect()->back();
    }

    public function edit_q_dia_exam( Request $req ){
        DiagnosticExam::where('id', $req->data[0][0]['diagnostic_ID'])
        ->update([
            'title' => $req->data[0][0]['title'],
            'description' => $req->data[0][0]['description'],
            'time' => $req->data[0][0]['time'],
            'score' => $req->data[0][0]['score'],
            'pass_score' => $req->data[0][0]['pass_score'],
            'score_id' => $req->data[0][0]['scoreId'],
            'state' => $req->data[0][0]['state'],
        ]);
        DiaQuestion::where('diagnostic_exam_id', $req->data[0][0]['diagnostic_ID'])
        ->delete();
        for ($i=1, $end = count($req->data); $i < $end; $i++) { 
            DiaQuestion::create([
                'diagnostic_exam_id' => $req->data[0][0]['diagnostic_ID'],
                'question_id' => $req->data[$i]['question_ID']
            ]);
        }
        return $req->all();
    }

    public function dia_filter_question( Request $req ){
        $questions = Question::
        with('api_lesson')
        ->with('code')
        ->get();

        if ( $req->year ) {
            $arr = [];
            foreach ( $questions as $item ) {
                if ( $item->year == $req->year ) {
                    $arr[] = $item;
                }
            }
            $questions = $arr;
        }
        if ( $req->month ) {
            $arr = [];
            foreach ( $questions as $item ) {
                if ( $item->month == $req->month ) {
                    $arr[] = $item;
                }
            }
            $questions = $arr;
        }
        if ( $req->section ) {
            $arr = [];
            foreach ( $questions as $item ) {
                if ( $item->section == $req->section ) {
                    $arr[] = $item;
                }
            }
            $questions = $arr;
        }
        if ( $req->code ) {
            $arr = [];
            foreach ( $questions as $item ) {
                if ( $item->q_code == $req->code ) {
                    $arr[] = $item;
                }
            }
            $questions = $arr;
        }
        if ( $req->q_num ) {
            $arr = [];
            foreach ( $questions as $item ) {
                if ( $item->q_num == $req->q_num ) {
                    $arr[] = $item;
                }
            }
            $questions = $arr;
        }
        if ( $req->lesson ) {
            $arr = [];
            foreach ( $questions as $item ) {
                if ( $item->lesson_id == $req->lesson ) {
                    $arr[] = $item;
                }
            }
            $questions = $arr;
        }
        if ( $req->chapter ) {
            $arr = [];
            foreach ( $questions as $item ) {
                if ( $item['api_lesson']['chapter_id'] == $req->chapter ) {
                    $arr[] = $item;
                }
            }
            $questions = $arr;
        }
        if ( $req->q_type ) {
            $arr = [];
            foreach ( $questions as $item ) {
                if ( $item->q_type == $req->q_type ) {
                    $arr[] = $item;
                }
            }
            $questions = $arr;
        }

        if ( count($questions) == 0 ) {
            return response()->json([
                'faild' => 'Question Is Empty'
            ]);
        } 
        else {
            return response()->json([
                'questions' => $questions
            ]);
        }
        
    }

}
