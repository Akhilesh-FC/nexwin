<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Storage;
use  Illuminate\Support\Facades\DB;

class Manual_qr_Controller extends Controller
{
    
    
    
    public function updateStatus(Request $request, $id)
    {
        $status = $request->status;
        DB::table('qr_codes')->where('id', $id)->update(['status' => $status]);
        return response()->json(['success' => true]);
    }

    // public function manual_qr_view()
    // {
    //   $manual = DB::select("SELECT * FROM `qr_codes`");
    //     return view('manual_qr.index', compact('manual'));
    // }
    
   public function manual_qr_view()
{
    $option1 = DB::table('qr_codes')->where('id', 1)->first();
    $option2 = DB::table('qr_codes')->where('id', 2)->first();

    return view('manual_qr.index', compact('option1', 'option2'));
}

    // public function update_manual_qr(Request $request, $id)
    // {
    //     // ✅ Simple validation (no MIME guessing)
    //     $request->validate([
    //         'image' => 'nullable|file|max:2048',
    //         'wallet_address' => 'nullable|string'
    //     ]);
    
    //     $image = $request->file('image');
    //     $wallet_address = $request->wallet_address;
    
    //     // ✅ Define upload path
    //     $uploadPath = public_path('uploads/payinqr');
    //     if (!file_exists($uploadPath)) {
    //         mkdir($uploadPath, 0777, true);
    //     }
    
    //     // ✅ Generate unique name and move file
    //     $imageName = time() . '_' . $image->getClientOriginalName();
    //     $image->move($uploadPath, $imageName);
    
    //     // ✅ Create public URL
    //     $imageUrl = "https://root.nexwin.vip/public/uploads/payinqr/" . $imageName;
    
    //     // ✅ Update database
    //     DB::table('qr_codes')->where('id', $id)->update([
    //         'qr_code' => $imageUrl,
    //         'wallet_address' => $wallet_address
    //     ]);
    
    //     return redirect()->back()->with('message', 'QR Updated Successfully!');
    // }

   public function update_manual_qr(Request $request, $id)
{
    $data = [];

    $request->validate([
        'image' => 'nullable|file|max:2048',
    ]);

    // ==============================
    // OPTION 1 → UPI
    // ==============================
    if ($id == 1) {

        $request->validate([
            'upi_address' => 'nullable|string'
        ]);

        if ($request->filled('upi_address')) {
            $data['upi_address'] = $request->upi_address;
        }
    }

    // ==============================
    // OPTION 2 → BANK DETAILS
    // ==============================
    if ($id == 2) {

        if ($request->filled('wallet_address')) {
            $data['wallet_address'] = $request->wallet_address;
        }

        $data['account_number'] = $request->account_number;
        $data['ifsc_code'] = $request->ifsc_code;
        $data['account_name'] = $request->account_name;
        $data['account_type'] = $request->account_type;
    }

    // ==============================
    // IMAGE UPLOAD (COMMON)
    // ==============================
    if ($request->hasFile('image')) {

        $uploadPath = public_path('uploads/payinqr');

        if (!file_exists($uploadPath)) {
            mkdir($uploadPath, 0777, true);
        }

        $image = $request->file('image');
        $imageName = time().'_'.$image->getClientOriginalName();
        $image->move($uploadPath, $imageName);

        $imageUrl = "https://root.nexwin.vip/public/uploads/payinqr/" . $imageName;

        $data['qr_code'] = $imageUrl;
    }

    DB::table('qr_codes')->where('id', $id)->update($data);

    return redirect()->back()->with('message', 'Updated Successfully!');
}



 
}