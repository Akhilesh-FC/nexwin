<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class ForceLogoutIfPasswordChanged
{
    public function handle($request, Closure $next)
    {
        if (session()->has('id') && session()->has('login_time')) {

            $user = DB::table('users')
                ->where('id', session('id'))
                ->first();

            if ($user && $user->password_changed_at) {

                $loginTime = Carbon::parse(session('login_time'));
                $passwordChangedAt = Carbon::parse($user->password_changed_at);

                if ($loginTime->lessThan($passwordChangedAt)) {
                    session()->flush();

                    return redirect()->route('login')
                        ->with('msg', 'Password changed. Please login again.');
                }
            }
        }

        return $next($request);
    }
}
