
<?php
    include "../../connect.php";
    include "../../function.php" ;


if (isset($_POST['admin_email'], $_POST['admin_verifycode'])) {
    
    $admin_email = filterRequest($_POST['admin_email']);
    $admin_verifycode = filterRequest($_POST['admin_verifycode']);

    $stmt = $con->prepare('SELECT admin_verifycode FROM admin WHERE admin_email = ?');
    $stmt->execute([$admin_email]);

    if ($stmt->rowCount() > 0) {
        $dbadmin_verifycode = $stmt->fetchColumn();

        if ($dbadmin_verifycode == $admin_verifycode) {
            $data = ["admin_Approve" => "1"];
            // printsuccess();
            UpdateTable("admin", $data, $con, "admin_email = '$admin_email'");
        } else {
            printFailure("Verification code is incorrect");
        }
    } else {
        printFailure("admin_email not found");
    }
}
?>
