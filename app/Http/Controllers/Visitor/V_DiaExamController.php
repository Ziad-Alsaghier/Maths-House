<?php

namespace App\Http\Controllers\Visitor;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Category;
use App\Models\Course;
use App\Models\DiagnosticExam;
use App\Models\Question;
use App\Models\DiagnosticExamsHistory;
use App\Models\DaiExamMistake;
use App\Models\ScoreList;
use App\Models\MarketingPopup;
use App\Models\ReportQuestionList;

class V_DiaExamController extends Controller
{
    
    public function index(){
        if ( empty(auth()->user()) ) {
            if ( !session()->has('previous_page') ) {
                session(['previous_page' => url()->current()]);
            }
            return redirect()->route('login.index');
        }
        $categories = Category::all();
        $courses = Course::all();
        $popup = MarketingPopup::
        where('starts', '<=', now())
        ->where('ends', '>=', now())
        ->whereHas('popup_pages', function($query){
            $query->where('page_name', 'Diagnostic Exam', 'popup');
        })
        ->get();

        return view('Visitor.Dia_Exam.Dia_Exam', compact('categories', 'popup', 'courses'));
    }

    public function v_dia_courses( $id ){
        if ( empty(auth()->user()) ) {
            if ( !session()->has('previous_page') ) {
                session(['previous_page' => url()->current()]);
            }
            return redirect()->route('login.index');
        }

        $courses = Course::where('category_id', $id)
        ->get();

        return view('Visitor.Dia_Exam.Courses', compact('courses'));
    }

    public function v_dia_exam( Request $req ){
        if ( empty(auth()->user()) ) {
            if ( !session()->has('previous_page') ) {
                session(['previous_page' => url()->current()]);
            }
            return redirect()->route('login.index');
        }
        $exam = DiagnosticExam::where('course_id', $req->course_id)
        ->where('state', 1)
        ->get();
        $num = rand(0, count($exam) - 1);
        if ( !isset($exam[$num]) ) {
            session()->flash('faild','Diagnostic Exams Is Empty');
            return redirect()->back();
        }
        $exam = $exam[$num];
        $reports = ReportQuestionList::all();
        
        return view('Visitor.Dia_Exam.Exam', compact('exam', 'reports'));
    }

    public function dia_exam_ans( $id, Request $req )
    {
        $timer_val = $req->timer_val;
        
        $exam = DiagnosticExam::where('id', $id)
        ->first();
        $deg = 0;
        $mistakes = [];
        $total_question = 0;
        if ( isset($req->q_answers) ) {
            foreach ( $req->q_answers as $item ) {
                $total_question++;
                $mcq_item = json_decode($item);
                $question = Question::where('id', $mcq_item->q_id)
                ->first();

                if ( isset($question->mcq[0]) && $question->mcq[0]->mcq_answers ) {
                    $stu_solve = $question->mcq[0]->mcq_answers;
                    $arr = ['A', 'B', 'C', 'D', 'E']; 
                    if ( isset($mcq_item->answer) && $stu_solve == $mcq_item->answer ) {
                        $deg++;
                    } else {
                        $mistakes[$question->lessons->chapter->id] = $question;
                    }
                }
            }
        }

       // "":["{\"q_id\":20}","{\"q_id\":1}"],"q_grid_ans":["1","1"]}
        if ( isset($req->q_grid_answers) ) {
            for ( $i = 0, $end = count($req->q_grid_answers); $i < $end; $i++ ) {
                $total_question++;
                $grid_item = json_decode($req->q_grid_answers[$i]);
                $question = Question::where('id', $grid_item->q_id)
                ->first();
                $grid_ans = @$question->g_ans[0]->grid_ans;
                $answer = $req->q_grid_ans[$i];
                if ($grid_ans == $answer) {
                    $deg++;
                } else {
                    $mistakes[$question->lessons->chapter->course->id] = $question;
                }
            }
        }

        $right_question = $deg;
        $score = ScoreList::
        where('score_id', $exam->score_id)
        ->where('question_num', $right_question)
        ->first();
        $score = $right_question == 0 ? 200 : $score->score;
        $grade = $exam->pass_score < $score ? true : false;
        $deg =  $deg / $total_question * 100;

        $stu_q = DiagnosticExamsHistory::where('user_id', auth()->user()->id)
            ->where('diagnostic_exams_id', $req->quizze_id)
            ->first();
            
        if (empty($stu_q)) {
            $stu_exam = DiagnosticExamsHistory::create([
                'date' => now(),
                'user_id' => auth()->user()->id,
                'diagnostic_exams_id' => $exam->id,
                'score' => $score,
                'time' => $timer_val, 
                'r_questions' => $right_question,
            ]);

            foreach ($mistakes as $item) {
                DaiExamMistake::create([
                    'student_exam_id' => $stu_exam->id,
                    'question_id' => $item->id
                ]);
            }
        }

        return view('Visitor.Dia_Exam.Grade', compact('deg', 'grade', 'score', 'exam', 'right_question', 'total_question', 'mistakes'));
    }

    public function dia_exam_history(){
        $dia_history = DiagnosticExamsHistory::
        where('user_id', auth()->user()->id)
        ->orderByDesc('id')
        ->get();

        return view('Student.Dia_History.Dia_History', compact('dia_history'));
    }

}
