

<?php
    include "../../connect.php";
    include "../../function.php" ;

if (isset($_POST['admin_email'] , $_POST['admin_password']))
{
    
    
    $admin_email = filterRequest($_POST['admin_email']);
    $admin_password = filterRequest($_POST["admin_password"] );

    $stm = $con->prepare('SELECT * FROM admin WHERE admin_email = ?');
    $stm->execute(array($admin_email));

    if ($stm->rowCount() > 0) {

        $admin =  $stm->fetch(PDO::FETCH_ASSOC);

        $dbPassword = $admin['admin_password'] ;

        if (password_verify($admin_password, $dbPassword)) {
                        // Password is correct
            if ($admin['admin_Approve']==1)
            {
                printsuccess($admin)  ;
            }else
            {
                printFailure("email should be verifyed");
            }
        } else {
            // Password is incorrect
           printFailure("Wrong Password");
        }

    } else {
        printFailure("You Don`t have an Account please Go To SignUp Page");

    }
    

}


?>