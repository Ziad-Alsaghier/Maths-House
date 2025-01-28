<?php

namespace App\Http\Controllers\Admin\scoreSheet;

use App\Http\Controllers\Controller;
use App\Models\Course;
use App\Models\PaymentRequest;
use App\Models\User;
use Illuminate\Http\Request;

class ScoreSheetExamController extends Controller
{
    // This Is Controller About All Reports Of Exams
    public function __construct(private PaymentRequest $paymentRequest){}

   
    public function index(User $user){
        // This Function Return View Of Score Sheet Exam
            if(!$user){
                return redirect()->route('admin.dashboard')->with('error','User Not Found');
            }
        return view('Admin.scoreSheet.scoreSheetExam',compact('user'));
    }

    // public function show(User $user, Course $course){
    //     // This Function Return View Of Score Sheet Exam
    //     $paymentRequest = $this->paymentRequest->where('user_id',$user->id)
    //             ->with('order','order.course','order.course.exams')
    //         ->get();
    //     return view('Admin.scoreSheet.scoreSheetExam');
    // }
    public function show(User $user){
       url : http://maths-house.test/Admin/Report/ScoreSheet/get/courseExam/{user}
    // URL : name of the route : course_exam
   
     $paymentRequest = $this->paymentRequest->where('user_id',$user->id)
     ->with('order','order.course','order.course.exams')
     ->get();
        return response()->json([
            'success'=>'data returned Successfully',
            'data'=>$paymentRequest
        ]);
    }
}
