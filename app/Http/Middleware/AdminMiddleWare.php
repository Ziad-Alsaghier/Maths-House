<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Models\LoginUser;
use Carbon\Carbon;

class AdminMiddleWare
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $now = Carbon::now();
        $timeMinus120Minutes = $now->subMinutes(300);
        $l_user = LoginUser::
        where('type', 'web')
        ->where('user_id', auth()->user()->id)
        ->where('created_at', '>=', $timeMinus120Minutes)
        ->first();
        if( !empty($l_user) && auth()->user()->position == 'admin' or auth()->user()->position == 'user_admin' ){
            return $next($request);
        }
        else{
            return redirect()->route('login.index');
        }
    }
}
