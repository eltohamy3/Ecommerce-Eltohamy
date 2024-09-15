

<?php
    include "../connect.php";
    include "../function.php" ;

if (isset($_POST['email'] , $_POST['password']))
{
    
    $email = filterRequest($_POST['email']);
    $password = filterRequest($_POST["password"] );

    $stm = $con->prepare('SELECT * FROM users WHERE email = ?');
    $stm->execute(array($email));


    if ($stm->rowCount() > 0) {

        $user =  $stm->fetch(PDO::FETCH_ASSOC);
        $dbPassword = $user['password'] ;

        if (password_verify($password, $dbPassword)) {
                        // Password is correct
            if ($user['userApprove']==1)
            {
                printsuccess($user)  ;
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