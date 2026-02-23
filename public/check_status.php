<?php

$order_id = $_POST['order_id'];

$url = "https://partner.payraizen.com/tech/api/payin/check_status";

$token = "ppT2mnZQwfCC4zRTGlNhq7kSnrJASmo1ANJl881D";

$dataa = ['order_id'=>$order_id];

$curl = curl_init();

curl_setopt_array($curl, [
    CURLOPT_URL => $url,
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_CUSTOMREQUEST => "POST",
    CURLOPT_POSTFIELDS => json_encode($dataa),
    CURLOPT_HTTPHEADER => [
        "Authorization: Bearer " . $token,
        "Content-Type: application/json"
    ],
]);

$response = curl_exec($curl);
curl_close($curl);

$result = json_decode($response,true);

// assume response: {status:"SUCCESS"} or FAILED

echo json_encode([
    "status"=>$result['status']
]);
