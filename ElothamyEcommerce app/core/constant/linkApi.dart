class LinkAPI {
  // static const String serverLink = "https://www.eltoo.rf.gd/EcommerceEltohamy";
  static const String serverLink = "http://10.0.2.2/ElothamyEcommerce";

  static const String UserIndex =
      "$serverLink/index.php"; // test page to check the data
  // static const String UserIndex = "https://jsonplaceholder.typicode.com/posts";

// ==========================================================================================
// =============================auth=============================================================

  static const String signUp = "$serverLink/auth/signUp.php";
  static const String editProfile = "$serverLink/auth/editProfile.php"; 
// ==========================================================================================
// =============================signUp verificaiton code=============================================================

  static const String Verificaioncode = "$serverLink/auth/verifycode.php";
  static const String resendVerificaioncode = "$serverLink/auth/resendcode.php";
  static const String signIn = "$serverLink/auth/login.php";
// ==========================================================================================
// =============================forget Password=============================================================
  static const String checkEmail =
      "$serverLink/auth/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$serverLink/auth/forgetpassword/resetpassword.php";

  static const String resetPasswordVerificationCode =
      "$serverLink/auth/forgetpassword/vereficationResetpassword.php";
// ==========================================================================================
// ==============================home============================================================

  static const String homePage = "$serverLink/home.php";
// ==========================================================================================
// ============================items page==============================================================

  static const String itemsPage = "$serverLink/items/items.php";
  static const String searchPage = "$serverLink/items/search.php";

// ==========================================================================================
// ===============================Favorite===========================================================

  static const String addToFavorite = "$serverLink/favorite/addtoFavorite.php";
  static const String removeFromFavorite =
      "$serverLink/favorite/removeFromFavorite.php";
  static const String favoriteView = "$serverLink/favorite/favoriteView.php";

// ==========================================================================================
// ===============================Cart===========================================================

  static const String addToCart = "$serverLink/cart/addToCart.php";
  static const String removeFromCart = "$serverLink/cart/RemoveFromCart.php";
  static const String cartView = "$serverLink/cart/CartView.php";
  static const String getCountItems = "$serverLink/cart/getCountItems.php";

// ==========================================================================================

// =============================== Address ===========================================================
  static const String addAddress = "$serverLink/address/addAddress.php";
  static const String removeAddress = "$serverLink/address/removeAddress.php";
  static const String viewAddress = "$serverLink/address/viewAddress.php";
  static const String editAddress = "$serverLink/address/editAddress.php";
// ==========================================================================================

// =============================== Coupon ===========================================================
  static const String checkCoupon = "$serverLink/coupon/checkCoupon.php";
// ==========================================================================================
// =============================== orders ===========================================================
  static const String checkOut = "$serverLink/orders/checkout.php";
  static const String pendingOrders = "$serverLink/orders/pendingOrders.php";
  static const String archivedOrder  = "$serverLink/orders/archivedOrder.php";
  static const String ordersDetails  = "$serverLink/orders/orderDetails.php"; 
  static const String deleteOrder  = "$serverLink/orders/deleteOrder.php";
  static const String OrderRating  = "$serverLink/orders/orderRating.php";

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
