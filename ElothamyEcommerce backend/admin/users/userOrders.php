<?php

 
include '../../connect.php' ;
include '../../function.php' ;

if (isset($_POST['user_id'])){
    $user_id = filterRequest($_POST['user_id']) ;
    GetAllData("deleveryordersview" , $con , array($user_id)
     , "orders_status = 4 And orders_userid = ?  ORDER BY orders_datatime DESC;");
}

?>