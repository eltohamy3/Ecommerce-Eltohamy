<?php

include "../../connect.php";
include "../../function.php";
if (isset($_POST['items_name'] ,$_POST['items_name_ar']  , $_FILES['items_image']  , $_POST['items_desc'] 
, $_POST['items_desc_ar'] , $_POST['items_count'] , $_POST['items_active'] , $_POST['items_price']  
, $_POST['items_discount'] , $_POST['items_categories']

)){
   $items_name= filterRequest($_POST['items_name']) ;
   $items_name_ar= filterRequest($_POST['items_name_ar']) ;
   $items_image= ImageUpload('items_image' , "../../upload/items/") ;
   $items_desc= filterRequest($_POST['items_desc']) ;
   $items_desc_ar= filterRequest($_POST['items_desc_ar']) ;
   $items_count= filterRequest($_POST['items_count']) ;
   $items_active= filterRequest($_POST['items_active']) ;
   $items_price= filterRequest($_POST['items_price']) ;
   $items_discount= filterRequest($_POST['items_discount']) ;
   $items_categories= filterRequest($_POST['items_categories']) ;
   if ($items_image != "fail"){
    $data = array(
        "items_name" =>   $items_name , 
        "items_name_ar" =>   $items_name_ar , 
        "items_image" =>   $items_image , 
        "items_desc" =>   $items_desc , 
        "items_desc_ar" =>   $items_desc_ar , 
        "items_count" =>   $items_count , 
        "items_active" =>   $items_active , 
        "items_price" =>   $items_price , 
        "items_discount" =>   $items_discount , 
        "items_categories" =>   $items_categories 
    ) ;
    insertIntoTable("items" , $data , $con) ;
   }else{
    printFailure("Error while Adding Image or the exetention of the image is unknown") ;
   }
}


?>