<?php

namespace App\Http\Controllers\Visitor;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Slider;
use App\Models\MarketingPopup;

class HomeController extends Controller
{
    public function index(){
        $slider = Slider::all();
        $popup = MarketingPopup::
        where('starts', '<=', now())
        ->where('ends', '>=', now())
        ->whereHas('popup_pages', function($query){
            $query->where('page_name', 'Home');
        })
        ->get();
        
        return view('Visitor.Home.Home', compact('slider', 'popup'));
    }
}
