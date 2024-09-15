
<?php
include "../../../connect.php";
include "../../../function.php";

if (isset($_POST['delivery_email'], $_POST['delivery_password'])) {
    
    $delivery_email = filterRequest($_POST['delivery_email']);
    $delivery_passwordHash = password_hash(filterRequest($_POST["delivery_password"]), PASSWORD_DEFAULT);
    $data = ["delivery_password" => $delivery_passwordHash];

    UpdateTable("delivery", $data, $con, "delivery_email = '$delivery_email'" );
    
}
?>
