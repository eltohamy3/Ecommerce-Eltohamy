<?php

// echo "try to connect" ;

// $dsn = "mysql:host=sql206.infinityfree.com;dbname=if0_37008512_eltohamyecommerce";   // Data source name
// $user = "if0_37008512"; // ده كدا يعتبر ادمن 
// $password = "DqamTUCeRZko7Ln";
// $dsn = "mysql:host=sql106.ezyro.com;dbname=ezyro_37007789_eltohamyecommerce";   // Data source name
// $user = "ezyro_37007789"; // ده كدا يعتبر ادمن 
// $password = "Abdo1234*";
$dsn = "mysql:host=127.0.0.1:3306;dbname=newecommerceeltohamy";   // Data source name
// $dsn = "mysql:host=127.0.0.1:3306;dbname=testdatabase";   // Data source name

$user = "root";    // ده كدا يعتبر ادمن 
$password = "";
$option = array(
    PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES UTF8" // عشان يدعم اللغة العربية
); // array to make more than one option 
try {
    $con = new PDO($dsn, $user, $password, $option);
    $con->setAttribute(PDO::ATTR_EMULATE_PREPARES,false);

    $con->setAttribute(
        PDO::ATTR_ERRMODE,
        PDO::ERRMODE_EXCEPTION   // to make atterabute
    );
    // $PDO->setAttribute(PDO::ATTR_EMULATE_PREPARES,false);

    // header("Access-Control-Allow-Origin: *");
    // header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With, Access-Control-Allow-Origin");
    // header("Access-Control-Allow-Methods: POST, OPTIONS , GET");
    // include 'function.php';
    // echo "connect successfully" ;
    // checkAuthenticate();
} catch (PDOException $e) {
    // include 'function.php';
        // include 'function.php';
        // echo "error successfully" ;

    echo $e->getMessage();

    
}
