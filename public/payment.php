<?php

$TOKEN = "ppT2mnZQwfCC4zRTGlNhq7kSnrJASmo1ANJl881D";

if(isset($_POST['action']) && $_POST['action']=="create_payment"){

    $name   = trim($_POST['name']);
    $amount = trim($_POST['amount']);
    $mobile = trim($_POST['mobile']);

    /* ==========================
       SERVER SIDE VALIDATION
    ========================== */

    // Name max 25
    if(strlen($name) > 25){
        echo json_encode(["status"=>false,"message"=>"Invalid name"]);
        exit;
    }

    // Mobile exactly 10 digits
    if(!preg_match('/^[0-9]{10}$/', $mobile)){
        echo json_encode(["status"=>false,"message"=>"Invalid mobile number"]);
        exit;
    }

    // Amount digits only
    if(!preg_match('/^[0-9]+$/', $amount)){
        echo json_encode(["status"=>false,"message"=>"Invalid amount"]);
        exit;
    }

    // Length protection (max 8 digits for 1 crore)
    if(strlen($amount) > 8){
        echo json_encode(["status"=>false,"message"=>"Amount limit exceeded"]);
        exit;
    }

    $amount = (int)$amount;

    if($amount < 100){
        echo json_encode(["status"=>false,"message"=>"Minimum amount is ₹100"]);
        exit;
    }

    if($amount > 10000000){
        echo json_encode(["status"=>false,"message"=>"Amount limit exceeded"]);
        exit;
    }

    /* ==========================
       PAYMENT API CALL
    ========================== */

    $url = "https://partner.payraizen.com/tech/api/payin/create_intent";
    $uniqueOrderId = "WB" . time() . rand(1000,9999);

    $payload = [
        'amount' => $amount,
        'mid'    => $uniqueOrderId,
        'name'   => $name,
        'email'  => "test@gmail.com",
        'mobile' => $mobile
    ];

    $ch = curl_init();

    curl_setopt_array($ch, [
        CURLOPT_URL => $url,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_POST => true,
        CURLOPT_POSTFIELDS => json_encode($payload),
        CURLOPT_HTTPHEADER => [
            "Authorization: Bearer ".$TOKEN,
            "Content-Type: application/json",
            "Accept: application/json"
        ],
    ]);

    $response = curl_exec($ch);
    $error    = curl_error($ch);
    curl_close($ch);

    if($error){
        echo json_encode(["status"=>false,"message"=>"Server Error"]);
        exit;
    }

    $result = json_decode($response, true);

    if(
        (isset($result['status']) && ($result['status']=="true" || $result['status']==true))
        ||
        (isset($result['msg']) && stripos($result['msg'],'Generated') !== false)
    ){

        $deeplink = $result['order_details']['deeplink'] ?? "";

        if($deeplink){
            echo json_encode([
                "status"=>true,
                "deeplink"=>$deeplink
            ]);
        } else {
            echo json_encode(["status"=>false,"message"=>"Payment processing error"]);
        }

    } else {
        echo json_encode([
            "status"=>false,
            "message"=>$result['msg'] ?? "Payment Failed"
        ]);
    }

    exit;
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Secure Payment</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <style>
        body{
            background:linear-gradient(135deg,#141E30,#243B55);
            min-height:100vh;
            display:flex;
            justify-content:center;
            align-items:center;
        }
        .card{
            width:430px;
            border-radius:15px;
        }
        .note-text{
            font-size:13px;
            color:#dc3545;
        }
    </style>
</head>

<body>

<div class="card shadow p-4 bg-white">

    <h4 class="text-center mb-3">Payment Gateway</h4>

    <div id="errorBox"></div>

    <form id="paymentForm">

        <!-- NAME -->
        <input type="text"
               id="name"
               class="form-control mb-3"
               placeholder="Name"
               maxlength="25"
               required>

        <!-- MOBILE -->
        <input type="text"
               id="mobile"
               class="form-control mb-3"
               placeholder="Mobile Number"
               maxlength="10"
               required>

        <!-- AMOUNT -->
        <input type="text"
               id="amount"
               class="form-control mb-1"
               placeholder="Amount"
               required>

        <small class="note-text mb-3 d-block">
            Minimum ₹100 required
        </small>

        <button class="btn btn-dark w-100">
            Pay Now
        </button>

    </form>

    <div class="text-center mt-3" id="loader" style="display:none;">
        <div class="spinner-border text-dark"></div>
        <p>Processing Payment...</p>
    </div>

</div>

<script>

$("#paymentForm").submit(function(e){

    e.preventDefault();

    let name   = $("#name").val().trim();
    let mobile = $("#mobile").val().trim();
    let amount = $("#amount").val().trim();

    $("#errorBox").html("");

    // Mobile validation
    if(!/^[0-9]{10}$/.test(mobile)){
        $("#errorBox").html('<div class="alert alert-danger">Invalid mobile number</div>');
        return;
    }

    // Amount digits only
    if(!/^[0-9]+$/.test(amount)){
        $("#errorBox").html('<div class="alert alert-danger">Invalid amount</div>');
        return;
    }

    // Length protection
    if(amount.length > 8){
        $("#errorBox").html('<div class="alert alert-danger">Amount limit exceeded</div>');
        return;
    }

    let numericAmount = Number(amount);

    if(numericAmount < 100){
        $("#errorBox").html('<div class="alert alert-danger">Minimum amount is ₹100</div>');
        return;
    }

    if(numericAmount > 10000000){
        $("#errorBox").html('<div class="alert alert-danger">Amount limit exceeded</div>');
        return;
    }

    $("#loader").show();

    $.post("payment.php",{
        action:"create_payment",
        name:name,
        mobile:mobile,
        amount:amount
    },function(res){

        $("#loader").hide();

        let data;

        try{
            data = JSON.parse(res);
        }catch(err){
            $("#errorBox").html('<div class="alert alert-danger">Server error</div>');
            return;
        }

        if(data.status){
            window.location.href = data.deeplink;
        }else{
            $("#errorBox").html('<div class="alert alert-danger">'+data.message+'</div>');
        }

    });

});
</script>

</body>
</html>
