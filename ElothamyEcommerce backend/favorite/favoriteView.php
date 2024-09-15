<?php

include "../connect.php";
include "../function.php";

if (isset($_POST['user_id'])) {
    $user_id = filterRequest($_POST['user_id']);

    $data = array( $user_id);

    ExecuteSql("SELECT itemsview1.* FROM itemsview1 JOIN favorite ON favorite.favorite_itemsid = itemsview1.items_id AND favorite.favorite_usersid = ?;
" , $data , $con);
}
