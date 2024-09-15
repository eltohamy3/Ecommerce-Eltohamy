
<?php
include "../../../connect.php";
include "../../../function.php";

if (isset($_POST['admin_email'], $_POST['admin_verifycode'])) {
    
    $admin_email = filterRequest($_POST['admin_email']);
    $admin_verifycode = filterRequest($_POST['admin_verifycode']);

    $stmt = $con->prepare('SELECT * FROM admin WHERE admin_email = ?');
    $stmt->execute([$admin_email]);

    if ($stmt->rowCount() > 0) {
        $admin = $stmt->fetch(PDO::FETCH_ASSOC);
        $dbadmin_verifycode = $admin['admin_verifycode'] ;
        $admin_Approve = $admin['admin_Approve'] ;


        if ($dbadmin_verifycode == $admin_verifycode) {
            if ($admin_Approve!=1)
            {
                $data = ["admin_Approve" => "1"];
                UpdateTable("admin", $data, $con, "admin_email = '$admin_email'" );
            }else
            {
                printsuccess();
            }
        } else {
            printFailure("Verification code is incorrect");
        }
    } else {
        printFailure("admin_email not found");
    }
}
?>
