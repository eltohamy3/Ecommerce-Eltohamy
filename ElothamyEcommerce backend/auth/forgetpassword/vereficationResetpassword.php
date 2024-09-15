
<?php
include "../../connect.php";
include "../../function.php";

if (isset($_POST['email'], $_POST['verifycode'])) {
    
    $email = filterRequest($_POST['email']);
    $verifycode = filterRequest($_POST['verifycode']);

    $stmt = $con->prepare('SELECT * FROM users WHERE email = ?');
    $stmt->execute([$email]);

    if ($stmt->rowCount() > 0) {
        $user = $stmt->fetch(PDO::FETCH_ASSOC);
        $dbverifycode = $user['verifycode'] ;
        $userApprove = $user['userApprove'] ;

        
        if ($dbverifycode == $verifycode) {
            if ($userApprove!=1)
            {
                $data = ["userApprove" => "1"];
                UpdateTable("users", $data, $con, "email = '$email'" , false);
            }
            printsuccess();
        } else {
            printFailure("Verification code is incorrect");
        }
    } else {
        printFailure("Email not found");
    }
}
?>
