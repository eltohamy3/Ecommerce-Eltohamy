<?php

include "../../connect.php";
include "../../function.php";



if (isset($_POST['categories_name'] ,$_POST['categories_name_ar']  , $_FILES['categories_image']  )){

   $categories_name= filterRequest($_POST['categories_name']) ;
   $categories_name_ar= filterRequest($_POST['categories_name_ar']) ;
   $categories_image= ImageUpload('categories_image' , "../../upload/categories/") ;

   if ($categories_image != "fail"){
    $data = array(
        "categories_name" =>   $categories_name , 
        "categories_name_ar" =>   $categories_name_ar , 
        "categories_image" =>   $categories_image , 
    ) ;
    insertIntoTable("categories" , $data , $con) ;
    
   }else{
    printFailure("Error while Adding Image or the exetention of the image is unknown") ;
   }


}


?>