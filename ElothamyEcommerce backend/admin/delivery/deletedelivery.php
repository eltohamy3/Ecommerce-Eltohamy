<?php

    include '../../connect.php' ;
    include '../../function.php' ;

    if (isset($_POST['delivery_id'])){
        $delivery_id = filterRequest($_POST['delivery_id']) ;
        DeleteFromTable("delivery" ,array($delivery_id)  , $con , "delivery_id = ?") ;
    }

?>