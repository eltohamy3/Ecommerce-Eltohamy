
<?php
include "../../../connect.php";
include "../../../function.php";

if (isset($_POST['admin_email'], $_POST['admin_password'])) {
    
    $admin_email = filterRequest($_POST['admin_email']);
    $admin_passwordHash = password_hash(filterRequest($_POST["admin_password"]), PASSWORD_DEFAULT);
    $data = ["admin_password" => $admin_passwordHash];

    UpdateTable("admin", $data, $con, "admin_email = '$admin_email'" );
    
}
?>
