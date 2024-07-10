<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\SessionAttendance;
use App\Models\User;
use App\Models\PaymentRequest;
use App\Models\Category;
use App\Models\Course;
use App\Models\Chapter;
use App\Models\Lesson;
use App\Models\Question;
use App\Models\ExamCodes;
use App\Models\Exam;
use App\Models\StudentQuizze;

class Ad_ReportsController extends Controller
{
    
    public function ad_live_report( Request $req ){
        if ( !empty($req->from) && empty($req->to) ) {
            $students = SessionAttendance::
            where('created_at', '>=', $req->from)
            ->simplePaginate(10);
            $stu_count = SessionAttendance::
            where('created_at', '>=', $req->from)
            ->get();
        }
        elseif ( empty($req->from) && !empty($req->to) ) {
            $students = SessionAttendance::
            where('created_at', '<=', $req->to)
            ->simplePaginate(10);
            $stu_count = SessionAttendance::
            where('created_at', '<=', $req->to)
            ->get();
        }
        elseif ( !empty($req->from) && !empty($req->to) ) {
            $students = SessionAttendance::
            where('created_at', '>=', $req->from)
            ->where('created_at', '<=', $req->to)
            ->simplePaginate(10);
            $stu_count = SessionAttendance::
            where('created_at', '>=', $req->from)
            ->where('created_at', '<=', $req->to)
            ->get();
        }
        else{
            $students = SessionAttendance::simplePaginate(10);
            $stu_count = SessionAttendance::get();
        }
        $data = $req->all();

        return view('Admin.Reports.Live.Live', compact('students', 'data', 'stu_count'));
    }

    public function ad_grade_report( Request $req ){
        $data = $req->all();
        if ( !empty($req->grade)) {
            $students = User::where('grade', $req->grade)
            ->where('position', 'student')
            ->simplePaginate(10);
            $stu_count = User::where('grade', $req->grade)
            ->where('position', 'student')
            ->get();
        } else {
            $students = User::where('position', 'student')
            ->simplePaginate(10);
            $stu_count = User::where('position', 'student')
            ->get();
        }
        

        return view('Admin.Reports.Grade.Grade', compact('students', 'data', 'stu_count'));
    }

    public function ad_payment_report( Request $req ){
        if ( !empty($req->from) && empty($req->to) ) {
            $payment = PaymentRequest::
            where('state', 'Approve')
            ->where('module', 'Chapters')
            ->where('created_at', '>=', $req->from)
            ->get();
        }
        elseif ( empty($req->from) && !empty($req->to) ) {
            $payment = PaymentRequest::
            where('state', 'Approve')
            ->where('module', 'Chapters')
            ->where('created_at', '<=', $req->to)
            ->get();
        }
        elseif ( !empty($req->from) && !empty($req->to) ) {
            $payment = PaymentRequest::
            where('state', 'Approve')
            ->where('module', 'Chapters')
            ->where('created_at', '>=', $req->from)
            ->where('created_at', '<=', $req->to)
            ->get();
        }
        else{
            $payment = PaymentRequest::
            where('state', 'Approve')
            ->where('module', 'Chapters')
            ->get();
        }
        $data = $req->all();

        return view('Admin.Reports.Payment.Payment', compact('data', 'payment'));
    }
    
    public function ad_course_report( Request $req ){
        $data = $req->all();
        $payment_req = PaymentRequest::
        where('module', 'Chapters')
        ->where('state', 'Approve')
        ->with('user')
        ->get();
        $payment = [];
        if ( !empty($req->course_id) ) {
            foreach ( $payment_req as $item ) {
                foreach ( $item->chapters_order as $element ) { 
                    if ( $element->chapter->course_id == $req->course_id ) {
                        $item->course = $element->chapter->course->course_name;
                        $payment[$item->user_id] = $item;
                    }
                }
            }
        }
        else {
            foreach ( $payment_req as $item ) {
                foreach ( $item->chapters_order as $element ) {
                    $item->course = $element->chapter->course->course_name;
                    $payment[$item->user_id . ' ' . $element->chapter->course_id] = $item;
                }
            }
        }
        $categories = Category::all();
        $courses = Course::all();

        return view('Admin.Reports.Course.Course', 
        compact('data', 'payment', 'categories', 'courses'));
    }

    public function ad_exam_report( Request $req ){
        $categories = Category::all();
        $courses = Course::all();
        $chapters = Chapter::all();
        $lessons = Lesson::all();
        $questions = Question::
        orderByDesc('id')
        ->get();
        $exam_items = Exam::get();
        $exams = ExamCodes::all();

        return view('Admin.Reports.Exam.Exam', 
        compact('categories', 'courses', 'chapters', 'lessons', 'questions', 'exams', 'exam_items'));
    
    }

    public function ad_report_filter_exam( Request $req ){
        $categories = Category::all();
        $courses = Course::all();
        $chapters = Chapter::all();
        $lessons = Lesson::all(); 
        $exams = ExamCodes::all();
        $exam_items = Exam::get();
        $filter = true;

        if (isset($req->exam_id)) {
            $exam = Exam::where('id', $req->exam_id)
            ->first();
            $questions = $exam->question->pluck('id');

            $data = Question::
            select('*', 'questions.id AS q_id')
            ->leftJoin('lessons', 'questions.lesson_id', '=', 'lessons.id')
            ->leftJoin('chapters', 'lessons.chapter_id', '=', 'chapters.id')
            ->leftJoin('courses', 'chapters.course_id', '=', 'courses.id')
            ->whereIn('questions.id', $questions)
            ->get();
        }
        else {
            $data = Question::
            select('*', 'questions.id AS q_id')
            ->leftJoin('lessons', 'questions.lesson_id', '=', 'lessons.id')
            ->leftJoin('chapters', 'lessons.chapter_id', '=', 'chapters.id')
            ->leftJoin('courses', 'chapters.course_id', '=', 'courses.id')
            ->get();
        }
        
        $questions = $data;
        if (isset($req->category_id)) {
            $questions = [];
            foreach($data as $item){
                if ( $item->category_id == $req->category_id ) {
                    $questions[] = $item;
                }
            }
            $data = $questions;
        }
        if (isset($req->course_id)) {
            $questions = [];
            foreach($data as $item){
                if ( $item->course_id == $req->course_id ) {
                    $questions[] = $item;
                }
            }
            $data = $questions;
        }
        if (isset($req->chapter_id)) {
            $questions = [];
            foreach($data as $item){
                if ( $item->chapter_id == $req->chapter_id ) {
                    $questions[] = $item;
                }
            }
            $data = $questions;
        }
        if (isset($req->lesson_id)) {
            $questions = [];
            foreach($data as $item){
                if ( $item->lesson_id == $req->lesson_id ) {
                    $questions[] = $item;
                }
            }
            $data = $questions;
        }
        if (isset($req->q_type)) {
            $questions = [];
            foreach($data as $item){
                if ( $item->q_type == $req->q_type ) {
                    $questions[] = $item;
                }
            }
            $data = $questions;
        }
        if (isset($req->month)) {
            $questions = [];
            foreach($data as $item){
                if ( $item->month == $req->month ) {
                    $questions[] = $item;
                }
            }
            $data = $questions;
        }
        $data = $req->all();

        return view('Admin.Reports.Exam.Exam', 
        compact('categories', 'courses', 'chapters', 'filter', 'lessons', 
        'questions', 'exams', 'data', 'exam_items'));
    }

    public function ad_score_sheet_report( Request $req ){
        $students = User::where('position', 'student')
        ->get();

        return view('Admin.Reports.ScoreSheet.ScoreSheet', compact('students'));
    }

    public function score_sheet_student( $user_id ){
        $lessons = Lesson::all();
        $chapters = Chapter::all();
        $courses = Course::all();
        $student = User::all();

        return view('Admin.Reports.ScoreSheet.Student_ScoreSheet', 
        compact('lessons', 'chapters', 'courses', 'student'));
    } 

    

    public function ad_lesson_score_sheet( Request $req ) {
        $data = StudentQuizze::
        where('student_id', $req->user_id)
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
