<?php
include "../connect.php";
include "../function.php";


if (isset($_POST['coupon_id'] ))

{
    $coupon_id = filterRequest($_POST['coupon_id']) ;
    $data = array($coupon_id);
    DeleteFromTable("coupon" , $data , $con , "coupon_id = ?");
}


