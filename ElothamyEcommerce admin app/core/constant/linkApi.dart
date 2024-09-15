class LinkAPI {
  // static const String serverLink = "https://www.eltoo.rf.gd/EcommerceEltohamy";
  static const String serverLink = "http://10.0.2.2/ElothamyEcommerce";

  static const String UserIndex =
      "$serverLink/index.php"; // test page to check the data
  // static const String UserIndex = "https://jsonplaceholder.typicode.com/posts";

// ==========================================================================================
// =============================auth=============================================================

  static const String signUp = "$serverLink/admin/auth/signUp.php";
  //
// ==========================================================================================
// =============================signUp verificaiton code=============================================================

  static const String Verificaioncode = "$serverLink/admin/auth/verifycode.php";
  static const String resendVerificaioncode =
      "$serverLink/admin/auth/resendcode.php";
  static const String signIn = "$serverLink/admin/auth/login.php";
// ==========================================================================================
// =============================forget Password=============================================================
  static const String checkEmail =
      "$serverLink/admin/auth/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$serverLink/admin/auth/forgetpassword/resetpassword.php";

  static const String resetPasswordVerificationCode =
      "$serverLink/admin/auth/forgetpassword/vereficationResetpassword.php";
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
// =============================== categories ===========================================================
  static const String addcategories =
      "$serverLink/admin/categories/addCategorie.php";
  static const String removecategories =
      "$serverLink/admin/categories/deleteCategorie.php";
  static const String viewcategories =
      "$serverLink/admin/categories/viewcategories.php";
  static const String editcategories =
      "$serverLink/admin/categories/editCategorie.php";
// ==========================================================================================
// =============================== items ===========================================================
  static const String additems = "$serverLink/admin/items/addItem.php";
  static const String removeitems = "$serverLink/admin/items/deleteItem.php";
  static const String viewitems = "$serverLink/admin/items/viewItems.php";
  static const String edititems = "$serverLink/admin/items/editItem.php";
// ==========================================================================================

// =============================== orders ===========================================================
  static const String checkOut = "$serverLink/orders/checkout.php";
  static const String pendingOrders =
      "$serverLink/delivery/orders/pendingOrders.php";
  static const String archivedOrder =
      "$serverLink/delivery/orders/archivedView.php";
  static const String onTheWayOrders =
      "$serverLink/delivery/orders/ontheWayview.php";

  // admin app order
  static const String deleveryWatingview =
      "$serverLink/admin/orders/deleverywating.php";
  static const String viewArchived = "$serverLink/admin/orders/archive.php";
  static const String viewpending = "$serverLink/admin/orders/pendingview.php";
  static const String viewApproved = "$serverLink/admin/orders/viewaproved.php";
  static const String viewOrdersOntheWay = "$serverLink/admin/orders/onthewaydelevery.php";
  static const String preparOrder = "$serverLink/admin/orders/prepare.php";
  static const String approveOrder = "$serverLink/admin/orders/approve.php";

  static const String ordersDetails = "$serverLink/orders/orderDetails.php";
  static const String deleteOrder = "$serverLink/orders/deleteOrder.php";
  static const String OrderRating = "$serverLink/orders/orderRating.php";


  // static const String orderApprove = "$serverLink/delivery/orders/approver.php";
  // static const String OrderDone = "$serverLink/delivery/orders/archived.php";

// ==========================================================================================
// =============================== offers ===========================================================
  static const String offers = "$serverLink/offers.php";
// ==========================================================================================
// =============================== Images===========================================================

  static const String ImageSource = "$serverLink/upload";
  static const String categoresImage = "$ImageSource/categories";
  static const String ItemsImage = "$ImageSource/items";

// ==========================================================================================
// =============================== users ===========================================================
  static const String usersView = "$serverLink/admin/users/usersview.php";
  static const String userDelete = "$serverLink/admin/users/usersdelete.php";
  static const String userOrders = "$serverLink/admin/users/userOrders.php";

// ==========================================================================================
// =============================== delevery ===========================================================
  static const String deliveryView = "$serverLink/admin/delivery/deliveryview.php";
  static const String deliveryDelete = "$serverLink/admin/delivery/deletedelivery.php";
  static const String deliveryAdd = "$serverLink/admin/delivery/addDelivery.php";
  static const String deliveryOrder = "$serverLink/admin/delivery/deliveryOrders.php";

// ==========================================================================================
// =============================== coupon ===========================================================
  static const String couponView = "$serverLink/coupon/couponView.php";
  static const String couponDelete = "$serverLink/coupon/deletecopone.php";
  static const String couponAdd = "$serverLink/coupon/addcopone.php";
  static const String couponEdit = "$serverLink/coupon/editcopone.php";

// ==========================================================================================
// =============================== setting ===========================================================
  static const String settingGetData = "$serverLink/admin/settiing/Getsettingdata.php";
  static const String settingEdit = "$serverLink/admin/settiing/editSettingdata.php"; 

// ==========================================================================================

}


