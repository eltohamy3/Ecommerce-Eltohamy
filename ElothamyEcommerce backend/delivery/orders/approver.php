<?php
include "../../connect.php" ;
include "../../function.php" ;

// make it on the way
if (isset($_POST['orders_id'] ,$_POST['orders_userid'] , $_POST['deldelivery_id']) ){
    $orders_id = filterRequest($_POST['orders_id']) ;
    $orders_userid = filterRequest($_POST['orders_userid']) ;
    $deldelivery_id = filterRequest($_POST['deldelivery_id']) ;

    $data = array(
        "orders_status"=> 3 , 
        "deldelivery_id"=> $deldelivery_id
    );
    UpdateTable("orders" , $data , $con , "orders_id = $orders_id AND orders_status= 2") ;
    
}



?>