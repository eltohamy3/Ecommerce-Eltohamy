
<?php
include "../connect.php";
include "../function.php";

if (isset($_POST['orders_userid'])) {
    $orders_userid = filterRequest($_POST['orders_userid']) ;

    $data = array($orders_userid); 
    GetAllData("ordersview" ,$con , $data , "orders_userid = ? AND orders_status !=4") ;
    // 
    
}


?>