<?php

namespace App\Http\Controllers\login;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use App\Mail\Sign_upEmail;

use App\Models\User;
use App\Models\ConfirmSign;
use App\Models\LoginUser;
use App\Models\Country;
use App\Models\City;

use Carbon\Carbon;

class Logincontroller extends Controller
{

        public function index(){
                $now = Carbon::now();
                $timeMinus120Minutes = $now->subMinutes(300);
                if ( auth()->user() ) {
                        $l_user = LoginUser::
                        where('type', 'web')
                        ->where('user_id', auth()->user()->id)
                        ->where('created_at', '>=', $timeMinus120Minutes)
                        ->first();
                }
                if ( $l_user && isset(auth()->user()->position) && auth()->user()->position == 'student' ) {
                        return redirect()->route('stu_dashboard');
                }
                if ( $l_user && isset(auth()->user()->position) && auth()->user()->position == 'user_admin' ) {
                        return redirect()->route('dashboard');
                }
                if ( $l_user && isset(auth()->user()->position) && auth()->user()->position == 'admin' ) {
                        return redirect()->route('dashboard');
                }
                if ( $l_user && isset(auth()->user()->position) && auth()->user()->position == 'teacher' ) {
                        return redirect()->route('t_dashboard');
                }
                if ( $l_user && isset(auth()->user()->position) && auth()->user()->position == 'affilate' ) {
                        return redirect()->route('stu_affilate');
                }
                return view('pages.authanticated.login');            
        }

        public function store(Request $request){
                
                $request->validate([
                'email'=> 'required|email',
                'password'=> 'required'
                ],[
                'email.required'=> 'Email or Password Invalid',
                'email.email'=> 'Email or Password Invalid',
                'password.required'=> 'Email or Password Invalid',
                ]);


                        $user = User::where('email',$request->input('email'))->first();
                        if(!$user){
                                return redirect()->route('login.index')->withErrors(['error'=>'The Email or Password Invalid']);

                        }
                        if ($user->state == 'hidden') {
                                return redirect()->route('login.index')->withErrors(['error'=>'The Email Is Not Enable']);
                        }
                        if(!password_verify($request->input('password'),$user->password)){
                                return redirect()->route('login.index')->withErrors(['error'=>'The  Password Invalid']);
                        }
                        $now = Carbon::now();
                        $timeMinus120Minutes = $now->subMinutes(120);
                        $l_user = LoginUser::
                        where('type', 'web') 
                        ->where('user_id', $user->id)
                        ->where('created_at', '>=', $timeMinus120Minutes)
                        ->first();
                        if ( $l_user ) {
                                return redirect()->route('login.index')->withErrors(['error'=>'You are logged in from another device.']);
                        }

			Auth::loginUsingId($user->id);

                        $credentials = $request->only('email','password');

                                
                        $authantecated = Auth::attempt($credentials);
                        
                        if($authantecated){
                                $user = User::where('email',$request->email)->first();
                                $token = $user->createToken("user")->plainTextToken;
                                $user->token =$token ;

                                                        
                                if ( session()->has('previous_page') ) {
                                        return redirect($request->session()->get('previous_page'));
                                }
                                LoginUser::create([
                                'type' => 'web',
                                'user_id'=> $user->id]);
                                if( $user->position == 'admin'){
                                        return redirect()->route('dashboard')->with(['success'=>'Loged In']);
                                }
                                elseif( $user->position == 'user_admin'){
                                        return redirect()->route('dashboard')->with(['success'=>'Loged In']);
                                }
                                elseif( $user->position == 'teacher'){
                                        return redirect()->route('t_dashboard')->with(['success'=>'Loged In']);
                               }
                               elseif( $user->position == 'student'){
                                        return redirect()->route('stu_dashboard');
                               }
                               elseif( $user->position == 'affilate'){
                                        return redirect()->route('stu_affilate');
                               }
                                return view();
                        }
                        if(!$authantecated){
                                return redirect()->route('login.index')->withErrors(['error'=>'The Email or Password Invalid']);
                        }

                           
        }
        

        public function market_login(Request $request){
                $request->validate([
                'email'=> 'required|email',
                'password'=> 'required'
                ],[
                'email.required'=> 'Email or Password Invalid',
                'email.email'=> 'Email or Password Invalid',
                'password.required'=> 'Email or Password Invalid',
                ]);

                        $user = User::where('email',$request->input('email'))->first();
                        if(!$user){
                                return redirect()->back();

                        }
                        if ($user->state == 'hidden') {
                                return redirect()->back();
                        }
                        if(!password_verify($request->input('password'),$user->password)){
                                return redirect()->back();

                        }
                        $now = Carbon::now();
                        $timeMinus120Minutes = $now->subMinutes(120);
                        $l_user = LoginUser::
                        where('type', 'web') 
                        ->where('user_id', $user->id)
                        ->where('created_at', '>=', $timeMinus120Minutes)
                        ->first();
                        if ( $l_user ) {
                                return redirect()->route('login.index')->withErrors(['error'=>'You are logged in from another device.']);
                        }
			Auth::loginUsingId($user->id);

                        $credentials = $request->only('email','password');

                                
                        $authantecated = Auth::attempt($credentials);
                        
                        if($authantecated){
                                $user = User::where('email',$request->email)->first();
                                $token = $user->createToken("user")->plainTextToken;
                                $user->token =$token ;

                                LoginUser::create([
                                'type' => 'web', 
                                'user_id'=> $user->id]);
                                
                                if( $user->position == 'admin'){
                                        return redirect()->route('course_payment');
                                }
                                elseif( $user->position == 'user_admin'){
                                        return redirect()->route('course_payment');
                                }
                                elseif( $user->position == 'teacher'){
                                        return redirect()->route('course_payment');
                                }
                                elseif( $user->position == 'student'){
                                        return redirect()->route('course_payment');
                                }
                                return view();
                        }
                        if(!$authantecated){
                                return redirect()->back();
                        }

                           
        }
        
        public function destroy(){
                LoginUser::where('type' , 'web')
                ->where('user_id', auth()->user()->id)
                ->delete();
                Auth::logout();
                return redirect()->route('login.index');

        } 
        public function delete_account($id){
                LoginUser::where('type' , 'web')
                ->where('user_id', auth()->user()->id)
                ->delete();
                Auth::logout();
                return redirect()->route('login.index');

        } 

        public function sign_up(){
               $countries = Country::all();
                $cities = City::all();
                return view('pages.authanticated.sign_up', 
                compact('countries', 'cities'));
        }

        public function sign_up_add( Request $req ){

                session()->flash('data', $req->all());
                $req->validate([
                        'f_name'=>'required',
                        'l_name'=>'required',
                        'nick_name'=>'required',
                        'phone'=>'required',
                        'email' => 'email|required'
                ]);
                        
                if ( $req->password != $req->conf_password ) {
                        session()->flash('faild','Confirm Password Wrong');
                        return redirect()->back();
                }
                 
                $arr = $req->only('f_name', 'l_name', 'email', 'nick_name', 'phone', 'city_id', 'grade');
                $arr['position'] = 'student';
                $arr['state'] = 'hidden';
                $arr['password'] = bcrypt($req->password);
                $code = rand(0, 10000);

                $email = $arr['email'];
                $nick_name = User::where('nick_name',$req->nick_name)->first();
                $check = User::where('email',$email)->first();

                if( !empty($nick_name) ){
                        return redirect()->back()->withErrors(['nick_name'=>'This Nick Name Already Exist']) ; 
                }
                if( !empty($check) ){
                        return redirect()->back()->withErrors(['email'=>'This Email Already Exist']) ; 
                }
                $user = ConfirmSign::create([
                        'code' => $code,
                        'email' => $req->email,
                ]); 
                $user = User::create($arr);
                Mail::To($req->email)->send(new Sign_upEmail($req->email, $code, $user->id));
                
                $token = $user->createToken("user")->plainTextToken;
                 $user->token =$token;
                 LoginUser::create([
                 'type' => 'web', 
                 'user_id'=> $user->id]);

                 $req->session()->put('email_session', 'You Should Verification Your Account By Email');
                return redirect()->route('stu_dashboard');
        }

        public function signup_confirm( Request $req ){
                $user = ConfirmSign::where('code', $req->code)
                ->where('email', $req->email)
                ->first();

                if ( !empty($user) ) {
                        User::where('email', $req->email)
                        ->update([
                                'state' => 'Show'
                        ]);
                        return redirect()->route('login.index');
                }
        }

        public function profile_confirm(Request $req){
                if ( $req->type == 'extra' ) {
                        User::where('id', $req->user_id)
                        ->update([
                                'extra_email' => $req->email
                        ]);
                }
                if ( $req->type == 'parent' ) {
                        User::where('id', $req->user_id)
                        ->update([
                                'parent_email' => $req->email
                        ]);
                }

                return redirect()->route('stu_dashboard');
        }

}
