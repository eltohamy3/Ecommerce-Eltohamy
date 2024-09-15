class LinkAPI {
  // static const String serverLink = "https://www.eltoo.rf.gd/EcommerceEltohamy";
  static const String serverLink = "http://10.0.2.2/ElothamyEcommerce";

  static const String UserIndex =
      "$serverLink/index.php"; // test page to check the data
  // static const String UserIndex = "https://jsonplaceholder.typicode.com/posts";

// ==========================================================================================
// =============================auth=============================================================

  static const String signUp = "$serverLink/delivery/auth/signUp.php";
  //
// ==========================================================================================
// =============================signUp verificaiton code=============================================================

  static const String Verificaioncode = "$serverLink/delivery/auth/verifycode.php";
  static const String resendVerificaioncode = "$serverLink/delivery/auth/resendcode.php";
  static const String signIn = "$serverLink/delivery/auth/login.php";
// ==========================================================================================
// =============================forget Password=============================================================
  static const String checkEmail =
      "$serverLink/delivery/auth/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$serverLink/delivery/auth/forgetpassword/resetpassword.php";

  static const String resetPasswordVerificationCode =
      "$serverLink/delivery/auth/forgetpassword/vereficationResetpassword.php";
// ==========================================================================================
// ==============================home============================================================

  static const String homePage = "$serverLink/home.php";
// ==========================================================================================

// =============================== Address ===========================================================
  static const String addAddress = "$serverLink/address/addAddress.php";
  static const String removeAddress = "$serverLink/address/removeAddress.php";
  static const String viewAddress = "$serverLink/address/viewAdress.php";
  static const String editAddress = "$serverLink/address/editAddress.php";
// ==========================================================================================

// =============================== orders ===========================================================
  static const String checkOut = "$serverLink/orders/checkout.php";
  static const String pendingOrders = "$serverLink/delivery/orders/pendingOrders.php";
  static const String archivedOrder  = "$serverLink/delivery/orders/archivedView.php";
  static const String onTheWayOrders  = "$serverLink/delivery/orders/ontheWayview.php";


  static const String ordersDetails  = "$serverLink/orders/orderDetails.php"; 
  static const String deleteOrder  = "$serverLink/orders/deleteOrder.php";
  static const String OrderRating  = "$serverLink/orders/orderRating.php";
  static const String orderApprove  = "$serverLink/delivery/orders/approver.php";
  static const String OrderDone  = "$serverLink/delivery/orders/archived.php";


// ==========================================================================================
// =============================== offers ===========================================================
  static const String offers = "$serverLink/offers.php";
// ==========================================================================================
// =============================== Images===========================================================

  static const String ImageSource = "$serverLink/upload";
  static const String categoresImage = "$ImageSource/categories";
  static const String ItemsImage = "$ImageSource/items";

// ==========================================================================================
}
