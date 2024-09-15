<?php

include "../connect.php";
include "../function.php";

if (isset($_POST['user_id'], $_POST['items_id'])) {
    $user_id = filterRequest($_POST['user_id']);
    $items_id = filterRequest($_POST['items_id']);
    $data = array(
        "cart_userid" => $user_id,
        "cart_itemid" => $items_id
    );
    insertIntoTable("cart", $data, $con);
    
}
?>