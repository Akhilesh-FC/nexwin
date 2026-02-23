<?php

date_default_timezone_set("Asia/Kolkata");

/* ==============================
   LOG FUNCTION
============================== */
function writeLog($message){
    
    $logFile = dirname(__DIR__) . "/storage/callback_log.txt";
    
    $time = date("Y-m-d H:i:s");
    $logMessage = "[".$time."] ".$message.PHP_EOL;

    if(!file_exists(dirname($logFile))){
        mkdir(dirname($logFile), 0777, true);
    }

    file_put_contents($logFile, $logMessage, FILE_APPEND);
}


/* ==============================
   DB CONNECTION
============================== */
$mysqli = new mysqli("localhost", "winbhai", "winbhai", "winbhai");

if ($mysqli->connect_error) {
    writeLog("DB Connection Failed");
    die("DB Connection Failed");
}

writeLog("==== NEW CALLBACK HIT ====");

/* ==============================
   GET RAW INPUT
============================== */
$input = file_get_contents("php://input");

if(empty($input)) {
    $input = json_encode($_REQUEST);
}

writeLog("Raw Input: ".$input);

$data = json_decode($input, true);

if(!$data){
    writeLog("Invalid JSON Data");
    http_response_code(400);
    echo "Invalid Data";
    exit;
}

/* ==============================
   FETCH DATA
============================== */

$mid    = $data['mid'] ?? $data['order_id'] ?? null;
$status = $data['status'] ?? null;
$txn_id = $data['txn_id'] ?? $data['tid'] ?? null;
$amount = $data['amount'] ?? 0;

writeLog("MID: ".$mid);
writeLog("Status: ".$status);
writeLog("TXN ID: ".$txn_id);
writeLog("Amount: ".$amount);

if(!$mid){
    writeLog("MID Missing");
    http_response_code(400);
    echo "MID Missing";
    exit;
}

/* ==============================
   DUPLICATE CHECK
============================== */
$check = $mysqli->prepare("SELECT id FROM payments WHERE mid=?");
$check->bind_param("s",$mid);
$check->execute();
$check->store_result();

if($check->num_rows > 0){
    writeLog("Duplicate Callback - Already Processed");
    echo "Already Processed";
    exit;
}
$check->close();

/* ==============================
   STATUS NORMALIZE
============================== */
$statusLower = strtolower($status);

if($statusLower == "success" || $statusLower == "true"){

    $finalStatus = "SUCCESS";
    writeLog("Payment SUCCESS");

    // 🔥 Yaha wallet update logic laga sakte ho
    // Example:
    // $update = $mysqli->prepare("UPDATE users SET wallet = wallet + ? WHERE id=?");
    // $update->bind_param("di", $amount, $userId);
    // $update->execute();

}else{

    $finalStatus = "FAILED";
    writeLog("Payment FAILED");
}

/* ==============================
   INSERT RECORD
============================== */

$raw = json_encode($data);

$stmt = $mysqli->prepare("INSERT INTO payments (mid, txn_id, amount, status, raw_response) VALUES (?,?,?,?,?)");

$stmt->bind_param("ssdss", $mid, $txn_id, $amount, $finalStatus, $raw);

if($stmt->execute()){
    writeLog("Inserted into payments table");
}else{
    writeLog("DB Insert Failed: ".$stmt->error);
}

$stmt->close();

/* ==============================
   DONE
============================== */

writeLog("==== CALLBACK END ====\n");

echo "OK";

?>
