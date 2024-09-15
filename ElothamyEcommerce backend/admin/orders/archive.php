<?php
include "../../connect.php" ;
include "../../function.php" ;

    GetAllData("deleveryordersview" , $con , array() , "orders_status = 4 ORDER BY orders_datatime DESC;");


?>