

<?php
include "../../../connect.php";
include "../../../function.php";

if (isset($_POST['delivery_email']))
{
    $delivery_email = filterRequest($_POST['delivery_email']);    
    $stm = $con->prepare('SELECT * FROM delivery WHERE delivery_email = ?');
    $stm->execute(array($delivery_email));
    $delivery_verifycode = mt_rand(10000 ,99999); 

    if ($stm->rowCount() > 0) {

      printsuccess();
      $data = array('delivery_verifycode'=>$delivery_verifycode); 
      UpdateTable("delivery" , $data , $con , "delivery_email = '$delivery_email'" , false) ;
      sendEmil("$delivery_email","Ecommerce Eltohamy delivery app Resetpassword verification code" ,"delivery_email verification code For Ecommerce Eltohamy delivery app is : $delivery_verifycode <br>"  , false);

    } else {
        printFailure("this delivery_email doesnot exist");
    }
}


?>