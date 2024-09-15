
<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer/src/Exception.php';
require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/SMTP.php';
//Import PHPMailer classes into the global namespace
//These must be at the top of your script, not inside a function


//Load Composer's autoloader
// require 'vendor/autoload.php';

//Create an instance; passing `true` enables exceptions

try {
  $mail = new PHPMailer(true);

  //Server settings
  $mail->SMTPDebug = 0; // SMTP::DEBUG_SERVER;                      //Enable verbose debug output
  $mail->isSMTP();                                            //Send using SMTP
  $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
  $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
  $mail->Username   = 'elitegame178@gmail.com';                     //SMTP username
  $mail->Password   = 'kpqkvcyywyonbyoh';                               //SMTP password
  $mail->SMTPSecure = 'ssl';    //Enable implicit TLS encryption
  $mail->Port       = 465;              // 465 for ssl  and 587 for tls    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`
  //Recipients
  $mail->setFrom('elitegame178@gmail.com');
  $mail->addAddress("aboudeltohamy@gmail.com");     //Add a recipient // recever
  
  $code = mt_rand(10000, 99999);
  $mail->isHTML(true);                                  //Set email format to HTML
  $mail->Subject = "Email verification code For Ecommerce Eltohamy";
  $mail->Body    = "Email verification code For Ecommerce Eltohamy is : $code <br>";
  // $mail->Body    = 'This is the HTML message body <b>in bold!</b>';
  
  // Your PHPMailer code here...
  $mail->send();
  session_start();
} 
catch (Exception $e) {
  die("Connection Error: {$mail->ErrorInfo}");
}
?>