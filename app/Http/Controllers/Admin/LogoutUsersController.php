<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\User;
use App\Models\LoginUser;

class LogoutUsersController extends Controller
{
    
    public function index(){
        $students = User::
        orderBy('position')
        ->get();

        return view('Admin.Settings.LogoutUser', compact('students'));
    }

    public function logout( $id ){
        LoginUser::where('user_id', $id)
        ->delete();
        

        return redirect()->back();
    }

}
