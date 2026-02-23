<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use DB;

class CheckUserSession
{
    public function handle($request, Closure $next)
    {
        // ✅ Check if user is logged in
        if (session()->has('id')) {

            $user = DB::table('users')
                ->where('id', session('id'))
                ->first();

            // ❌ Invalid session conditions
            if (
                !$user ||
                $user->session_id !== session()->getId() ||
                ($user->role_id == 4 && $user->status == 0) ||
                (
                    session('password_changed_at') &&
                    session('password_changed_at') != $user->password_changed_at
                )
            ) {
                session()->flush();
                return redirect()->route('login');
            }
        }

        return $next($request);
    }
    
    
    
    
}
