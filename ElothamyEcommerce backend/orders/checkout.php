


<?php
include "../connect.php";
include "../function.php";
if (isset($_POST['orders_userid'], $_POST['orders_address'], $_POST['orders_types'], $_POST['orders_priceDelivery'], $_POST['orders_price'], $_POST['orders_coupon'], $_POST["orders_paymentmethod"], $_POST['coupon_discount'])) {
    $orders_userid   = filterRequest($_POST["orders_userid"]);
    $orders_address     = filterRequest($_POST["orders_address"]);
    $orders_types   = filterRequest($_POST["orders_types"]);
    $orders_priceDelivery      = filterRequest($_POST["orders_priceDelivery"]);
    $orders_price     = filterRequest($_POST["orders_price"]);
    $orders_coupon     = filterRequest($_POST["orders_coupon"]);
    $orders_paymentmethod =  filterRequest($_POST["orders_paymentmethod"]);
    $coupon_discount = $_POST['coupon_discount'];


    $currentDate = date('Y-m-d H:i:s');

    $totalPrice = 0.0 + $orders_price + $orders_priceDelivery;

    if ($orders_coupon   != 0) {
        $data = array($orders_coupon, $currentDate);
        // check for the coupon are avialable or not in the page 
        $mydata =  GetAllData("coupon", $con, $data, " coupon_id = ? And coupon_expiredata > ? AND coupon_count > 0 ", false);

        if (!empty($mydata)) {
            $data = array(
                "coupon_count" => ($mydata[0]['coupon_count']) - 1
            );
            UpdateTable("coupon", $data, $con, "coupon_id = $orders_coupon", false);

            $totalPrice = $totalPrice - ($totalPrice * 1.0 * $coupon_discount / 100);
        }
    }

    $data = array(
        "orders_userid" => $orders_userid,
        "orders_address" => $orders_address,
        "orders_types" => $orders_types,
        "orders_priceDelivery" => $orders_priceDelivery,
        "orders_price" => $orders_price,
        "orders_coupon" => $orders_coupon,
        "orders_paymentmethod" => $orders_paymentmethod,
        "orders_totalPrice" => $totalPrice
    );
    $count =  insertIntoTable("orders", $data, $con, false);
    if ($count > 0) {

            
        // get the last order id 
        $data = array($orders_userid);
        $mydata =  ExecuteSql("(SELECT  orders_id  FROM orders WHERE  orders_userid = ? ORDER BY orders.orders_id DESC LIMIT 1)", $data, $con, false);
        $data = array(
            $mydata[0]['orders_id'] ,  $orders_userid  
        );
        
        ExecuteSql("UPDATE cart
                    JOIN cartview ON cart.cart_itemid = cartview.items_id
                    SET cart.productPriceOnOrder = cartview.priceAfterDiscount , cart.cart_orders = ?
                    WHERE cart.cart_userid =?  AND cart.cart_orders = 0;", $data, $con );
    } else {
        printFailure(" Faild TO INSERT");
    }
}



?>