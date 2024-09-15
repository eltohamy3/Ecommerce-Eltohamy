<?php
include "../../connect.php" ;
include "../../function.php" ;

// finsh prepare 
if (isset($_POST['orders_id'] ,$_POST['orders_userid'] , $_POST['type'])){
    $orders_id = filterRequest($_POST['orders_id']) ;
    $orders_userid = filterRequest($_POST['orders_userid']) ;
    $type = filterRequest($_POST['type']) ;

    if ($type == '1'){
        $data = array(
            "orders_status"=> 2
        );
    }else{
        $data = array(
            "orders_status"=> 4
        );
    }
    UpdateTable("orders" , $data , $con , "orders_id = $orders_id AND orders_status= 1") ;

}



?>