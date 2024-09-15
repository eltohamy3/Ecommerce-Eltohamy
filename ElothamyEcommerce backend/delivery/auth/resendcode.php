<?php

include "../../connect.php";
include "../../function.php" ;

$email = filterRequest($_POST['delivery_email']);

delivery_resendEmail($email , $con)

?>