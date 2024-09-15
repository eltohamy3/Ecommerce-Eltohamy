<?php

include "../connect.php";
include "../function.php";

if (isset($_POST['user_id'], $_POST['items_id'])) {
    $user_id = filterRequest($_POST['user_id']);
    $items_id = filterRequest($_POST['items_id']);
    $data = array(
        $user_id,
         $items_id
    );
    $sql = "SELECT COUNT(cart.cart_id) As NumberOfItems FROM cart WHERE cart.cart_userid = ? AND cart.cart_itemid =? AND cart.cart_orders =0 ;";
    ExecuteSql( $sql, $data, $con );
}
?>


