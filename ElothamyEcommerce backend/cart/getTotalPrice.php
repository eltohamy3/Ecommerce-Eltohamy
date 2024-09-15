<?php

include "../connect.php" ;
include "../function.php";

if (isset($_POST['user_id'])) {
    $user_id = filterRequest($_POST['user_id']);

    $data = array( $user_id);


}
?>
