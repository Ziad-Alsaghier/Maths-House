<?php

namespace App\Http\Controllers\Visitor;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Question;
use App\Models\User;
use App\Models\Package;
use App\Models\UserPackage;
use App\Models\PaymentPackageOrder;
use App\Models\QuestionTime;
use App\Models\QuestionHistory;
use App\Models\SmallPackage;
use App\Models\MarketingPopup;
use App\Models\ReportQuestionList;
use App\Models\Category;
use App\Models\Course;
use App\Models\ExamCodes;
use App\Models\ReportVideoList;

use Carbon\Carbon;

class V_QuestionController extends Controller
{
    
    public function v_question(){ 
        $popup = MarketingPopup::
        where('starts', '<=', now())
        ->where('ends', '>=', now())
        ->whereHas('popup_pages', function($query){
            $query->where('page_name', 'Question');
        })
        ->get();
        $codes = ExamCodes::all();
        $categories = Category::all();
        $courses = Course::all();

        return view('Visitor.Question.Question', compact('popup', 'categories', 'courses', 'codes'));
    }

    public function v_filter_question( Request $req ){
        if ( empty($req->course_id) ) {
            session()->flash('faild','Course Is Required');
            return redirect()->back();
        }
        $question = Question::select('questions.*')
        ->leftJoin('lessons', 'questions.lesson_id', '=', 'lessons.id')
        ->leftJoin('chapters', 'lessons.chapter_id', '=', 'chapters.id')
        ->where('chapters.course_id', $req->course_id)
        ->where('q_type', '!=', 'Parallel')
        ->get();

        $q_items = $question;
        if ( !empty($req->year) ) {
            $q_items = [];
            foreach ($question as $item) {
                if ( $item->year == $req->year ) {
                    $q_items[] = $item;
                }
            }
            $question = $q_items;
        }
        if ( !empty($req->month) ) {
            $q_items = [];
            foreach ($question as $item) {
                if ( $item->month == $req->month ) {
                    $q_items[] = $item;
                }
            }
            $question = $q_items;
        }
        if ( !empty($req->section) ) {
            $q_items = [];
            foreach ($question as $item) {
                if ( $item->section == $req->section ) {
                    $q_items[] = $item;
                }
            }
            $question = $q_items;
        }
        if ( !empty($req->q_code) ) {
            $q_items = [];
            foreach ($question as $item) {
                if ( $item->q_code == $req->q_code ) {
                    $q_items[] = $item;
                }
            }
            $question = $q_items;
        }
        if ( !empty($req->q_num) ) {
            $q_items = [];
            foreach ($question as $item) {
                if ( $item->q_num == $req->q_num ) {
                    $q_items[] = $item;
                }
            }
            $question = $q_items;
        }

        $categories = Category::all();
        $courses = Course::all();
        $codes = ExamCodes::all();
        $data = $req->all();

        return view('Visitor.Question.Filter_Question', 
        compact('q_items', 'data', 'categories', 'courses', 'codes'));
    } 
 
    public function q_page( $id ){
        
        $reports = ReportQuestionList::all();

        if ( empty(auth()->user()) ) {
            if ( !session()->has('previous_page') ) {
                session(['previous_page' => url()->current()]);
            }
            return redirect()->route('login.index');
        }
        else{  
            $payments = PaymentPackageOrder::
            where('state', 1)
            ->with('pay_req')
            ->with('package')
            ->get();
            $user = User::where('id', auth()->user()->id)
            ->first();

            $small_package = SmallPackage::where('user_id', auth()->user()->id)
            ->where('module', 'Question')
            ->where('number', '>', 0)
            ->first();

            if ( !empty($small_package) ) { 
                SmallPackage::where('user_id', auth()->user()->id)
                ->where('module', 'Question')
                ->where('number', '>', 0)
                ->update([
                    'number' => $small_package->number - 1
                ]);
                // Return Exam
                $question = Question::where('id', $id)
                ->first();
                
                return view('Visitor.Question.Show_Question', compact('question', 'reports'));
            }

            foreach ( $payments as $item ) { 
                $newTime = Carbon::now()->subDays($item->package->number);
                $question = Question::where('id', $id)
                ->first();

                if ( $item->package->module == 'Question' && 
                $item->pay_req->user_id == auth()->user()->id &&
                $item->date > $newTime &&
                $item->number > 0
                 ) 
                 {  

                    PaymentPackageOrder::where('id', $item->id)
                    ->update([
                        'number' => $item->number - 1
                    ]);
                     return view('Visitor.Question.Show_Question', compact('question', 'reports')); 
                }
            } 
            $package = Package::
            where('module', 'Question')
            ->get();
            return view('Student.Exam.Exam_Package', compact('package'));
             
            
        }
    }

    public function q_package(){ 
        $package = Package::
        where('module', 'Question')
        ->get();
        return view('Student.Exam.Exam_Package', compact('package'));
    }

    public function q_sol( Request $req ){ 
        $timer_val = json_decode($req->timer_val);
        $timer_val = $timer_val->houres . ':' . $timer_val->minutes . ':' . $timer_val->seconds;
        $arr = [];
        $ans = false;
        $question = [];
        if ( isset($req->q_answers[0]) ) {
            $solve = json_decode($req->q_answers[0]);
           // {"q_id":18,"mcq_id":"1","answer":"A"}
           $question = Question::where('id', $solve->q_id)
           ->first();
           $arr['question_id'] = $solve->q_id;
           if ( isset($question->mcq[0]->mcq_answers) ) {
                $stu_solve = $question->mcq[0]->mcq_answers;
                if ( $stu_solve == isset($solve->answer) ? $solve->answer : 0 ) {
                     $ans = true;
                }
           }
        }
        else {
            // "q_grid_answers":["{\"q_id\":1}"],"q_grid_ans":["1"]}
            $q_id = json_decode($req->q_grid_answers[0]);
            $question = Question::where('id', $q_id->q_id)
            ->first();
            $arr['question_id'] = $q_id->q_id;
            $solve = $question->g_ans;

            foreach ($solve as $item) {
                if ( strpos($req->q_grid_ans[0], '/') ) {
                    $arr_ans = explode('/', $req->q_grid_ans[0]);
                    $answer = floatval($arr_ans[0]) / floatval($arr_ans[1]);
                    if ( floatval($item->grid_ans) == $answer || 
                    (floatval($item->grid_ans) - $answer < .06 && floatval($item->grid_ans) - $answer > 0 ) ||
                    ($answer - floatval($item->grid_ans) < .06 && $answer - floatval($item->grid_ans) > 0 ) ) {
                        $ans = true;
                    }
                    else {
                        $mistakes[] = $question;
                    }
                }
                if ( $item->grid_ans == $req->q_grid_ans[0] ) {
                    $ans = true;
                }
            }
          
            
        } 
        $arr['user_id'] = auth()->user()->id;
        $arr['answer'] = $ans;
        $arr['time'] = $timer_val;
       // $arr['time'] = ;
        QuestionHistory::create($arr);
        $reports = ReportVideoList::all();
        return view('Visitor.Question.Grade', compact('ans', 'question', 'reports'));
    }
}
