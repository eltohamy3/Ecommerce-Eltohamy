<?php


include "../connect.php";
include "../function.php";


    if (isset($_POST['orders_id'])){
        $orders_id = filterRequest($_POST['orders_id']) ;
        $data= array($orders_id); 
        DeleteFromTable("orders" ,$data , $con , "orders_id = ? AND orders_status = 0 " ) ;

    }





?>