<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\User;
use App\Models\Admin_role;
use App\Models\Marketing;
use App\Models\Category;
use App\Models\Course;
use App\Models\Wallet;
use App\Models\PaymentOrder;
use App\Models\LiveLesson;
use App\Models\StudentSession;
use App\Models\LiveCourse;
use App\Models\TeacherCourse;
use App\Models\SessionAttendance;
use App\Models\Session;

class UserController extends Controller
{
    // Comment

    public function student(){
        $students = User::where('position', 'student')
        ->orderByDesc('id')
        ->get();

        return view('Admin.Users.Students', compact('students'));
    }

    public function student_filter(Request $req){
        $students = User::
        where('grade', $req->grade)
        ->orderByDesc('id')
        ->get();

        return view('Admin.Users.Students', compact('students'));
    }

    public function stu_info(){
        $students = User::where('position', 'student')
        ->orderByDesc('id')
        ->get();

        return view('Admin.Users.Students', compact('students'));
    }

    public function stu_details( $id ){
        $user = User::where('id', $id)
        ->first();

        return view('Admin.Users.StudentDetails.StudentDetails', compact('user'));
    }

    public function stu_parent_details( $id ){
        $user = User::where('id', $id)
        ->first();

        return view('Admin.Users.StudentDetails.ParentDetails', compact('user'));
    }

    public function stu_academic( $id ){
        $user = User::where('id', $id)
        ->first();
        $categories = Category::all();
        $courses = Course::all();
        $student_id = $id;
        $stu_sessions = StudentSession::where('student_id', $id)
        ->get();

        return view('Admin.Users.StudentDetails.Academic', 
        compact('user', 'categories', 'courses', 'student_id', 'stu_sessions'));
    }

    public function stu_sessions(){
        $stu_sessions = StudentSession::where('student_id', $id)
        ->with('course_api')
        ->get();
        
        return response()->json([
            'courses' => $stu_sessions
        ]);
    }

    public function add_stu_academic( Request $req ){

        LiveCourse::where('user_id', $req['student_id'])
        ->delete();

        foreach ($req->coursesList as $item ) {
            LiveCourse::create([
                'course_id' => $item['courseID'],
                'user_id' => $req['student_id'],
            ]);
        }

        return response()->json([
            'success' => $req->coursesList
        ]);
    }

    public function api_stu_academic( Request $req ){
 
        $data = LiveCourse::where('user_id', $req['student_id'])
        ->with('course')
        ->get();

        return response()->json([
            'data' => $data
        ]);
    }

    public function stu_live_content( $id ){ 
        
        $user = User::where('id', $id)
        ->first();
        $courses_names = $user->courses_live;
        $courses = $user->courses_live; 

        return view('Admin.Users.StudentDetails.Live', compact('courses', 'user', 'courses_names'));
    }

    public function stu_live_course_content( $id, $course_id ){
        $user = User::where('id', $id)
        ->first();
        $courses_names = $user->courses_live;
        $courses = $user->course_live_item($course_id)->get();

        return view('Admin.Users.StudentDetails.Live', compact('courses', 'user', 'courses_names'));
    }

    public function live_attend( $users_id, $lesson_id, Request $req ){

        $sessions = Session::where('lesson_id', $lesson_id)
        ->pluck('id');
        return $sessions;

        if ( $req->attend == 'Attend' ) {
            LiveLesson::create([
                'user_id' => $users_id,
                'lesson_id' => $lesson_id,
            ]);
            foreach ($sessions as $key => $item) {
                SessionAttendance::create([
                    'user_id' => $users_id,
                    'session_id' => $item
                ]);
            }
        }
        else {
            LiveLesson::
            where( 'user_id' , $users_id)
            ->where('lesson_id', $lesson_id)
            ->delete();
            SessionAttendance::whereIn('session_id', $sessions)
            ->where('user_id', $users_id)
            ->delete();
        }

        return redirect()->back();
    } 

    public function add_student(){
        return view('Admin.Users.AddStudent');
    }

    public function student_add( Request $req ){
       
        $user = User::where('email', $req->email)
        ->first();
        if ( !empty($user) ) {
            session()->flash('faild','Email is Duplicated');
            $students = User::where('position', 'student')
            ->orderByDesc('id')
            ->get();
            $data = $req->all();
    
            return view('Admin.Users.Students', compact('students', 'data'));
        }
        $user = User::where('nick_name', $req->nick_name)
        ->first();
        if ( !empty($user) ) {
            session()->flash('faild','Nickname is Duplicated');
            $students = User::where('position', 'student')
            ->orderByDesc('id')
            ->get();
            $data = $req->all();
    
            return view('Admin.Users.Students', compact('students', 'data'));
        }
        $arr = $req->only('f_name', 'l_name', 'nick_name', 'email', 'phone', 'parent_email', 'parent_phone');
        $req->validate([
        'nick_name'    => 'required',
        'email'        => 'required|email',
        'phone'        => 'required',
        ]);
        $arr['password'] = bcrypt($req->password);
        $arr['position'] = 'student';
        $arr['state'] = 'Show';
        User::create($arr);

        return redirect()->back();
    }

    public function stu_edit( Request $req ){
        $arr = $req->only('f_name', 'l_name', 'nick_name', 'email', 'phone', 'parent_email', 'parent_phone');
        $req->validate([
        'nick_name'         => 'required',
        'email'        => 'required|email',
        'phone'        => 'required',
        ]);
        $arr['state'] = $req->state == 1 ? 'Show': 'hidden';
        if ( !empty($req->password) ) {
            $arr['password'] = bcrypt($req->password);
        } 
        
        User::
        where('id', $req->user_id)
        ->update($arr);

        return redirect()->back();
    }

    public function del_stu( $id ){
        User::where('id', $id)
        ->delete();

        return redirect()->back();
    }

    public function del_student( $id ){
        User::where('id', $id)
        ->delete();

        return redirect()->route('student');
    }

    public function student_payments( $id ){
        $data = PaymentOrder::
        whereHas('pay_req', function( $query )use($id){
            $query->where('user_id', $id);
        })
        ->where('state', 1)
        ->get();

        return view('Admin.Users.Student_History', compact('data'));
    }

    public function teacher(){
        $teachers = User::
        select('*', 'users.id as u_id')
        ->where('position', 'teacher')
        ->orderByDesc('u_id')
        ->get();
        $categories = Category::all();
        $courses = Course::all();

        return view('Admin.Users.Teachers',
        compact('teachers', 'categories', 'courses'));
    }

    public function teacher_filter(Request $req){
        $teachers = User::
        select('*', 'users.id as u_id')
        ->leftJoin('courses', 'courses.id', '=', 'users.course_id')
        ->leftJoin('categories', 'categories.id', '=', 'users.category_id')
        ->where('course_id', $req->t_course)
        ->orderByDesc('u_id')
        ->simplePaginate(10);
        $categories = Category::all();
        $courses = Course::all();

        return view('Admin.Users.Teachers',
        compact('teachers', 'categories', 'courses'));
    }
    
    public function ad_add_wallet( Request $req ){
        $arr = $req->only('wallet', 'student_id');
        $arr['date'] = now();
        $arr['state'] = 'Approve';
        Wallet::create($arr);
        return redirect()->back();
    }

    public function teacher_edit( Request $req ){
        $arr = $req->only('nick_name', 'email', 'phone');
        
        $req->validate([
            'nick_name'    => 'required',
            'email'        => 'required|email',
            'phone'        => 'required',
            ]);
        if ( !empty($req->password) ) {
            $arr['password'] = bcrypt($req->password);
        }
        if ( !empty($req->image) ) {
            $img_name = null;
            extract($_FILES['image']);
            $extension_arr = ['png', 'jpg', 'jpeg', 'svg', 'webp'];
            $extension = explode('.', $name);
            $extension = end($extension);
            $extension = strtolower($extension);
            if ( in_array($extension, $extension_arr) ) {
                $img_name = rand(0, 1000) . now() . $name;
                $img_name = str_replace([' ', ':', '-'], 'X', $img_name);
            }
            $arr['image'] = $img_name;
            
            move_uploaded_file($tmp_name, 'images/users/' . $img_name);
        }
        User::where('id', $req->user_id)
        ->update($arr);
        TeacherCourse::where('user_id', $req->user_id)
        ->delete();
        foreach ($req->course_id as $item) {
            TeacherCourse::create([
                'user_id' => $req->user_id,
                'course_id' => $item,
            ]);
        }
        session()->flash('success','Teacher Updated Successfully');
        return redirect()->back();
    }

    public function del_teacher($id){
        User::where('id', $id)
        ->where('position', '!=', 'super_admin')
        ->delete();

        return redirect()->back();
    }

    public function teacher_add(){
        $categories = Category::all();
        $courses    = Course::all();
        return view('Admin.Users.AddTeacher', compact('categories', 'courses'));
    }

    public function add_teacher( Request $req ){
       
        $user = User::where('email', $req->email)
        ->first();
        if ( !empty($user) ) {
            session()->flash('faild','Email is Duplicated');
            $teachers = User::
            select('*', 'users.id as u_id')
            ->where('position', 'teacher')
            ->orderByDesc('u_id')
            ->get();
            $categories = Category::all();
            $courses = Course::all();
            $data = $req->all();
    
            return view('Admin.Users.Teachers',
            compact('teachers', 'categories', 'courses', 'data')); 
        }
        $arr = $req->only('nick_name', 'email', 'phone');
        $req->validate([
            'nick_name'  => 'required',
            'email' => 'required|email',
            'phone' => 'required',
            'course_id' => 'required',
            ]);
        $arr['password'] = bcrypt($req->password);
        $arr['position'] = 'teacher';
        $arr['state'] = 'Show';
        extract($_FILES['image']);
        $img_name = null;
        if ( !empty($name) ) {
            $extention_arr = ['jpg', 'jpeg', 'png', 'svg'];
            $extention = explode('.', $name);
            $extention = end($extention);
            $extention = strtolower($extention);
            if ( in_array($extention, $extention_arr)) {
                $img_name = now() . rand(1, 10000) . $name;
                $img_name = str_replace([' ', ':', '-'], 'X', $img_name);
                $arr['image'] = $img_name;
            }
        }

        $teacher = User::create($arr);
        foreach ($req->course_id as $item) {
            TeacherCourse::create([
                'user_id' => $teacher->id,
                'course_id' => $item,
            ]);
        }
        move_uploaded_file($tmp_name, 'images/users/' . $img_name);
        session()->flash('success','Teacher Added Successfully');
        return redirect()->back();
    }

    public function stu_search_api( Request $request ){
        $students = User::
        where('nick_name', 'like', "%" . $request->data . "%")
        ->where('position', 'student')
        ->orWhere('email', 'like', "%" . $request->data . "%")
        ->where('position', 'student')
        ->orWhere('phone', 'like', "%" . $request->data . "%")
        ->where('position', 'student')
        ->get();

        return response()->json([
            'students' => $students
        ]);
    }

    public function teacher_search_api( Request $request ){
        $teachers = User::
        where('nick_name', 'like', "%" . $request->data . "%")
        ->where('position', 'teacher')
        ->orWhere('email', 'like', "%" . $request->data . "%")
        ->where('position', 'teacher')
        ->orWhere('phone', 'like', "%" . $request->data . "%")
        ->where('position', 'teacher')
        ->get();

        return response()->json([
            'teachers' => $teachers
        ]);
    }

}
