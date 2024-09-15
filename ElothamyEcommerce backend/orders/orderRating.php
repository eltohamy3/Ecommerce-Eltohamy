<?php


include "../connect.php";
include "../function.php";


    if (isset($_POST['orders_id']  ,$_POST['orders_rating']  ,$_POST['orders_noteRating']   )  ){
        $orders_id = filterRequest($_POST['orders_id']) ;
        $orders_rating = filterRequest($_POST['orders_rating']) ;
        $orders_noteRating = filterRequest($_POST['orders_noteRating']) ;

        $data= array(
            "orders_id" => $orders_id , 
            "orders_rating" => $orders_rating , 
            "orders_noteRating" => $orders_noteRating , 
        ); 
        UpdateTable("orders" , $data , $con, "orders_id = $orders_id");

    }





?>