

<?php

define("MB", 1048576);
function filterRequest($value)
{
   return  htmlspecialchars(strip_tags($value));
}

// image request related to the image file request name

function ImageUpload($imageRequest , string $movedpath)
{

    $msgError = array() ;
   $imagename = rand(1000, 100000) . $_FILES[$imageRequest]['name'];
   $imagetmp = $_FILES[$imageRequest]['tmp_name'];
   $imagesize = $_FILES[$imageRequest]['size'];
   $allowExt = array('jpg', 'png', 'gif', 'mp3', 'pdf' , 'svg');
   $ext = explode(".", $imagename);
   $imageExt = end($ext);
   $imageExt = strtolower($imageExt);

   if (!empty($imagename) && !in_array($imageExt, $allowExt)) {
      $msgError[] = "Ext";
   }
   if ($imagesize > 10 *  MB) {
      $msgError[] = "size";
   }
   if (!empty($msgError)) {
      return "fail"; 
   } else {
      move_uploaded_file($imagetmp, $movedpath. $imagename);
      return $imagename;
   }
}

function deletFile($dirpath, $imagename)
{

   if (file_exists($dirpath . "/" . $imagename)) {
      unlink($dirpath . "/" . $imagename);
   }
}
function printFailure($message = "none")
{
   header('Content-Type: application/json');

   echo json_encode(array("status" => "Failure", "message" => $message));
}


function printsuccess(array $data = null, $message = "none")
{
   header('Content-Type: application/json');

   echo json_encode(array("status" => "Success", "message" => $message, "data" => $data));
}


// function checkAuthenticate()
// {
//    if (isset($_SERVER['PHP_AUTH_USER'])  && isset($_SERVER['PHP_AUTH_PW'])) {

//       if ($_SERVER['PHP_AUTH_USER'] != "abdo" ||  $_SERVER['PHP_AUTH_PW'] != "eltoo*") {
//          header('WWW-Authenticate: Basic realm="My Realm"');
//          header('HTTP/1.0 401 Unauthorized');
//          echo 'Page Not Found';
//          exit;
//       }
//    } else {
//       exit;
//    }
// }
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer/src/Exception.php';
require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/SMTP.php';
function sendEmil(string $to, string $tile, string $body, bool $output = true)
{

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
      $mail->addAddress($to);     //Add a recipient // recever

      $mail->isHTML(true);                                  //Set email format to HTML
      $mail->Subject = $tile;
      $mail->Body    = $body;
      // $mail->Body    = 'This is the HTML message body <b>in bold!</b>';

      // Your PHPMailer code here...
      $mail->send();
      if ($output)
         printsuccess() ;
   } catch (Exception $e) {
      if ($output)
         printFailure("Worng Email");
      // die("Connection Error: {$mail->ErrorInfo}");

   }
}

function  GetAllData(string $table, PDO $con, array $data, String $where = "1=1", bool $json = true)
{
   $stm = $con->prepare("SELECT * FROM $table WHERE $where");
   $stm->execute($data);
   if ($stm->rowCount() > 0) {
      $data = $stm->fetchAll(PDO::FETCH_ASSOC);
      if ($json) {
         header('Content-Type: application/json');

         echo json_encode(array("status" => "Success", "data" => $data));
      }
      return $data;
   } else {
      if ($json)
         printFailure("Data is Empty");
   }
}

// get only one data
function  GetData(string $table, PDO $con, String $where = "", array $values = null)
{
   $stm = $con->prepare("SELECT * FROM $table WHERE $where");
   $stm->execute($values);
   if ($stm->rowCount() > 0) {
      $data = $stm->fetch(PDO::FETCH_ASSOC);
      header('Content-Type: application/json');
      echo json_encode(array("status" => "Success", "data" => $data));
   } else {
      printFailure("Data is Empty");
   }
}
function insertIntoTable(
   string $table,
   array $data,
   PDO $con,
   bool $json = true
) {
   $column = array_keys($data);
   $columnString = "";
   $valuesString = "";
   for ($i = 0; $i < count($column); $i++) {
      $columnString .= $column[$i];
      $valuesString .= "?";
      if ($i < count($column) - 1) {
         $columnString .= ",";
         $valuesString .= ",";
      }
   }

   $values = array_values($data);

   $sql = "INSERT INTO $table ($columnString) VALUES ($valuesString)";
   // echo $sql; // Debug: print SQL statement
   // print_r($values); // Debug: print values array
   $stm = $con->prepare($sql);
   // echo "<br>" ;
   try {
      $stm->execute($values);
      $count = $stm->rowCount();

      if ($count > 0) {
         header('Content-Type: application/json');
         if ($json)
            printsuccess();
      } else {
         header('Content-Type: application/json');
         if ($json)
            printFailure(" Faild TO INSERT");
      }
      return $count;
   } catch (PDOException $e) {
      if ($json)
         printFailure(" Faild TO INSERT because $e $sql  ");
      return -1;
   }
}
function  printArray(array $arr)
{
   header('Content-Type: application/json');

   echo json_encode($arr);
}

function UpdateTable(string $table, array $data, PDO $con, string $where, bool $output = true)
{
   // Build the SET part of the query
   $columnSet = "";

   $i = 0;
   foreach ($data as $col => $val) {
      $columnSet .= "$col = ?";
      if ($i < count($data) - 1) {
         $columnSet .= ", ";
      }
      $i++;
   }

   $sql = "UPDATE $table SET $columnSet WHERE $where";

   // echo $sql; 
   // print_r(array_values($data)); 

   $stmt = $con->prepare($sql);

   try {
      $stmt->execute(array_values($data));
      if ($output) {
         if ($stmt->rowCount() > 0) {
            header('Content-Type: application/json');
            printsuccess();
         } else {
            printFailure("Failed to update because no feach data");
         }
      }
   } catch (PDOException $e) {

      if ($output)
         printFailure("Failed to update because $e");
   }
}
function ExecuteSql(string $sql, array $data, PDO $con, bool $output = true)
{
   try {
      $stm = $con->prepare($sql);
      $stm->execute($data);

      if ($stm->rowCount() > 0) {
         $data = $stm->fetchAll(PDO::FETCH_ASSOC);
         if ($output)
            printsuccess($data);
         return $data;
      } else {
         if ($output)

            printFailure("Data Is empty ");
      }
   } catch (PDOException $e) {
      if ($output)

         printFailure("ServerError $e ");
   }
}
// 
function DeleteFromTable(string $table, array $data, PDO $con, string $where, bool $output = true)
{
   // Build the SET part of the query


   $sql = "DELETE FROM $table WHERE $where";

   // echo $sql; 
   // print_r(array_values($data)); 

   $stmt = $con->prepare($sql);

   try {
      $stmt->execute(array_values($data));
      if ($output) {
         if ($stmt->rowCount() > 0) {
            header('Content-Type: application/json');
            printsuccess();
         } else {
            printFailure("Failed to update");
         }
      }
   } catch (PDOException $e) {

      if ($output)
         printFailure("Failed to update because $e");
   }
}

function  resendEmail(string $email, PDO $con)
{
   $verifycode = mt_rand(10000, 99999);
   $stmt = $con->prepare('SELECT verifycode FROM users WHERE email = ?');
   $stmt->execute([$email]);

   if ($stmt->rowCount() > 0) {
      $data = array('verifycode' => $verifycode);

      UpdateTable("users", $data, $con, "email = '$email'", false);
      sendEmil("$email", "Ecommerce Eltohamy Resetpassword verification code", "Email verification code For Ecommerce Eltohamy is : $verifycode <br>", false);
      printsuccess();
   } else {
      printFailure("Email not found");
   }
}

function  delivery_resendEmail(string $email, PDO $con)
{
   $verifycode = mt_rand(10000, 99999);
   $stmt = $con->prepare('SELECT delivery_verifycode FROM delivery WHERE delivery_email = ?');
   $stmt->execute([$email]);

   if ($stmt->rowCount() > 0) {
      $data = array('delivery_verifycode' => $verifycode);

      UpdateTable("delivery", $data, $con, "delivery_email = '$email'", false);
      sendEmil("$email", "Ecommerce Eltohamy delivery App Resetpassword verification code", "Email verification code For Ecommerce Eltohamy delivery app is : $verifycode <br>");
   } else {
      printFailure("Email not found");
   }
}

function  admin_resendEmail(string $email, PDO $con)
{
   $verifycode = mt_rand(10000, 99999);
   $stmt = $con->prepare('SELECT admin_verifycode FROM admin WHERE admin_email = ?');
   $stmt->execute([$email]);

   if ($stmt->rowCount() > 0) {
      $data = array('admin_verifycode' => $verifycode);

      UpdateTable("admin", $data, $con, "admin_email = '$email'", false);
      sendEmil("$email", "Ecommerce Eltohamy admin App Resetpassword verification code", "Email verification code For Ecommerce Eltohamy admin app is : $verifycode <br>");
   } else {
      printFailure("Email not found");
   }
}


function sendGCM($title, $message, $topic, $pageid, $pagename)
{
   $url = 'https://fcm.googleapis.com/fcm/send';

   $fields = array(
      "to" => '/topics/' . $topic,
      'priority' => 'high',
      'content_available' => true,
      'notification' => array(
         "body" =>  $message,
         "title" =>  $title,
         "click_action" => "FLUTTER_NOTIFICATION_CLICK",
         "sound" => "default"

      ),
      'data' => array(
         "pageid" => $pageid,
         "pagename" => $pagename
      )

   );

   $fields = json_encode($fields);
   $headers = array(
      'Authorization: key=' . "",
      'Content-Type: application/json'
   );

   $ch = curl_init();
   curl_setopt($ch, CURLOPT_URL, $url);
   curl_setopt($ch, CURLOPT_POST, true);
   curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
   curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
   curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);

   $result = curl_exec($ch);
   return $result;
   curl_close($ch);
}
