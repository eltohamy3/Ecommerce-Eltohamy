<?php

include "../../connect.php";
include "../../function.php";



if (isset($_POST['categories_id'], $_POST['categories_name'], $_POST['categories_name_ar'], $_POST['sendImage'])) {

    $categories_name = filterRequest($_POST['categories_name']);
    $categories_name_ar = filterRequest($_POST['categories_name_ar']);
    $categories_id = filterRequest($_POST['categories_id']);
    $sendImage = filterRequest($_POST['sendImage']);


    if ($sendImage == "false") {
        $data = array(
            "categories_name" =>   $categories_name,
            "categories_name_ar" =>   $categories_name_ar,
        );
        UpdateTable("categories", $data, $con, "categories_id = $categories_id");
    } else {
        $imageoldname = filterRequest($_POST['imageoldname']);
        $categories_image = ImageUpload('categories_image', "../../upload/categories/");
        $data = array(
            "categories_name" =>   $categories_name,
            "categories_name_ar" =>   $categories_name_ar,
            "categories_image" =>   $categories_image,
        );
        if ($categories_image != "fail") {
            UpdateTable("categories", $data, $con, "categories_id = $categories_id");
            deletFile("../../upload/categories", $imageoldname);
        } else {
            printFailure("Error while Adding Image or the exetention of the image is unknown");
        }
    }
}
