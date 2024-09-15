<?php
include "../connect.php";
include "../function.php";


if (isset($_POST['query'])) {
    $query = filterRequest($_POST['query']);
    $data = array("%$query%" , "%$query%");
    GetAllData("itemsview1" ,$con ,$data , "items_name LIKE ? OR items_name_ar LIKE ?");
}
