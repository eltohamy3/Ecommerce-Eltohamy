<?php

include "../connect.php";
include "../function.php";

if (isset($_POST['user_id'], $_POST['items_id'])) {
    $user_id = filterRequest($_POST['user_id']);
    $items_id = filterRequest($_POST['items_id']);
    $data  = array( $user_id,$items_id);
    DeleteFromTable("cart", $data, $con , "cart_id =(SELECT cart_id FROM cart WHERE cart_userid = ? AND cart_itemid = ? AND cart.cart_orders =0 LIMIT 1)");


    
}
