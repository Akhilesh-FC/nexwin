<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str; 
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Cache;

class jiliApiController extends Controller
{
    public function getSelectedBrands()
    {
    $url = "https://softapi.gt.tc/";

    $html = @file_get_contents($url);
    if (!$html) {
        return response()->json([
            'status' => 400,
            'message' => 'Unable to fetch brands page',
            'data' => []
        ]);
    }

    // Static game names with static IDs
    $desired = [
        ['id' => 112, 'name' => "InOut"],
        ['id' => 49, 'name' => "JILI"],
        ['id' => 52, 'name' => "CQ9"],
        ['id' => 50, 'name' => "JDB"],
        ['id' => 123, 'name' => "PgsGaming"],
        ['id' => 59, 'name' => "EVOLUTION"],
        ['id' => 57, 'name' => "SPRIBE"],
        ['id' => 107, 'name' => "Smartsoft"],
        ['id' => 104, 'name' => "Mini"],
        ['id' => 89, 'name' => "SA GAMING"],
        ['id' => 82, 'name' => "Astar"],
        ['id' => 72, 'name' => "Playtech"],
        ['id' => 46, 'name' => "SABA SPORTS"],
        ['id' => 100, 'name' => "Turbogames Asia"],
        ['id' => 78, 'name' => "Ezugi"],
        ['id' => 51, 'name' => "TADAGaming"],
        ['id' => 53, 'name' => "PragmaticPlay-EU"],
        ['id' => 65, 'name' => "Bgaming"],
        ['id' => 80, 'name' => "T1"],
        ['id' => 88, 'name' => "Sexy"],
    ];

    $normalize = function ($s) {
        return strtoupper(preg_replace('/\s+/', '', $s));
    };

    libxml_use_internal_errors(true);
    $dom = new \DOMDocument();
    $dom->loadHTML($html);
    libxml_clear_errors();

    $links = $dom->getElementsByTagName('a');
    $pageBrands = [];
    foreach ($links as $link) {
        $text = trim($link->nodeValue);
        if ($text !== '') {
            $pageBrands[$normalize($text)] = $text;
        }
    }

    $result = [];
    foreach ($desired as $item) {
        $norm = $normalize($item['name']);
        $result[] = [
            'id' => $item['id'],
            'name' => isset($pageBrands[$norm]) ? $pageBrands[$norm] : $item['name'],
        ];
    }

    return response()->json([
        'status' => 200,
        'message' => 'Filtered brands with static IDs',
        'data' => $result
    ]);
}
    
    public function getGames($brand_id)
    {
        // Direct external URL
        $url = "https://softapi.gt.tc/brands.php?brand_id=" . urlencode($brand_id);
    
        // Just return the direct URL for the frontend to fetch
        return response()->json([
            'status' => 200,
            'message' => 'Fetch games from this URL',
            'brand' => $brand_id,
            'fetchUrl' => $url
        ]);
    }
    
    public function openGame(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id'   => 'required',
            'game_id'   => 'required',
            'game_name' => 'required'
        ]);
    
        if ($validator->fails()) {
            return response()->json([
                'status' => 400,
                'message' => $validator->errors()->first()
            ]);
        }
    
        $user = DB::table('users')->where('id', $request->user_id)->first();
        if (!$user) {
            return response()->json(['status' => 400, 'message' => 'User not found']);
        }
    
        // 🔥 ONE TIME UID
        $game_uid = uniqid('GAME_');
        $token    = Str::uuid()->toString();
    
        // ✅ STORE GAME SESSION (IMPORTANT)
        DB::table('active_game_sessions')->insert([
            'game_uid'    => $request->game_id,
            'game_id'     => $request->game_id,
            'game_name'   => $request->game_name,
            'user_mobile' => $user->mobile,
            'created_at'  => now()
        ]);
    
        Cache::put("PENDING_GAME_" . $token, [
            'user_id'  => $request->user_id,
            'game_id'  => $request->game_id,
            'game_uid' => $request->game_id,
        ], 120);
    
        return response()->json([
            'status'    => 200,
            'launchUrl' => url('/play/' . $token)
        ]);
    }

    public function launchGame($token)
    {
    Log::info("========== GAME LAUNCH START ==========");
    Log::info("TOKEN RECEIVED", ['token' => $token]);

    $data = Cache::get("PENDING_GAME_" . $token);
    Log::info("CACHE DATA", (array) $data);

    if (!$data) {
        Log::warning("SESSION EXPIRED OR CACHE MISS");
        return "Session expired! Please relaunch the game.";
    }

    $providerUrl = $this->getFreshGameUrl(
        $data['user_id'],
        $data['game_uid']
    );

    Log::info("PROVIDER URL RESULT", [
        'provider_url' => $providerUrl
    ]);

    if (!$providerUrl) {
        Log::error("UNABLE TO LAUNCH GAME ❌");
        return "Unable to launch game.";
    }

    Log::info("REDIRECTING TO PROVIDER URL ✅");
    Log::info("========== GAME LAUNCH END ==========");

    return redirect()->away($providerUrl);
}

    private function getFreshGameUrl($user_id, $game_uid)
    {
    Log::info("------ GET FRESH GAME URL START ------");
    Log::info("INPUT DATA", [
        'user_id'  => $user_id,
        'game_uid' => $game_uid
    ]);

    // 1️⃣ USER CHECK
    $user = DB::table('users')->where('id', $user_id)->first();

    if (!$user) {
        Log::error("USER NOT FOUND ❌", ['user_id' => $user_id]);
        return null;
    }

    Log::info("USER FOUND ✅", (array) $user);

    // 2️⃣ KEYS
    $TOKEN  = "38b3f891c283882c1999ab87eedbd242";
    $SECRET = "d6982fb0bbfa259eddc4f0edb41614f9";
    $key    = substr($SECRET, 0, 32);

    Log::info("KEY LENGTH", ['length' => strlen($key)]);

    // 3️⃣ PAYLOAD
    $payload = [
        "user_id"        => (string) $user->mobile,
        "suffix"         => (string) $user->mobile,
        "balance"        => (int) $user->wallet,
        "game_uid"       => (string) $game_uid,
        "token"          => $TOKEN,
        "timestamp"      => round(microtime(true) * 1000),
        "return"         => "https://nexwin.vip/",
        "callback"       => "https://nexwin.vip//api.php",
        "currency_code"  => "INR",
        "language"       => "en"
    ];

    Log::info("PAYLOAD DATA", $payload);

    // 4️⃣ ENCRYPTION
    $encrypted = openssl_encrypt(
        json_encode($payload),
        "AES-256-ECB",
        $key,
        OPENSSL_RAW_DATA
    );

    if (!$encrypted) {
        Log::error("ENCRYPTION FAILED ❌");
        return null;
    }

    $encrypted = base64_encode($encrypted);
    Log::info("ENCRYPTED PAYLOAD GENERATED ✅");

    // 5️⃣ API BODY
    $body = json_encode([
        "payload" => $encrypted,
        "token"   => $TOKEN
    ]);

    // 6️⃣ CURL CALL
    $ch = curl_init("https://igamingapis.live/api/v1");
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $body);
    curl_setopt($ch, CURLOPT_HTTPHEADER, ["Content-Type: application/json"]);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_TIMEOUT, 30);

    $response = curl_exec($ch);

    if ($response === false) {
        Log::error("CURL ERROR ❌", [
            'error' => curl_error($ch)
        ]);
        curl_close($ch);
        return null;
    }

    curl_close($ch);

    Log::info("RAW PROVIDER RESPONSE", ['response' => $response]);

    // 7️⃣ RESPONSE PARSE
    $api = json_decode($response, true);

    if (json_last_error() !== JSON_ERROR_NONE) {
        Log::error("INVALID JSON RESPONSE ❌");
        return null;
    }

    Log::info("PROVIDER RESPONSE DECODED", $api);

    if (!isset($api['data']['url'])) {
        Log::error("PROVIDER URL NOT FOUND ❌");
        return null;
    }

    Log::info("GAME URL RECEIVED ✅", [
        'url' => $api['data']['url']
    ]);

    Log::info("------ GET FRESH GAME URL END ------");

    return $api['data']['url'];
}

    // ====================================================
    // STEP 4 — CALLBACK HANDLER (Provider sends debit/credit)
    // ====================================================

    public function gameCallback(Request $request)
    {
        Log::info("GAME CALLBACK RECEIVED: " . json_encode($request->all()));

        $userId = $request->user_id;
        $amount = $request->amount;
        $type   = $request->type;   // debit or credit

        $user = DB::table('users')->where('id', $userId)->first();
        if (!$user) {
            Log::error("Callback user NOT found: " . $userId);
            return response()->json(['status' => 404]);
        }

        // =============================
        //   DEBIT (Game Entry / Bet)
        // =============================
        if ($type == "debit") 
        {
            DB::table('users')->where('id', $userId)
                ->update(['wallet' => $user->wallet - $amount]);

            Log::info("WALLET DEBIT: User {$userId} -{$amount}");
        }

        // =============================
        //   CREDIT (Win Amount)
        // =============================
        if ($type == "credit") 
        {
            DB::table('users')->where('id', $userId)
                ->update(['wallet' => $user->wallet + $amount]);

            Log::info("WALLET CREDIT: User {$userId} +{$amount}");
        }

        return response()->json(['status' => 200, 'message' => 'Wallet updated']);
    }

    public function userGameHistory($user_id)
    {
        $history = DB::table('game_history')
            ->where('user_id', $user_id)
            ->orderBy('id', 'desc')
            ->get();
    
        return response()->json([
            'status' => 200,
            'data' => $history
        ]);
    }
    
    public function filterGameHistory(Request $request)
    {
        $request->validate([
            'user_id' => 'required'
        ]);
    
        $history = DB::table('game_history')
            ->where('user_id', $request->user_id)
            ->when($request->game_id, function($q) use ($request){
                return $q->where('game_id', $request->game_id);
            })
            ->orderBy('id', 'desc')
            ->get();
    
        return response()->json([
            'status' => 200,
            'data' => $history
        ]);
    }

}