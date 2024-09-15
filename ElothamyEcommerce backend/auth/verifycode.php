
<?php
include "../connect.php";
include "../function.php";

if (isset($_POST['email'], $_POST['verifycode'])) {
    
    $email = filterRequest($_POST['email']);
    $verifycode = filterRequest($_POST['verifycode']);

    $stmt = $con->prepare('SELECT verifycode FROM users WHERE email = ?');
    $stmt->execute([$email]);

    if ($stmt->rowCount() > 0) {
        $dbverifycode = $stmt->fetchColumn();

        if ($dbverifycode == $verifycode) {
            $data = ["userApprove" => "1"];
            // printsuccess();
            UpdateTable("users", $data, $con, "email = '$email'");
        } else {
            printFailure("Verification code is incorrect");
        }
    } else {
        printFailure("Email not found");
    }
}
?>
