
<?php
include "../../../connect.php";
include "../../../function.php";

if (isset($_POST['delivery_email'], $_POST['delivery_verifycode'])) {
    
    $delivery_email = filterRequest($_POST['delivery_email']);
    $delivery_verifycode = filterRequest($_POST['delivery_verifycode']);

    $stmt = $con->prepare('SELECT * FROM delivery WHERE delivery_email = ?');
    $stmt->execute([$delivery_email]);

    if ($stmt->rowCount() > 0) {
        $delivery = $stmt->fetch(PDO::FETCH_ASSOC);
        $dbdelivery_verifycode = $delivery['delivery_verifycode'] ;
        $delivery_Approve = $delivery['delivery_Approve'] ;


        if ($dbdelivery_verifycode == $delivery_verifycode) {
            if ($delivery_Approve!=1)
            {
                $data = ["delivery_Approve" => "1"];
                UpdateTable("delivery", $data, $con, "delivery_email = '$delivery_email'" );
            }else
            {
                printsuccess();
            }
        } else {
            printFailure("Verification code is incorrect");
        }
    } else {
        printFailure("delivery_email not found");
    }
}
?>
