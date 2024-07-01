<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\PaymentPackageOrder;
use App\Models\PaymentRequest;
use App\Models\Package;

use Carbon\Carbon;

class Stu_MyPackagesController extends Controller
{
    
    public function my_packages(){
        $packages = Package::all();
        foreach ( $packages as $item ) {
            $newTime = Carbon::now()->subDays($item->duration); 
            $payment = PaymentPackageOrder::
            where('package_id', $item->id)
            ->get();

            foreach ( $payment as $value ) {
                
                if ( $value->date < $newTime ) 
                 {  
                    $value->delete();
                 }
            }
        }

        $exam = PaymentPackageOrder::
        leftJoin('payment_requests', 'payment_package_order.payment_request_id', '=', 'payment_requests.id')
        ->leftJoin('packages', 'payment_package_order.package_id', '=', 'packages.id')
        ->where('payment_package_order.state', 1)
        ->where('packages.module', 'Exam')
        ->where('payment_package_order.user_id', auth()->user()->id)
        ->sum('payment_package_order.number');
        
        $questions = PaymentPackageOrder::
        leftJoin('payment_requests', 'payment_package_order.payment_request_id', '=', 'payment_requests.id')
        ->leftJoin('packages', 'payment_package_order.package_id', '=', 'packages.id')
        ->where('payment_package_order.state', 1)
        ->where('packages.module', 'Question')
        ->where('payment_package_order.user_id', auth()->user()->id)
        ->sum('payment_package_order.number');
        
        $live = PaymentPackageOrder::
        leftJoin('payment_requests', 'payment_package_order.payment_request_id', '=', 'payment_requests.id')
        ->leftJoin('packages', 'payment_package_order.package_id', '=', 'packages.id')
        ->where('payment_package_order.state', 1)
        ->where('packages.module', 'Live')
        ->where('payment_package_order.user_id', auth()->user()->id)
        ->sum('payment_package_order.number');
        
        return view('Student.Package.Package', compact('exam', 'questions', 'live'));
    }

}
