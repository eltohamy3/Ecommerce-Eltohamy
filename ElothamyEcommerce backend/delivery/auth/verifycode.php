
<?php
    include "../../connect.php";
    include "../../function.php" ;


if (isset($_POST['delivery_email'], $_POST['delivery_verifycode'])) {
    
    $delivery_email = filterRequest($_POST['delivery_email']);
    $delivery_verifycode = filterRequest($_POST['delivery_verifycode']);

    $stmt = $con->prepare('SELECT delivery_verifycode FROM delivery WHERE delivery_email = ?');
    $stmt->execute([$delivery_email]);

    if ($stmt->rowCount() > 0) {
        $dbdelivery_verifycode = $stmt->fetchColumn();

        if ($dbdelivery_verifycode == $delivery_verifycode) {
            $data = ["delivery_Approve" => "1"];
            // printsuccess();
            UpdateTable("delivery", $data, $con, "delivery_email = '$delivery_email'");
        } else {
            printFailure("Verification code is incorrect");
        }
    } else {
        printFailure("delivery_email not found");
    }
}
?>
