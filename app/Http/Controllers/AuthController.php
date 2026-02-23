<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Illuminate\Validation\Validator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Carbon\Carbon;   


class AuthController extends Controller
{
    public function auth_index(){
        // dd("dfgthyujikol");
        return view('auth.index');
    }
    
    
    public function AuthLogin(Request $request) 
    {
        
        $request->validate([
            'email' => 'required',
            'password' => 'required',
        ]);
    
        $login = DB::table('users')
            ->where('email', $request['email'])
            ->where('password', $request['password']) // ⚠️ Not secure, consider using Hash::check
            ->where('verification', '2')
            ->first();
    
        if ($login == NULL) {
            session()->flash('msg_class', 'danger');
            session()->flash('msg', 'The provided credentials do not match our records.');
            return redirect()->route('login');
        } else {
            // ✅ Store ID in session
            $request->session()->put('id', $login->id);
            $request->session()->put('login_time', now());

            
    
            // ✅ Decode permissions and store in session
            $permissions = json_decode($login->permissions, true); // assuming it's like ["1","2","3"]
              // dd($permissions);

            $request->session()->put('permissions', $permissions);
            
    
            return redirect()->route('dashboard'); 
        }
    }

   
    public function AuthLogout(Request $request): RedirectResponse
    {
        Auth::logout(); 
        $request->session()->invalidate(); 
        $request->session()->regenerateToken(); 
        return redirect('/');
    }

    // Change_Password
    public function ChangePasswordIndex()
    {
            $user = Auth::user(); 
            return view('changePassword.index')->with('user',$user);
        }
        
    
    
    
    public function password_change(Request $request)
{
    $validator = Validator::make($request->all(), [
        'email'     => 'required|email',
        'password'  => 'required',
        'npassword' => 'required|min:6',
    ]);

    if ($validator->fails()) {
        return redirect()->route('change_password')
            ->withErrors($validator)
            ->withInput();
    }

    $user = DB::table('users')
        ->where('email', $request->email)
        ->first();

    if (!$user) {
        session()->flash('msg_class', 'danger');
        session()->flash('msg', 'The provided email does not match our records.');
        return redirect()->route('change_password')->withInput();
    }

    // ❌ current password mismatch
    if ($request->password !== $user->password) {
        session()->flash('msg_class', 'danger');
        session()->flash('msg', 'Current password is incorrect.');
        return redirect()->route('change_password')->withInput();
    }

    // ✅ PASSWORD UPDATE + GLOBAL LOGOUT FLAG
    DB::table('users')
    ->where('id', $user->id)
    ->update([
        'password' => $request->npassword,
        'password_changed_at' => DB::raw('CURRENT_TIMESTAMP')
    ]);
    //dd($affected);

    // ✅ current system logout
    $request->session()->flush();

    session()->flash('msg_class', 'success');
    session()->flash('msg', 'Password changed successfully. Please login again.');

    return redirect()->route('login');
}

}
