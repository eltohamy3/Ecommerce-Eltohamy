<?php

include "../connect.php";
include "../function.php";

if (isset($_POST['user_id'], $_POST['items_id'])) {
    $user_id = filterRequest($_POST['user_id']);
    $items_id = filterRequest($_POST['items_id']);
    $data = array( $user_id,$items_id);
    DeleteFromTable("favorite", $data, $con , "favorite_usersid= ? AND favorite_itemsid =?");
}
