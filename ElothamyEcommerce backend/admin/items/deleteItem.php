<?php

include "../../connect.php";
include "../../function.php";



if (isset($_POST['items_id'] , $_POST['items_image'])){

   $items_id= filterRequest($_POST['items_id']) ;
   $imagename =  filterRequest($_POST['items_image']) ;

    $data = array(
        $items_id
    ) ;
    DeleteFromTable("items" , $data , $con , "items_id = ?") ;
    deletFile("../../upload/items" , $imagename) ;

}


?>