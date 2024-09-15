<?php
include "../../connect.php" ;
include "../../function.php" ;

    GetAllData("deleveryordersview" , $con , array() , "orders_status =3");

?>