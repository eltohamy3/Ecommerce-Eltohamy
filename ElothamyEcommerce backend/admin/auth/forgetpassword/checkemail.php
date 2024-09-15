

<?php
include "../../../connect.php";
include "../../../function.php";

if (isset($_POST['admin_email']))
{
    $admin_email = filterRequest($_POST['admin_email']);    
    $stm = $con->prepare('SELECT * FROM admin WHERE admin_email = ?');
    $stm->execute(array($admin_email));
    $admin_verifycode = mt_rand(10000 ,99999); 

    if ($stm->rowCount() > 0) {

      printsuccess();
      $data = array('admin_verifycode'=>$admin_verifycode); 
      UpdateTable("admin" , $data , $con , "admin_email = '$admin_email'" , false) ;
      sendEmil("$admin_email","Ecommerce Eltohamy admin app Resetpassword verification code" ,"admin_email verification code For Ecommerce Eltohamy admin app is : $admin_verifycode <br>"  , false);

    } else {
        printFailure("this admin_email doesnot exist");
    }
}


?>