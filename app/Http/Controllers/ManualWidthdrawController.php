<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;

class ManualWidthdrawController extends Controller
{

public function manual_widthdrawl_index($id)
{
   $widthdrawls = DB::select("
    SELECT 
        withdraw_histories.*, 
        users.username AS uname, 
        users.mobile AS mobile,

        account_details.upi_id,
        account_details.name AS account_holder_name,
        account_details.account_number,
        account_details.ifsc_code

    FROM withdraw_histories 

    JOIN users 
        ON withdraw_histories.user_id = users.id 

    LEFT JOIN account_details 
        ON account_details.id = (
            SELECT id FROM account_details 
            WHERE account_details.user_id = withdraw_histories.user_id 
            ORDER BY id DESC LIMIT 1
        )

    WHERE withdraw_histories.type = 1
    AND withdraw_histories.status = ?
", [$id]);

    return view('manual_withdraw.index', compact('widthdrawls'))->with('id', $id);
}

    public function manual_success(Request $request, $id)
    {
        $request->validate([
            'pin' => 'required|numeric',
        ]);
    
        $pin = 2020;
        $inputPin = $request->input('pin');
    
        if ($inputPin != $pin) {
            return redirect()->back()
                ->withInput()
                ->withErrors(['pin' => 'Invalid pin. Please try again.']);
        }
    
        DB::table('withdraw_histories')
            ->where('id', $id)
            ->update(['status' => 2]);
    
        return redirect()->route('manual_widthdrawl', ['id' => $id, 'status' => 1])
                         ->with('success', 'Withdrawal approved successfully!');
    }

   

    public function manual_reject(Request $request, $id)
    {
        // Retrieve the withdrawal history for the given id
        $data = DB::table('withdraw_histories')->where('id', $id)->first();
        
        // If no data is found, handle it appropriately
        if (!$data) {
            // Handle the case where no withdrawal history is found
            return redirect()->route('manual_widthdrawl', ['status' => 1])->with('error', 'Withdrawal history not found.');
        }

        $amt = $data->amount;
        $useid = $data->user_id;

        // Check if the session has an 'id' key
        if ($request->session()->has('id')) {
            // Use Query Builder to perform updates safely
            DB::table('withdraw_histories')->where('id', $id)->update(['status' => 3]);
            DB::table('users')->where('id', $useid)->increment('wallet', $amt);
            
            // Redirect with route and parameters
            return redirect()->route('manual_widthdrawl', ['id' => $id,'status' => 1])->with('key', 'value');
        } else {
            // Redirect to login if session does not have 'id'
            return redirect()->route('login');
        }
    }

    public function all_success(Request $request)
    {
        // Check if the session has an 'id' key
        if ($request->session()->has('id')) {
            // Use Query Builder to perform the update safely
            DB::table('withdraw_histories')
                ->where('status', 1)
                ->update(['status' => 2]);

            // Retrieve updated withdrawal histories
            $widthdrawls = DB::table('withdraw_histories')->get();

            // Return the view with the updated data
            return view('manual_widthdrawl.index', compact('widthdrawls'))->with('id', '1');
        } else {
            // Redirect to login if session does not have 'id'
            return redirect()->route('login');
        }
    }
}