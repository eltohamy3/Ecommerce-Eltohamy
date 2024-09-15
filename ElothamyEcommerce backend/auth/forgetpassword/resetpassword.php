
<?php
include "../../connect.php";
include "../../function.php";

if (isset($_POST['email'], $_POST['password'])) {
    
    $email = filterRequest($_POST['email']);
    $passwordHash = password_hash(filterRequest($_POST["password"]), PASSWORD_DEFAULT);
    $data = ["password" => $passwordHash];

    UpdateTable("users", $data, $con, "email = '$email'" );
    
}
?>
