<?php

include "../connect.php";
include "../function.php";

if (isset($_POST['address_id'])) {
    $address_id = filterRequest($_POST['address_id']);
    $data  = array( $address_id);
    DeleteFromTable("address", $data, $con , "address_id = ?");
    
}
