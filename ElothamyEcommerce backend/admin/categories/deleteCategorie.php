<?php

include "../../connect.php";
include "../../function.php";



if (isset($_POST['categories_id'] , $_POST['categories_image'])){
   $categories_id= filterRequest($_POST['categories_id']) ;
   $imagename =  filterRequest($_POST['categories_image']) ;

    $data = array(
        $categories_id
    ) ;
    DeleteFromTable("categories" , $data , $con , "categories_id = ?") ;
    deletFile("../../upload/categories" , $imagename) ;

}


?>