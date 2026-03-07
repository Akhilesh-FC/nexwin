<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ConversionController extends Controller
{
    // Display the conversion rate UI
   public function index()
{
    $conversions = DB::table('payment_limits')
        ->whereIn('id', [13,14])
        ->get();

    return view('usdt_qr.index', compact('conversions'));
}

public function update(Request $request)
{
    $request->validate([
        'amount.*' => 'required|numeric|min:0',
    ]);

    foreach ($request->amount as $id => $amount) {
        DB::table('payment_limits')
            ->where('id', $id)
            ->update([
                'amount' => $amount,
                'updated_at' => now(),
            ]);
    }

    return redirect()->route('usdt_conversion.index')
        ->with('success', 'USDT Conversion Rates Updated Successfully!');
}
    
    
    
    
    
    
}



