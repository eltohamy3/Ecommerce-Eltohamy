<?php
include "../../connect.php" ;
include "../../function.php" ;

    GetAllData("ordersview" , $con , array() , "orders_status = 1");
?>