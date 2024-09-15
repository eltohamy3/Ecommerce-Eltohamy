<?php
include "../connect.php";
include "../function.php";


if (isset( $_POST['coupon_id'], $_POST['coupon_name'] , $_POST['coupon_count']  ,  $_POST['coupon_expiredata']  , $_POST['coupon_discount'] ))
{
    $coupon_name = filterRequest($_POST['coupon_name']) ;
    $coupon_count = filterRequest($_POST['coupon_count']) ;
    $coupon_expiredata = filterRequest($_POST['coupon_expiredata']) ;
    $coupon_id = filterRequest($_POST['coupon_id']) ;
    $coupon_discount = filterRequest($_POST['coupon_discount']);
    $data = array(
        "coupon_name"=>$coupon_name , 
        "coupon_count"=>$coupon_count , 
        "coupon_expiredata"=>$coupon_expiredata , 
        "coupon_discount"=>$coupon_discount , 
    );
UpdateTable("coupon" , $data , $con , "coupon_id =$coupon_id"); 
}
?>