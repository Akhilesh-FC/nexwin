<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class SessionTimeout
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    
    protected $timeout = 300; // 5 minutes

    public function handle(Request $request, Closure $next)
    {
        if (session()->has('id')) {

            if (session()->has('last_activity')) {

                if ((time() - session('last_activity')) > $this->timeout) {
                    session()->flush();
                    return redirect()->route('login')
                        ->with('msg', 'Session expired due to inactivity.');
                }
            }

            session(['last_activity' => time()]);
        }

        return $next($request);
    }
}