<?php
include "../connect.php";
include "../function.php";


if (isset($_POST['CatId'], $_POST['user_id'])) {
    $CatId = filterRequest($_POST['CatId']);
    $user_id = filterRequest($_POST['user_id']);
    // GetAllData("itemsview" , $con , "categories_id= '$CatId'") ;
    $data = array($user_id, $CatId, $user_id, $CatId);

    ExecuteSql("SELECT itemsview1.* , 1 AS Favorite FROM itemsview1 
        JOIN favorite ON favorite.favorite_itemsid = itemsview1.items_id AND favorite.favorite_usersid= ? 
        WHERE itemsview1.items_categories= ?
          UNION ALL SELECT itemsview1.* , 0 AS Favorite  FROM itemsview1 
          WHERE itemsview1.items_id NOT IN( SELECT itemsview1.items_id FROM itemsview1 
          JOIN favorite ON favorite.favorite_itemsid = itemsview1.items_id 
           AND favorite.favorite_usersid= ? 
          )  AND itemsview1.items_categories= ?;" ,$data , $con  ) ;
}
