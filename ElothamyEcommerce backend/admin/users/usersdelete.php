<?php

    include '../../connect.php' ;
    include '../../function.php' ;

    if (isset($_POST['user_id'])){
        $user_id = filterRequest($_POST['user_id']) ;
        DeleteFromTable("users" ,array($user_id)  , $con , "user_id = ?") ;
    }
?>