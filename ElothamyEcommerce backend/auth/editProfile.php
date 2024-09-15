
<?php
    include "../connect.php";
    include "../function.php" ;

if (isset( $_POST['phoneNumber'], $_POST['username'], $_POST['user_id']))
{

    $user_id = filterRequest($_POST['user_id']);
    $phoneNumber = filterRequest($_POST['phoneNumber']);
    $username = filterRequest($_POST['username']);
    // $password = sha1(filterRequest($_POST['password']));

    $responce = GetAllData("users" , $con , array($user_id ,$phoneNumber) , "user_id != ? AND  phoneNumber = ?"  , false) ;

    if (!empty($responce)) {
        printFailure("phone number already exists please chose Another one");
    } else {
        $responce = GetAllData("users" , $con , array($user_id ,$username) , "user_id != ? AND  username = ?"  , false) ;

        if (!empty($responce)) {
            printFailure("Username already exists, enter anothe ");
        } else {
            $data = array(
                "phoneNumber" => $phoneNumber,
                "username" => $username,
            );
            UpdateTable("users" , $data , $con , "user_id = $user_id");         
        }
    }
    
}
