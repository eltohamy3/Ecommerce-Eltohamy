<?php

include "../connect.php";
include "../function.php";

if (isset($_POST['user_id'])) {
    $user_id = filterRequest($_POST['user_id']);

    $data = array( $user_id);

    $responce = array();

   $responce['data'] =  GetAllData("cartview" , $con , $data , "cart_userid = ?" , false);

   $responce['priceAndCount'] =  ExecuteSql("SELECT  IFNull( SUM(itemsPriceSum),0) As TotalPrice , COUNT(cart_id) As NumberOfItmesInCart FROM cartview WHERE cart_userid = ?;
   " , $data , $con , false);


   if (!empty($responce))
   {
    printsuccess($responce);
   }
}
