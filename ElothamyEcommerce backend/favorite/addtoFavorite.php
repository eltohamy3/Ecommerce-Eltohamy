<?php

include "../connect.php";
include "../function.php";

if (isset($_POST['user_id'], $_POST['items_id'])) {
    $user_id = filterRequest($_POST['user_id']);
    $items_id = filterRequest($_POST['items_id']);
    $data = array(
        "favorite_usersid" => $user_id,
        "favorite_itemsid" => $items_id
    );
    insertIntoTable("favorite", $data, $con);
}
