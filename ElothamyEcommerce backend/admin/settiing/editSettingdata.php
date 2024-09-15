<?php
include "../../connect.php" ;
include "../../function.php" ;

    if (isset($_POST['settings_id'] ,$_POST['settings_title'] ,$_POST['settings_subtitle'] ,$_POST['setting_deliverytime'] ,$_POST['setting_deliveryPrice'] , ))
    $settings_id = filterRequest($_POST['settings_id']);
    $settings_title = filterRequest($_POST['settings_title']);
    $settings_subtitle = filterRequest($_POST['settings_subtitle']);
    $setting_deliverytime = filterRequest($_POST['setting_deliverytime']);
    $setting_deliveryPrice = filterRequest($_POST['setting_deliveryPrice']);

    $data =array(
        "settings_subtitle" => $settings_subtitle , 
        "settings_title" => $settings_title , 
        "setting_deliverytime" => $setting_deliverytime , 
        "setting_deliveryPrice" => $setting_deliveryPrice , 
    );
    UpdateTable("settings" , $data , $con , "settings_id = $settings_id"); 

?>