<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\PaymentRequest;

class ScoreController extends Controller
{
    public function score_sheet(){
        $payment_req = PaymentRequest::
        where('user_id', auth()->user()->id)
        ->get();

        return view('Student.ScoreSheet.ScoreSheet', compact('payment_req'));
    }
}
