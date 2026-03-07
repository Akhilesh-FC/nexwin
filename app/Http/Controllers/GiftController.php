<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
// use App\Models\Invoice;
use DB;

class GiftController extends Controller
{
    public function index()
    {
        $gifts = DB::select("
            SELECT * 
            FROM gift_cart 
          ORDER BY datetime DESC

        ");
    
        return view('gift.index')->with('gifts', $gifts);
    }

    public function gift_store(Request $request)
    {
        $datetime = now();
        $amount = $request->amount;
        $number_people = $request->number_people;
        $expire_date = $request->expire_date;
        $title = $request->title;
        $description = $request->description;
        $percentage = $request->percentage;
       $type = $request->type; // ✅ 1 = Loss, 2 = Win
    
        // ✅ Agar admin ne code diya to wahi use karo
        // ✅ warna random generate karo
        $code = $request->code 
            ? $request->code 
            : rand(100000000000000, 999999999999999);
    
        DB::insert("
            INSERT INTO gift_cart (amount, number_people, code, status, datetime,expire_date,title,description,percentage,type)
            VALUES (?, ?, ?, 1, ?,?,?,?,?,?)
        ", [
            $amount,
            $number_people,
            $code,
            $datetime,
            $expire_date,
            $title,
            $description,
            $percentage,
            $type,
        ]);
    
        return redirect()
            ->route('gift')
            ->with('success', 'Gift Added Successfully!');
    }
    
    public function gift_delete($id)
{
    DB::delete("DELETE FROM gift_cart WHERE id=?",[$id]);

    return redirect()->route('gift')
    ->with('success','Gift Deleted Successfully');
}

public function gift_update(Request $request,$id)
{
    DB::update("
        UPDATE gift_cart 
        SET amount=?,
            percentage=?,
            number_people=?,
            title=?,
            description=?,
            expire_date=?,
            type=?
        WHERE id=?
    ",[
        $request->amount,
        $request->percentage,
        $request->number_people,
        $request->title,
        $request->description,
        $request->expire_date,
        $request->type,
        $id
    ]);

    return redirect()->route('gift')
    ->with('success','Gift Updated Successfully');
}
	
	public function giftredeemed()
    {
        $gifts = DB::select("
            SELECT gift_claim.*, users.username 
            FROM gift_claim 
            LEFT JOIN users ON gift_claim.userid = users.id 
            ORDER BY gift_claim.id DESC
        ");
    
        return view('gift.giftredeemed')->with('gifts', $gifts);
    }

}
