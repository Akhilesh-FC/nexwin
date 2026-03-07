<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Models\User;
use Validator;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\DB;


class PayinController extends Controller
{
    
    public function getAllQrCodes(Request $request)
    {
        try {
            $qrCodes = DB::table('qr_codes')->where('status', 1)->get();

            if ($qrCodes->isEmpty()) {
                return response()->json([
                    'status' => 404,
                    'message' => 'No QR codes found',
                ], 404);
            }

            return response()->json([
                'status' => 200,
                'message' => 'QR codes fetched successfully',
                'data' => $qrCodes,
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'status' => 500,
                'message' => 'Something went wrong',
                'error' => $e->getMessage(),
            ], 500);
        }
    }
    
    
    public function manual_payin(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id'        => 'required|exists:users,id',
            'cash'           => 'required|numeric',
            'transaction_id' => 'nullable|string',
            'screenshot'     => 'required|string',
            'coupon_id'      => 'nullable|exists:coupons,id',
        ]);
    
        if ($validator->fails()) {
            return response()->json([
                'status' => 400,
                'message' => $validator->errors()->first()
            ]);
        }
    
        $inr            = $request->cash;   // ✅ ORIGINAL CASH
        $image          = $request->screenshot;
        $transaction_id = $request->transaction_id;
        $coupon_id      = $request->coupon_id;
        $userid         = $request->user_id;
        $datetime       = now();
        $orderid        = date('YmdHis') . rand(11111, 99999);
        $bonus          = 0;                // ✅ BONUS SEPARATE
    
        if (empty($image) || $image === '0' || $image === 'null') {
            return response()->json([
                'status' => 400,
                'message' => 'Please Select Image'
            ]);
        }
    
        // ✅ base64 clean
        $base64Data = preg_replace('#^data:image/\w+;base64,#i', '', $image);
        $imageData  = base64_decode($base64Data);
    
        if ($imageData === false) {
            return response()->json([
                'status' => 400,
                'message' => 'Invalid base64 image'
            ]);
        }
    
        // ✅ upload dir
        $uploadDir = public_path('uploads/payinqr');
        if (!file_exists($uploadDir)) {
            mkdir($uploadDir, 0755, true);
        }
    
        $fileName = 'screenshot_' . time() . '_' . rand(1000, 9999) . '.png';
        $filePath = $uploadDir . '/' . $fileName;
    
        if (!file_put_contents($filePath, $imageData)) {
            return response()->json([
                'status' => 400,
                'message' => 'Failed to save image'
            ]);
        }
    
        // ✅ full URL
        $baseUrl = 'https://root.nexwin.vip/public/';
        $fullUrl = $baseUrl . 'uploads/payinqr/' . $fileName;
    
        /* ===================================================
            ✅ COUPON LOGIC
        =================================================== */
        if (!empty($coupon_id)) {
    
            $coupon = DB::table('coupons')
                ->where('id', $coupon_id)
                ->where('status', 1)
                ->first();
    
            if (!$coupon) {
                return response()->json([
                    'status' => 400,
                    'message' => 'Invalid or expired coupon'
                ]);
            }
    
            $used = DB::table('coupon_history')
                ->where('user_id', $userid)
                ->where('coupon_id', $coupon_id)
                ->exists();
    
            if ($used) {
                return response()->json([
                    'status' => 400,
                    'message' => 'You have already used this coupon'
                ]);
            }
    
            // ✅ BONUS ONLY
            $bonus = ($inr * $coupon->percentage) / 100;
    
            DB::table('coupon_history')->insert([
                'user_id'   => $userid,
                'coupon_id' => $coupon_id,
                'used_at'   => now()
            ]);
        }
    
        /* ===================================================
            ✅ PAYINS INSERT (FIXED)
        =================================================== */
        DB::table('payins')->insert([
            'user_id'        => $userid,
            'cash'           => $inr,       // ✅ ORIGINAL CASH
            'bonus'          => $bonus,     // ✅ BONUS HERE
            'transaction_id' => $transaction_id,
            'type'           => '2',
            'typeimage'      => $fullUrl,
            'order_id'       => $orderid,
            'status'         => 1,
            'created_at'     => $datetime,
            'updated_at'     => $datetime
        ]);
        
        // For admin notiifcation
        
        	$payin_id = DB::getPdo()->lastInsertId();

    /* ===============================
       ✅ GET USER NAME
    =============================== */
    $user = DB::table('users')->where('id', $userid)->first();
    $username = $user ? $user->username : 'User';

    /* ===============================
       ✅ ADMIN NOTIFICATION INSERT
    =============================== */
    DB::table('admin_notifications')->insert([
		'related_id' => $payin_id,
        'type'       => 'manual_deposit',
        'title'      => 'New Manual Deposit Request',
        'message'    => "User {$username} has submitted a manual deposit of ₹{$inr}. UTR: {$transaction_id}",
        'status'     => 0,
        'created_at' => now(),
        'updated_at' => now()
    ]);
        // end admin notification 
        
        
  /* ===============================
   ✅ TELEGRAM ALERT (PRIVATE)
================================ */

$botToken = "8610933828:AAFUFQyETDONH1seB_v7bjEFWXal0m88myw";
$chatId   = "7450094939"; // Kabir private ID

//$transaction_id = $request->transaction_id;  // Request se value le lo

$message = "💰 New Manual Deposit\n\n"
         . "👤 User: {$username}\n"
         . "💵 Amount: ₹{$inr}\n"
         . "🎁 Bonus: ₹{$bonus}\n"
         . "🧾 UTR: {$request->transaction_id}\n"
        //  . "🆔 Order ID: {$orderid}\n"
         . "📅 Date: {$datetime}";

$response = Http::post("https://api.telegram.org/bot{$botToken}/sendMessage", [
    'chat_id' => $chatId,
    'text'    => $message,
]);

if (!$response->ok()) {
    \Log::error("Telegram Error: " . $response->body());
}




        return response()->json([
            'status' => 200,
            'message' => 'Manual Payment Request sent successfully. Please wait for admin approval.'
        ]);
    }
    
    public function qr_view() 
    {
    
           $show_qr = DB::select("SELECT* FROM `usdt_qr`");
           //$show_qr = DB::select("SELECT `name`, `qr_code` FROM `usdt_qr`");
    
            if ($show_qr) {
                $response = [
                    'message' => 'Successfully',
                    'status' => 200,
                    'data' => $show_qr
                ];
    
                return response()->json($response,200);
            } else {
                return response()->json(['message' => 'No record found','status' => 400,
                    'data' => []], 400);
            }
        }
        
 
    public function checkPayment(Request $request)
    {
    $orderid = $request->input('order_id');
	
    if ($orderid == "") {
        return response()->json(['status' => 400, 'message' => 'Order Id is required']);
    }

    $curl = curl_init();
    curl_setopt_array($curl, array(
        CURLOPT_URL => "https://bappaventures.com/api/payinstatus?order_id=$orderid",
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_CUSTOMREQUEST => 'GET',
        CURLOPT_HTTPHEADER => array(
            'Cookie: ci_session=uvkdvmvc3n03msqrd4bfiudbgk658uif'
        ),
    ));

    $response = curl_exec($curl);
    curl_close($curl);

    $decodedValue = json_decode($response, true);
    $match_orders = DB::table('payins')->where('order_id', $orderid)->where('status', 1)->first();
		 $uids = $match_orders->user_id;
    if (isset($decodedValue['status']) && $decodedValue['status'] == "success") {

        $match_order = DB::table('payins')->where('order_id', $orderid)->where('status', 1)->first();
        if ($match_order) {

            $uid = $match_order->user_id;
            $cash = $match_order->cash;
            $orderid = $match_order->order_id;
            $datetime = now();

            $update_payin = DB::table('payins')
                ->where('order_id', $orderid)
                ->where('status', 1)
                ->where('user_id', $uid)
                ->update(['status' => 2]);

            if ($update_payin) {

                // user data
                $user = DB::table('users')->where('id', $uid)->first();
                $referuserid = $user->referral_user_id;
                $first_recharge = $user->first_recharge;

                // FIRST RECHARGE BONUS CALCULATION (10%)
                $bonus = 0;
                if ($first_recharge == 0) {
                    $bonus = ($cash * 10) / 100;  // 10% EXTRA BONUS
                }

                // Insert in extra_first_deposit_bonus_claim only if first recharge
                if ($first_recharge == 0) {
                    DB::insert("INSERT INTO extra_first_deposit_bonus_claim 
                        (`userid`, `extra_fdb_id`, `bonus`, `status`, `created_at`, `updated_at`)
                        VALUES ('$uid','1','$bonus','0','$datetime','$datetime')");
                }

                // Update User Wallet
                DB::update("UPDATE users 
                    SET 
                        wallet = wallet + $cash + $bonus,
                        recharge = recharge + $cash,
                        total_payin = total_payin + $cash,
                        no_of_payin = no_of_payin + 1,
                        deposit_balance = deposit_balance + $cash,
                        first_recharge = IF(first_recharge = 0, 1, first_recharge),
                        first_recharge_amount = IF(first_recharge = 0, $cash, first_recharge_amount)
                    WHERE id = $uid");

                // Update referral user yesterday stats
                if ($referuserid != 0) {
                    DB::update("UPDATE users SET 
                        yesterday_payin = yesterday_payin + $cash,
                        yesterday_no_of_payin = yesterday_no_of_payin + 1,
                        yesterday_first_deposit = yesterday_first_deposit + IF($first_recharge = 0, $cash, 0)
                    WHERE id = $referuserid");
                }

                return redirect()->away('https://root.nexwin.vip/uploads/payment_success.php');
            } 
            else {
                return response()->json(['status' => 400, 'message' => 'Failed to update payment status!']);
            }

        } else {
            return response()->json(['status' => 400, 'message' => 'Order id not found or already processed']);
        }

    } else {
		 $update_payin = DB::table('payins')
                ->where('order_id', $orderid)
                ->where('status', 1)
                ->where('user_id', $uids)
                ->update(['status' => 3]);

        return redirect()->away('https://root.nexwin.vip/uploads/failed.php');
		
    }
}

    

	
    public function withdraw_request(Request $request)
    {
    
    		  $date = date('Ymd');
            $rand = rand(1111111, 9999999);
            $transaction_id = $date . $rand;
    	
    		 $userid=$request->userid;
    		 $amount=$request->amount;
    		   $validator=validator ::make($request->all(),
            [
                'userid'=>'required',
    			'amount'=>'required',
    			
            ]);
            $date=date('Y-m-d h:i:s');
            if($validator ->fails()){
                $response=[
                    'success'=>"400",
                    'message'=>$validator ->errors()
                ];                                                   
                
                return response()->json($response,400);
            }
          
    		 $datetime = date('Y-m-d H:i:s');
    		 
             $user = DB::select("SELECT * FROM `users` where `id` =$userid");
    		 $account_id=$user[0]->accountno_id;
    		 $mobile=$user[0]->mobile;
    		 $wallet=$user[0]->wallet;
    // 		 dd($wallet);
    		 $accountlist=DB::select("SELECT * FROM `bank_details` WHERE `id`=$account_id");
    		 
    		 $insert= DB::table('transaction_history')->insert([
            'userid' => $userid,
            'amount' => $amount,
            'mobile' => $mobile,
    		  'account_id'=>$account_id,
            'status' => 0,
    			 'type'=>1,
            'date' => $datetime,
    		  'transaction_id' => $transaction_id,
        ]);
    		  DB::select("UPDATE `users` SET `wallet`=`wallet`-$amount,`winning_wallet`=`winning_wallet`-$amount  WHERE `id`=$userid");
              if($insert){
              $response =[ 'success'=>"200",'data'=>$insert,'message'=>'Successfully'];return response ()->json ($response,200);
          }
          else{
           $response =[ 'success'=>"400",'data'=>[],'message'=>'Not Found Data'];return response ()->json ($response,400); 
          } 
        }

    public function redirect_success()
    {
        return view('success');
    }
    
    
    public function usdt_payin(Request $request)
{
    $validator = Validator::make($request->all(), [
        'user_id' => 'required|exists:users,id',
        'cash' => 'required|numeric',
        'type' => 'required|integer',
    ]);

    if ($validator->fails()) {
        return response()->json([
            'status' => 400,
            'message' => $validator->errors()->first()
        ]);
    }

    $usdt = $request->cash;
    $image = $request->screenshot;
    $type = $request->type;
    $userid = $request->user_id;
    $inr = $usdt;
    $datetime = now();
    $orderid = date('YmdHis') . rand(11111, 99999);

    // Validate image input
    if (empty($image) || $image === '0' || $image === 'null' || $image === null || $image === '' || $image === 0) {
        return response()->json([
            'status' => 400,
            'message' => 'Please Select Image'
        ]);
    }

    // Handle image saving
    // $path = '';
    // if (!empty($image)) {
    //     $imageData = base64_decode($image);
    //     if ($imageData === false) {
    //         return response()->json([
    //             'status' => 400,
    //             'message' => 'Invalid base64 encoded image'
    //         ]);
    //     }

    //     $newName = Str::random(6) . '.png';
    //     $relativePath = 'usdt_images/' . $newName;

    //     if (!file_exists(public_path('usdt_images'))) {
    //         mkdir(public_path('usdt_images'), 0775, true);
    //     }

    //     if (!file_put_contents(public_path($relativePath), $imageData)) {
    //         return response()->json([
    //             'status' => 400,
    //             'message' => 'Failed to save image'
    //         ]);
    //     }

    //     $path = asset('usdt_images/' . $newName);
    // }
    
    $path = '';
if (!empty($image)) {

    $imageData = base64_decode($image);

    if ($imageData === false) {
        return response()->json([
            'status' => 400,
            'message' => 'Invalid base64 encoded image'
        ]);
    }

    $newName = Str::random(6) . '.png';

    $relativePath = 'usdt_images/' . $newName;

    if (!file_exists(public_path('usdt_images'))) {
        mkdir(public_path('usdt_images'), 0775, true);
    }

    if (!file_put_contents(public_path($relativePath), $imageData)) {
        return response()->json([
            'status' => 400,
            'message' => 'Failed to save image'
        ]);
    }

    // ✅ Dynamic Full URL
    $baseUrl = url('/');
    $path = $baseUrl . '/public/usdt_images/' . $newName;

}

    // Get USDT Rate
    $depoistrateusdt = DB::table('payment_limits')
        ->where('id', 13)
        ->value('amount');

    if (!$depoistrateusdt) {
        return response()->json([
            'status' => 400,
            'message' => 'USDT rate not found'
        ]);
    }

    if ($type == 1) {

        $insert_usdt = DB::table('payins')->insert([
            'user_id' => $userid,
            'cash' => $usdt * $depoistrateusdt,
            'usdt_amount' => $inr,
            'type' => '1',
            'typeimage' => $path,
            'order_id' => $orderid,
            'status' => 1,
            'created_at' => $datetime,
            'updated_at' => $datetime
        ]);

        if ($insert_usdt) {

            // ✅ Get username
            $user = DB::table('users')->where('id', $userid)->first();
            $username = $user ? $user->username : 'User';

            /* ===============================
               ✅ TELEGRAM ALERT ONLY
            =============================== */

            $botToken = "8610933828:AAFUFQyETDONH1seB_v7bjEFWXal0m88myw";
            $chatId   = "7450094939";

            $message = "💰 New USDT Deposit\n\n"
                     . "👤 User: {$username}\n"
                     . "💲 USDT: {$inr}\n"
                     . "💵 INR Credit: ₹" . ($usdt * $depoistrateusdt) . "\n"
                     . "🆔 Order ID: {$orderid}\n"
                     . "📅 Date: {$datetime}";

            $response = Http::post("https://api.telegram.org/bot{$botToken}/sendMessage", [
                'chat_id' => $chatId,
                'text'    => $message,
            ]);

            if (!$response->ok()) {
                \Log::error("Telegram USDT Error: " . $response->body());
            }

            // ✅ RESPONSE SAME AS BEFORE
            return response()->json([
                'status' => 200,
                'message' => 'USDT Payment Request sent successfully. Please wait for admin approval.'
            ]);
        } else {
            return response()->json([
                'status' => 500,
                'message' => 'Failed to insert USDT Payment'
            ]);
        }

    } else {
        return response()->json([
            'status' => 400,
            'message' => 'Invalid Type'
        ]);
    }
}
    
//     public function usdt_payin(Request $request)
//     {
//     $validator = Validator::make($request->all(), [
//         'user_id' => 'required|exists:users,id',
//         'cash' => 'required|numeric',
//         'type' => 'required|integer',
//     ]);

//     if ($validator->fails()) {
//         return response()->json([
//             'status' => 400,
//             'message' => $validator->errors()->first()
//         ]);
//     }

//     $usdt = $request->cash;
//     $image = $request->screenshot;
//     $type = $request->type;
//     $userid = $request->user_id;
//     $inr = $usdt;
//     $datetime = now();
//     $orderid = date('YmdHis') . rand(11111, 99999);

//     // Validate image input
//     if (empty($image) || $image === '0' || $image === 'null' || $image === null || $image === '' || $image === 0) {
//         return response()->json([
//             'status' => 400,
//             'message' => 'Please Select Image'
//         ]);
//     }

//     // Handle image saving
//     $path = '';
//     if (!empty($image)) {
//         $imageData = base64_decode($image);
//         if ($imageData === false) {
//             return response()->json([
//                 'status' => 400,
//                 'message' => 'Invalid base64 encoded image'
//             ]);
//         }

//         // Save image to /public/usdt_images directory
//         $newName = Str::random(6) . '.png';
//         $relativePath = 'usdt_images/' . $newName;

//         // Ensure directory exists
//         if (!file_exists(public_path('usdt_images'))) {
//             mkdir(public_path('usdt_images'), 0775, true);
//         }

//         // Save the image file
//         if (!file_put_contents(public_path($relativePath), $imageData)) {
//             return response()->json([
//                 'status' => 400,
//                 'message' => 'Failed to save image'
//             ]);
//         }

//         // Generate URL to store in DB
//         $path = asset('usdt_images/' . $newName);
//     }

    
    
//             // Get dynamic USDT deposit rate
//         $depoistrateusdt = DB::table('payment_limits')
//             ->where('id', 13)
//             ->value('amount');
        
//         if (!$depoistrateusdt) {
//             return response()->json([
//                 'status' => 400,
//                 'message' => 'USDT rate not found'
//             ]);
//         }

//     // Handle type == 0 (payin logic)
//     if ($type == 1) {
//         $insert_usdt = DB::table('payins')->insert([
//             'user_id' => $userid,
//             'cash' => $usdt * $depoistrateusdt,
//             'usdt_amount' => $inr,
//             'type' => '1',
//             'typeimage' => $path,
//             'order_id' => $orderid,
//             'status' => 1,
//             'created_at' => $datetime,
//             'updated_at' => $datetime
//         ]);

//         if ($insert_usdt) {
//             return response()->json([
//                 'status' => 200,
//                 'message' => 'USDT Payment Request sent successfully. Please wait for admin approval.'
//             ]);
//         } else {
//             return response()->json([
//                 'status' => 500,
//                 'message' => 'Failed to insert USDT Payment'
//             ]);
//         }
//     } else {
//         return response()->json([
//             'status' => 400,
//             'message' => 'Invalid Type'
//         ]);
//     }
// }

}
