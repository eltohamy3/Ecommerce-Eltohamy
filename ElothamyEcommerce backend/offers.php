<?php
    include "connect.php";
    include "function.php" ;

    if (isset($_POST['user_id'])){

    
        // GetAllData("itemsview1" , $con   , $data , "items_discount>0" ) ;
        $user_id = filterRequest($_POST['user_id']);
        $data = array($user_id, $user_id);

        ExecuteSql("SELECT itemsview1.* , 1 AS Favorite FROM itemsview1 
            JOIN favorite ON favorite.favorite_itemsid = itemsview1.items_id AND favorite.favorite_usersid= ? 
            WHERE itemsview1.items_discount > 0
              UNION ALL SELECT itemsview1.* , 0 AS Favorite  FROM itemsview1 
              WHERE itemsview1.items_id NOT IN( SELECT itemsview1.items_id FROM itemsview1 
              JOIN favorite ON favorite.favorite_itemsid = itemsview1.items_id 
               AND favorite.favorite_usersid= ? 
              )  AND itemsview1.items_discount > 0 ;" ,$data , $con  ) ;
    }

?>