


<?php
include "../connect.php";
include "../function.php";
if (  isset($_POST['address_id'],$_POST['address_city'] ,$_POST['address_street'] ,$_POST['address_lat'] ,$_POST['address_long'] ,$_POST['address_name'] )){

    $address_city     = filterRequest($_POST["address_city"]) ;
    $address_street   = filterRequest($_POST["address_street"]) ;
    $address_lat      =filterRequest($_POST["address_lat"]) ;
    $address_long     = filterRequest($_POST["address_long"]) ;
    $address_id     = filterRequest($_POST["address_id"]) ;
    $address_name     = filterRequest($_POST["address_name"]) ;

    $data = array(
        "address_city"=> $address_city ,
        "address_street"=> $address_street ,
        "address_lat"=> $address_lat ,
        "address_long"=> $address_long ,
        "address_name"=> $address_name ,

    );
    UpdateTable("address" ,$data , $con  , "address_id = $address_id ");

}



?>