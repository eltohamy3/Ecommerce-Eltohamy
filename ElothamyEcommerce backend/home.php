<?php
    include "connect.php";
    include "function.php" ;

    
    
    $alldata = array(); 
    $data= array();

    $settings =  GetAllData("settings" , $con  , $data , "1=1" , false) ;
    $allData['settings'] = $settings ;
    $categories =  GetAllData("categories" , $con  , $data , "1=1" , false) ;
    $allData['categories'] = $categories ;

    $items =  GetAllData("TopSellingView" , $con   , $data , "1=1 ORDER BY NumberOfPurchases DESC LIMIT 3" , false) ;
    if (empty($items)){
        $items =  GetAllData("itemsview1" , $con   , $data , "1=1 LIMIT 3" , false) ;
    }
    $allData['items'] = $items ;

    if (empty($allData))
    {
        printFailure("No Data"); 
    }
    else{
        printsuccess($allData) ;
    }

?>