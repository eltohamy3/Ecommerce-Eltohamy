
<?php
    include "../../connect.php";
    include "../../function.php" ;

if (isset($_POST['admin_email'], $_POST['admin_phoneNumber'], $_POST['admin_name'], $_POST['admin_password']))
{

    $admin_email = filterRequest($_POST['admin_email']);
    $admin_phoneNumber = filterRequest($_POST['admin_phoneNumber']);
    $admin_name = filterRequest($_POST['admin_name']);
    // $admin_password = sha1(filterRequest($_POST['admin_password']));
    $admin_passwordHash = password_hash(filterRequest($_POST["admin_password"]), PASSWORD_DEFAULT);

    $admin_verifycode = mt_rand(10000 ,99999); 
    
    
    $stm = $con->prepare('SELECT * FROM admin WHERE admin_email = ? OR admin_phoneNumber = ?');
    $stm->execute(array($admin_email, $admin_phoneNumber));
    
    if ($stm->rowCount() > 0) {
        printFailure("admin_email or admin_phoneNumber is already exists");
    } else {
        $stm = $con->prepare('SELECT * FROM admin WHERE admin_name = ?');
        $stm->execute(array($admin_name));
        
        if ($stm->rowCount() > 0) {
            printFailure("admin_name already exists, please choose another");
        } else {
            $data = array(
                "admin_email" => $admin_email,
                "admin_phoneNumber" => $admin_phoneNumber,
                "admin_name" => $admin_name,
                "admin_password" => $admin_passwordHash,
                "admin_verifycode" => $admin_verifycode
            );
            // insert the data
            sendEmil("$admin_email","Ecommerce Eltohamy admin app signUp email verification code" ,"admin_email verification code For Ecommerce Eltohamy admin app is : $admin_verifycode <br>"  , false) ;
            
            insertIntoTable("admin", $data, $con);
        }
    }
    
}
