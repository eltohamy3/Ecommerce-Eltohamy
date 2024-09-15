<?php
include "../../connect.php" ;
include "../../function.php" ;

if (isset($_POST['deldelivery_id']))
     
$deldelivery_id = filterRequest($_POST['deldelivery_id']) ;

    GetAllData("ordersview" , $con , array($deldelivery_id) , "orders_status =3 AND deldelivery_id = ? ");
?>