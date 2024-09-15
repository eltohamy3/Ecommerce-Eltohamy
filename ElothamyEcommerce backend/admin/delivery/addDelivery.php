
<?php
    include "../../connect.php";
    include "../../function.php" ;

if (isset($_POST['delivery_email'], $_POST['delivery_phoneNumber'], $_POST['delivery_name'], $_POST['delivery_password']))
{

    $delivery_email = filterRequest($_POST['delivery_email']);
    $delivery_phoneNumber = filterRequest($_POST['delivery_phoneNumber']);
    $delivery_name = filterRequest($_POST['delivery_name']);
    // $delivery_password = sha1(filterRequest($_POST['delivery_password']));
    $delivery_passwordHash = password_hash(filterRequest($_POST["delivery_password"]), PASSWORD_DEFAULT);

    $delivery_verifycode = mt_rand(10000 ,99999); 
    
    
    $stm = $con->prepare('SELECT * FROM delivery WHERE delivery_email = ? OR delivery_phoneNumber = ?');
    $stm->execute(array($delivery_email, $delivery_phoneNumber));
    
    if ($stm->rowCount() > 0) {
        printFailure("delivery_email or delivery_phoneNumber is already exists");
    } else {
        $stm = $con->prepare('SELECT * FROM delivery WHERE delivery_name = ?');
        $stm->execute(array($delivery_name));

        if ($stm->rowCount() > 0) {
            printFailure("delivery_name already exists, please choose another");
        } else {
            $data = array(
                "delivery_email" => $delivery_email,
                "delivery_phoneNumber" => $delivery_phoneNumber,
                "delivery_name" => $delivery_name,
                "delivery_password" => $delivery_passwordHash,
                "delivery_verifycode" => $delivery_verifycode
            );
            // insert the data
            sendEmil("$delivery_email","Ecommerce Eltohamy delivery app signUp email verification code" ,"delivery_email verification code For Ecommerce Eltohamy delivery app is : $delivery_verifycode <br>"  , false) ;
            
            insertIntoTable("delivery", $data, $con);
        }
    }
    
}
