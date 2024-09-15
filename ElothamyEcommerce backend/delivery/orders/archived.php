<?php
include "../../connect.php" ;
include "../../function.php" ;

if (isset($_POST['orders_id'] ,$_POST['orders_userid'])){
    $orders_id = filterRequest($_POST['orders_id']) ;
    $orders_userid = filterRequest($_POST['orders_userid']) ;
    $data = array(
        "orders_status"=> 4 );
    UpdateTable("orders" , $data , $con , "orders_id = $orders_id AND orders_status= 3") ;

}



?>