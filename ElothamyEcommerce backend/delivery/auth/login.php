

<?php
    include "../../connect.php";
    include "../../function.php" ;

if (isset($_POST['delivery_email'] , $_POST['delivery_password']))
{
    
    
    $delivery_email = filterRequest($_POST['delivery_email']);
    $delivery_password = filterRequest($_POST["delivery_password"] );

    $stm = $con->prepare('SELECT * FROM delivery WHERE delivery_email = ?');
    $stm->execute(array($delivery_email));

    if ($stm->rowCount() > 0) {

        $delivery =  $stm->fetch(PDO::FETCH_ASSOC);

        $dbPassword = $delivery['delivery_password'] ;

        if (password_verify($delivery_password, $dbPassword)) {
                        // Password is correct
            if ($delivery['delivery_Approve']==1)
            {
                printsuccess($delivery)  ;
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