<?php

include "../../connect.php";
include "../../function.php";



if (isset($_POST['items_id'], $_POST['items_name'], $_POST['items_name_ar'], $_POST['sendImage'] , 
$_POST['items_desc'] 
, $_POST['items_desc_ar'] , $_POST['items_count'] , $_POST['items_active'] , $_POST['items_price']  
, $_POST['items_discount'] , $_POST['items_categories']
)){
    $items_name = filterRequest($_POST['items_name']);
    $items_name_ar = filterRequest($_POST['items_name_ar']);
    $items_id = filterRequest($_POST['items_id']);
    $sendImage = filterRequest($_POST['sendImage']);
    $items_desc= filterRequest($_POST['items_desc']) ;
    $items_desc_ar= filterRequest($_POST['items_desc_ar']) ;
    $items_count= filterRequest($_POST['items_count']) ;
    $items_active= filterRequest($_POST['items_active']) ;
    $items_price= filterRequest($_POST['items_price']) ;
    $items_discount= filterRequest($_POST['items_discount']) ;
    $items_categories= filterRequest($_POST['items_categories']) ;
    if ($sendImage == "false") {
        $data = array(
            "items_name" =>   $items_name,
            "items_name_ar" =>   $items_name_ar,
            "items_desc" =>   $items_desc , 
            "items_desc_ar" =>   $items_desc_ar , 
            "items_count" =>   $items_count , 
            "items_active" =>   $items_active , 
            "items_price" =>   $items_price , 
            "items_discount" =>   $items_discount , 
            "items_categories" =>   $items_categories 
        );
        UpdateTable("items", $data, $con, "items_id = $items_id");
    } else {
        $imageoldname = filterRequest($_POST['imageoldname']);
        $items_image = ImageUpload('items_image', "../../upload/items/");
        $data = array(
            "items_name" =>   $items_name,
            "items_name_ar" =>   $items_name_ar,
            "items_image" =>   $items_image,
            "items_desc" =>   $items_desc , 
            "items_desc_ar" =>   $items_desc_ar , 
            "items_count" =>   $items_count , 
            "items_active" =>   $items_active , 
            "items_price" =>   $items_price , 
            "items_discount" =>   $items_discount , 
            "items_categories" =>   $items_categories 
        );
        if ($items_image != "fail") {
            UpdateTable("items", $data, $con, "items_id = $items_id");
            deletFile("../../upload/items", $imageoldname);
        } else {
            printFailure("Error while Adding Image or the exetention of the image is unknown");
        }
    }
}
