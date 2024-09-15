<?php
include "../connect.php";
include "../function.php";


if (isset($_POST['coupon_name'] , $_POST['coupon_count']  ,  $_POST['coupon_expiredata'] , $_POST['coupon_discount']  ))

{
    $coupon_name = filterRequest($_POST['coupon_name']) ;
    $coupon_count = filterRequest($_POST['coupon_count']) ;
    $coupon_expiredata = filterRequest($_POST['coupon_expiredata']) ;
    $coupon_discount = filterRequest($_POST['coupon_discount']);
        
    $data = array($coupon_name);
    $responce = GetAllData("coupon" , $con , $data , "coupon_name = ?" , false );

    if (empty($responce)){
        $data = array(
            "coupon_name"=>$coupon_name , 
            "coupon_count"=>$coupon_count , 
            "coupon_expiredata"=>$coupon_expiredata , 
            "coupon_discount"=>$coupon_discount , 
        );
        insertIntoTable("coupon"  , $data , $con);
    }else
    {
        printFailure('Coupon exist pleas chang the name of the coupon') ;
    }


}




?>