<?php

include "../../connect.php";
include "../../function.php" ;

$email = filterRequest($_POST['admin_email']);

admin_resendEmail($email , $con);


?>