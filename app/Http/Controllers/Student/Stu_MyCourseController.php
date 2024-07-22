<?php

namespace App\Http\Controllers\Student;

use Illuminate\Support\Facades\Cookie;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Marketing;
use App\Models\PaymentRequest;
use App\Models\PaymentOrder;
use App\Models\quizze;
use App\Models\QuizzeStuAns;
use App\Models\StudentQuizze;
use App\Models\StudentQuizzeMistake;
use App\Models\Question;
use App\Models\Mcq_ans;
use App\Models\Chapter;
use App\Models\PaymentPackageOrder;
use App\Models\User;
use App\Models\Package;
use App\Models\SmallPackage;
use App\Models\ReportVideoList;
use App\Models\ReportVideo;
use App\Models\ReportQuestionList;
use App\Models\ReportQuestion;

use Carbon\Carbon;

class Stu_MyCourseController extends Controller
{
    public function index()
    {
        $payment_request = PaymentRequest::where('user_id', auth()->user()->id)
            ->where('state', 'Approve')
            ->orderByDesc('id')
            ->get();
        $courses = [];
        foreach ($payment_request as $item) {
            foreach ($item->order as $value) {
                $courses[$value->course->course_name] = $value->course;
            }
        }
        return view('Student.MyCourses.MyCourses', compact('courses'));
    }

    public function courses()
    {
        $courses = Marketing::where('student_id', auth()->user()->id)
            ->where('course_id', '!=', null)
            ->orderBy('course_id')
            ->get();
        return view('Student.MyCourses.Courses', compact('courses'));
    }

    public function chapters()
    {
        $chapters = Marketing::where('student_id', auth()->user()->id)
            ->where('chapter_id', '!=', null)
            ->orderBy('chapter_id')
            ->get();
        return view('Student.MyCourses.Chapters', compact('chapters'));
    }

    public function stu_chapters($id)
    {
        // New Code
        $payment_order = PaymentOrder::where('state', 1)
        ->with('chapter')
        ->with('pay_req')
        ->orderByDesc('id')
        ->get();

        $chapters = [];
        foreach ($payment_order as $item) {
            $newTime = Carbon::now()->subDays($item->duration);
            if ( $newTime > $item->date && $item->pay_req->user_id == auth()->user()->id ) {
                $chapters[$item->chapter_id] = $item;
            }
        }
        $course_id = $id;

        return view('Student.MyCourses.Chapters_Working', compact('chapters', 'course_id'));
    }

    public function stu_lessons($id, $L_id, $idea_num)
    {
        $reports = ReportVideoList::all();
        $payment_order = PaymentOrder::where('state', 1)
        ->with('chapter')
        ->with('pay_req')
        ->orderByDesc('id')
        ->get();

        $chapters = [];
        $chapter_state = false;
        foreach ($payment_order as $item) {
            $newTime = Carbon::now()->subDays($item->duration);
            if ( $newTime > $item->date && $item->pay_req->user_id == auth()->user()->id && $item->chapter_id == $id ) {
                $chapter_state = true;
            }
        }
        $course_id = $id;
        $payment_request = [];
        if ($chapter_state) {
            $payment_request = PaymentRequest::where('user_id', auth()->user()->id)
                ->where('state', 'Approve')
                ->orderByDesc('id')
                ->get();
        }
        $chapter_id = $id;  
        return view('Student.MyCourses.Lessons', 
        compact('payment_request', 'chapter_id', 'L_id', 'idea_num', 'reports'));

    }

    public function quizze_ques_ans( $id ){

        if ( empty(auth()->user()) ) {
            if ( !session()->has('previous_page') ) {
                session(['previous_page' => url()->current()]);
            }
            return redirect()->route('login.index');
        }
        else{  
            $reports = ReportVideoList::all();
            $payments = PaymentPackageOrder::
            where('state', 1)
            ->where('user_id', auth()->user()->id)
            ->with('pay_req')
            ->with('package')
            ->orderByDesc('id')
            ->get();
            $user = User::where('id', auth()->user()->id)
            ->first();

            foreach ( $payments as $item ) { 
                $newTime = Carbon::now()->subDays($item->package->duration);
                $question = Question::where('id', $id)
                ->first();

                if ( $item->package->module == 'Question' && 
                $item->pay_req->user_id == auth()->user()->id &&
                $item->date >= $newTime &&
                $item->number > 0
                 ) 
                 {  

                    PaymentPackageOrder::where('id', $item->id)
                    ->update([
                        'number' => $item->number - 1
                    ]);
                    return view('Student.Question_History.Question_Ans', compact('question', 'reports')); 
                }
            } 
            $package = Package::
            where('module', 'Question')
            ->get();
            Cookie::queue(Cookie::make('q_ans_id', $id, 90));
            return view('Student.Exam.Exam_Package', compact('package'));
        }
    }

    public function stu_quizze($quizze_id)
    {
        if ( empty(auth()->user()) ) {
            if ( !session()->has('previous_page') ) {
                session(['previous_page' => url()->current()]);
            }
            return redirect()->route('login.index');
        }
        else{  
            $reports = ReportQuestionList::all();
            $user = User::where('id', auth()->user()->id)
            ->first();
            // Return Exam
            $quizze = quizze::where('id', $quizze_id)
            ->first();

            $stu_quizze = StudentQuizze::where('student_id', auth()->user()->id)
            ->where('score', '>=', $quizze->pass_score)
            ->with('quizze')
            ->get();

            $solve_quizze = StudentQuizze::where('student_id', auth()->user()->id)
            ->where('score', '>=', $quizze->pass_score)
            ->where('quizze_id', $quizze->id)
            ->first();

            if ( !empty($solve_quizze) ) {
                session()->flash('faild', 'You Passed The Quiz Last Time');
                return redirect()->back();
            }

            foreach ($stu_quizze as $item) {
                if ($item->quizze->quizze_order < $quizze->quizze_order) {
                    session()->flash('faild', 'You Must Pass Last Quiz First');
                    return redirect()->back();
                }
            }

            return view('Student.MyCourses.Quizze', compact('quizze', 'reports'));
        }
    }

    public function quizze_ans(Request $req)
    {
        return $timer_val;
        $timer_val = json_decode(Cookie::get('timer'));
        $quizze_id = json_decode($req->quizze)->id;
        $quizze = quizze::where('id', $quizze_id)
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

                $stu_solve = $question->mcq[0]->mcq_answers;
                $arr = ['A', 'B', 'C', 'D']; 
                if ( isset($mcq_item->answer) && $stu_solve == $mcq_item->answer ) {
                    $deg++;
                } else {
                    $mistakes[] = $question;
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
                if ( strpos($answer, '/') ) {
                    $arr_ans = explode('/', $answer);
                    $answer = floatval($arr_ans[0]) / floatval($arr_ans[1]);
                    if ( floatval($grid_ans) == $answer || 
                    (floatval($grid_ans) - $answer < .06 && floatval($grid_ans) - $answer > 0 ) ||
                    ($answer - floatval($grid_ans) < .06 && $answer - floatval($grid_ans) > 0 ) ) {
                        $deg++;
                    }
                    else {
                        $mistakes[] = $question;
                    }
                }
                elseif ( floatval($grid_ans) == floatval($answer) ) {
                    $deg++;
                } else {
                    $mistakes[] = $question;
                }
            }
        }

        $right_question = $deg;
        $deg =  $deg / $total_question * 100;
        $deg = round($deg, 2);
        $score = ($quizze->score / $total_question) * $right_question;

        $stu_q = StudentQuizze::where('student_id', auth()->user()->id)
            ->where('quizze_id', $req->quizze_id)
            ->first();

        if (empty($stu_q)) {
            $stu_quizze = StudentQuizze::create([
                'date' => now(),
                'lesson_id' => $quizze->lesson_id,
                'quizze_id' => $quizze->id,
                'student_id' => auth()->user()->id,
                'score' => $score,
                'time' => $timer_val,
                'r_questions' => $right_question,
            ]);
            $quize_id = $stu_quizze->id;

            foreach ($mistakes as $item) {
                StudentQuizzeMistake::create([
                    'student_quizze_id' => $quize_id,
                    'question_id' => $item->id
                ]);
            }
        }
        $report_v = ReportVideoList::all();

        return view('Student.MyCourses.Grade', compact('deg', 'quize_id', 'quizze', 'right_question', 'total_question', 'mistakes', 'report_v'));
    }

    public function question_parallel($id)
    {
        $question = Question::where('id', $id)
            ->first();
        $q_parallel = Question::where('month', $question->month)
            ->where('year', $question->year)
            ->where('section', $question->section)
            ->where('q_num', $question->q_num)
            ->where('id', '!=', $id)
            ->get();

        return view('Student.MyCourses.Parallel_Question', compact('q_parallel'));
    }

    public function solve_parallel($id, Request $req)
    {
        $question = Question::where('id', $id)
            ->first();
        $grade = false;
        if ($question->ans_type == 'MCQ') {
            if ($question->mcq[0]->mcq_answers == $req['ans' . $id]) {
                $grade = true;
            }
        } else {
            if ($question->g_ans[0]->grid_ans == $req['ans' . $id]) {
                $grade = true;
            }
        }
        
        return view('Student.MyCourses.Solve_Parallel', compact('grade', 'question'));
    }

    public function quizze_history()
    {
        $history = StudentQuizze::where('student_id', auth()->user()->id)
        ->orderByDesc('id')
        ->get();

        return view('Student.MyCourses.History', compact('history'));
    }

    public function quizze_mistakes( $id ){
        $mistakes = StudentQuizze::
        where('student_id', auth()->user()->id)
        ->where('id', $id)
        ->first();
        $questions = $mistakes->questions;

        return view('Student.MyCourses.Quiz_Mistakes', compact('mistakes', 'questions'));
    }

    public function buy_chapter( $id ){
        
        $chapters = Chapter::where('id', $id)
        ->first(); 
        
        $prices = $chapters->price;
        $min = $prices[0];
        foreach ($prices as $key => $price) {
            if ( $min->price > $price->price ) {
                $min = $price;
            }
        }
        $chapters_price = $min->price;
        $chapter_discount = $min->price - ($min->price * $min->discount / 100);
        $chapters->ch_price = $chapters_price;
        $ch = json_encode([$chapters]);
        Cookie::queue('marketing', $ch, 10000);
        Cookie::queue('chapters_price', $chapters_price, 10000); 
        if ( empty(auth()->user()) ) {
            return view('Visitor.Login.login');
        }
        else{
            $chapters = [$chapters];
            return view('Visitor.Cart', compact('chapters', 'chapters_price', 'chapter_discount'));
        }
    }

    public function dia_buy_chapters( Request $req ){
        $ids = json_decode($req->ids);
        $chapters = Chapter::whereIn('id', $ids)
        ->get();
        $chapters_price = 0;
        $price_arr = [];
        $chapter_discount = 0;
        
        
        foreach ($chapters as $key => $chapter) {
            $prices = $chapter->price;
            $min = $prices[0];
            foreach ($prices as $key => $price) {
                if ( $min->price > $price->price ) {
                    $min = $price;
                }
            }
            $chapters_price+= $min->price;
            $price_arr[] = $min;
            $chapter_discount += $min->price - ($min->price * $min->discount / 100);
        }
        Cookie::queue('marketing', json_encode($chapters), 10000);
        Cookie::queue('chapters_price', $chapters_price, 10000);
        Cookie::queue('price_arr', json_encode($price_arr), 10000);
         
        if ( empty(auth()->user()) ) {
            return view('Visitor.Login.login');
        }
        else{
            $chapters = $chapters;
            return view('Visitor.Cart', compact('chapters', 'chapters_price', 'price_arr', 'chapter_discount'));
        }
    }

    public function report_video_api( Request $req ){
        $arr = [
            'date' => now(),
            'user_id' => auth()->user()->id,
            'lesson_video_id' => intval($req->obj['lesson_video_id']),
            'list_id' => intval($req->obj['list_id']),
            'statues' => 'Pendding'
        ];
        ReportVideo::create( $arr );

        return response()->json([
            'success' => 'You Report Video Success'
        ]);
    }

    public function report_video_q_api( Request $req ){
        $arr = [
            'date' => now(),
            'user_id' => auth()->user()->id,
            'q_video_id' => intval($req->obj['lesson_video_id']),
            'list_id' => intval($req->obj['list_id']),
            'statues' => 'Pendding'
        ];
        ReportVideo::create( $arr );

        return response()->json([
            'success' => 'You Report Video Success'
        ]);
    }

    public function report_q_video_api( Request $req ){
        $arr = [
            'date' => now(),
            'user_id' => auth()->user()->id,
            'q_video_id' => intval($req->obj['q_video_id']),
            'list_id' => intval($req->obj['list_id']),
            'statues' => 'Pendding'
        ];

        ReportVideo::create( $arr );
    }


    public function api_report_question( Request $req ){

        ReportQuestion::create([
            'date' => now(),
            'user_id' => auth()->user()->id,
            'question_id' => $req['question_id'],
            'list_id' => $req['list_id'],
            'statues' => 'pendding',
        ]);

        return response()->json([
            'success' => 'You Make Report success'
        ]);
    }

    
    
}
