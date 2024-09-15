<?php
include "../connect.php";
include "../function.php";


if (isset($_POST['coupon_name']))
{
    $coupon_name = filterRequest($_POST['coupon_name']) ;
    $currentDate = date('Y-m-d H:i:s') ;
    $data = array($coupon_name  , $currentDate) ;

    $responce = GetAllData("coupon" , $con , $data , "coupon_name = ? AND coupon_expiredata > ?   AND coupon_count > 0" , false );

    if (!empty($responce)){
        printsuccess($responce) ;

    }else
    {
        printFailure('Copon Not Found') ;
    }


}




?>