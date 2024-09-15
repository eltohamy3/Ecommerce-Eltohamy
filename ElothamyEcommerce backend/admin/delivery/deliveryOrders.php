<?php

 
include '../../connect.php' ;
include '../../function.php' ;

if (isset($_POST['delivery_id'])){
    $delivery_id = filterRequest($_POST['delivery_id']) ;
    GetAllData("deleveryordersview" , $con , array($delivery_id)
     , "orders_status = 4 And delivery_id = ?  ORDER BY orders_datatime DESC;");
}

?>