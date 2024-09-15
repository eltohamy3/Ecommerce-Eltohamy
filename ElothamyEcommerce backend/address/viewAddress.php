<?php

include "../connect.php";
include "../function.php";

if (isset($_POST['address_userid'])) {
    $address_userid = filterRequest($_POST['address_userid']);

    $data = array($address_userid);
     GetAllData("address" , $con , $data , " address_userid =?" );
}
