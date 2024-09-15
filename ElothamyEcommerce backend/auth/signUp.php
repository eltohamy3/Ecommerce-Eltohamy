
<?php
    include "../connect.php";
    include "../function.php" ;

if (isset($_POST['email'], $_POST['phoneNumber'], $_POST['username'], $_POST['password']))
{

    $email = filterRequest($_POST['email']);
    $phoneNumber = filterRequest($_POST['phoneNumber']);
    $username = filterRequest($_POST['username']);
    // $password = sha1(filterRequest($_POST['password']));
    $passwordHash = password_hash(filterRequest($_POST["password"]), PASSWORD_DEFAULT);

    $verifycode = mt_rand(10000 ,99999); 
    
    
    $stm = $con->prepare('SELECT * FROM users WHERE email = ? OR phoneNumber = ?');
    $stm->execute(array($email, $phoneNumber));
    
    if ($stm->rowCount() > 0) {
        printFailure("Email or phone number already exists");
    } else {
        $stm = $con->prepare('SELECT * FROM users WHERE username = ?');
        $stm->execute(array($username));
        
        if ($stm->rowCount() > 0) {
            printFailure("Username already exists, please choose another");
        } else {
            $data = array(
                "email" => $email,
                "phoneNumber" => $phoneNumber,
                "username" => $username,
                "password" => $passwordHash,
                "verifycode" => $verifycode
            );
            // insert the data
            sendEmil("$email","Ecommerce Eltohamy signUp Email verification code" ,"Email verification code For Ecommerce Eltohamy is : $verifycode <br>"  , false) ;
        
            insertIntoTable("users", $data, $con);

        }
    }
    
}
