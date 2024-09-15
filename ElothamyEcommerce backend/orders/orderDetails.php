<?php


include "../connect.php";
include "../function.php";


    if (isset($_POST['orders_id'])){
        $orders_id = filterRequest($_POST['orders_id']) ;
        $data= array($orders_id); 
        ExecuteSql("SELECT cart.* , COUNT(cart.cart_itemid) As NumberOfItems , SUM(cart.productPriceOnOrder) As PriceOfItems , itemsview1.* FROM cart
         JOIN ordersview ON ordersview.orders_id = cart.cart_orders JOIN itemsview1 ON itemsview1.items_id= cart.cart_itemid 
         WHERE cart.cart_orders = ? GROUP BY cart.cart_itemid;" ,$data , $con );


    }




?>