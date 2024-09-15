

<?php
include "../../connect.php";
include "../../function.php";

if (isset($_POST['email']))
{
    $email = filterRequest($_POST['email']);    
    $stm = $con->prepare('SELECT * FROM users WHERE email = ?');
    $stm->execute(array($email));
    $verifycode = mt_rand(10000 ,99999); 

    if ($stm->rowCount() > 0) {

      printsuccess();
      $data = array('verifycode'=>$verifycode); 
      UpdateTable("users" , $data , $con , "email = '$email'" , false) ;
      sendEmil("$email","Ecommerce Eltohamy Resetpassword verification code" ,"Email verification code For Ecommerce Eltohamy is : $verifycode <br>"  , false);
    } else {
        printFailure("this email doesnot exist");
    }
    

}


?>