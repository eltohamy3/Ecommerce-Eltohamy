<?php

include "../connect.php";
include "../function.php";
$email = filterRequest($_POST['email']);

resendEmail($email , $con)

?>