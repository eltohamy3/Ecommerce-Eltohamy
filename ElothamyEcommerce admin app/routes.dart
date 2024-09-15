import 'package:eltohamyecommerceadminapp/binding/homebinding.dart';
import 'package:eltohamyecommerceadminapp/binding/orders/orderDetailsBindeing.dart';
import 'package:eltohamyecommerceadminapp/binding/orders/ordersArchivedBinding.dart';
import 'package:eltohamyecommerceadminapp/binding/orders/ordersPendingBinding.dart';
import 'package:eltohamyecommerceadminapp/core/middleware/eltoomeddleware.dart';
import 'package:eltohamyecommerceadminapp/view/screen/SettingTextEditing.dart';
import 'package:eltohamyecommerceadminapp/view/screen/address/addAddress.dart';
import 'package:eltohamyecommerceadminapp/view/screen/address/editAddress.dart';
import 'package:eltohamyecommerceadminapp/view/screen/address/viewAddress.dart';
import 'package:eltohamyecommerceadminapp/view/screen/categories/categoriesadd.dart';
import 'package:eltohamyecommerceadminapp/view/screen/categories/categoriesedit.dart';
import 'package:eltohamyecommerceadminapp/view/screen/categories/categoriesview.dart';
import 'package:eltohamyecommerceadminapp/view/screen/coupon/couponAdd.dart';
import 'package:eltohamyecommerceadminapp/view/screen/coupon/couponEdit.dart';
import 'package:eltohamyecommerceadminapp/view/screen/coupon/couponView.dart';
import 'package:eltohamyecommerceadminapp/view/screen/delvery/deliveryAdd.dart';
import 'package:eltohamyecommerceadminapp/view/screen/delvery/deliveryOrders.dart';
import 'package:eltohamyecommerceadminapp/view/screen/delvery/deliveryView.dart';
import 'package:eltohamyecommerceadminapp/view/screen/home.dart';
import 'package:eltohamyecommerceadminapp/view/screen/items/itemsadd.dart';
import 'package:eltohamyecommerceadminapp/view/screen/items/itemsedit.dart';
import 'package:eltohamyecommerceadminapp/view/screen/items/itemsview.dart';
import 'package:eltohamyecommerceadminapp/view/screen/orders/ordersArchive.dart';
import 'package:eltohamyecommerceadminapp/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:eltohamyecommerceadminapp/view/screen/auth/signUP/checkEmail.dart';
import 'package:eltohamyecommerceadminapp/view/screen/auth/signUP/signupverificaitoncode.dart';
import 'package:eltohamyecommerceadminapp/view/screen/auth/signUP/success_singUp.dart';
import 'package:eltohamyecommerceadminapp/core/constant/routename.dart';
import 'package:eltohamyecommerceadminapp/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:eltohamyecommerceadminapp/view/screen/auth/loginpage.dart';
import 'package:eltohamyecommerceadminapp/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:eltohamyecommerceadminapp/view/screen/auth/signUP/signUp.dart';
import 'package:eltohamyecommerceadminapp/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:eltohamyecommerceadminapp/view/screen/orders/orderscreen.dart';
import 'package:eltohamyecommerceadminapp/view/screen/language.dart';
import 'package:eltohamyecommerceadminapp/view/screen/onboarding.dart';
import 'package:eltohamyecommerceadminapp/view/screen/orders/orderDetails.dart';
import 'package:eltohamyecommerceadminapp/view/screen/orders/pendingOrders.dart';
import 'package:eltohamyecommerceadminapp/view/screen/orders/tracking.dart';
import 'package:eltohamyecommerceadminapp/view/screen/setting.dart';
import 'package:eltohamyecommerceadminapp/view/screen/users/usersOrders.dart';
import 'package:eltohamyecommerceadminapp/view/screen/users/usersView.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>> GetRoutes = [

  // language 
  GetPage(name: AppRoute.languagepage, page:() =>  const Language()  , middlewares:[
    AppMeddleWare()
  ]) ,

  // OnBoarding
  GetPage(name: AppRoute.onBoarding, page:() =>  const OnBoarding() ) ,
  // Auth
  GetPage(name: AppRoute.login, page:() =>  const Login() ),
  GetPage(name: AppRoute.signUp, page:() =>  const SignUp() ) ,
  GetPage(name: AppRoute.Forgetpassword, page:() =>  const ForgetPassword() ),
  GetPage(name: AppRoute.verfiycode, page:() =>  const VerificaitonCode() ) ,
  GetPage(name: AppRoute.resetPassword, page:() =>  const ResetPassword() ),
  GetPage(name: AppRoute.successResetPassword, page:() =>  const SuccessResetPassword() ) ,
  GetPage(name: AppRoute.successSignUp, page:() =>  const SuccessSingUp() ),
  GetPage(name: AppRoute.signUPCheckEmail, page:() =>  const CheckEmail() ) ,
  GetPage(name: AppRoute.signUpVerificationCode, page:() =>  const SignUpVerificationCode() ),


  // 
      // =============================home========================================

  GetPage(name: AppRoute.home, page:() =>  const HomePage()  , binding: HomeBinding()),
  GetPage(name: AppRoute.setting, page:() =>  const MySettings()),

  // =====================================================================


  // =============================address========================================
  GetPage(name: AppRoute.addAddress, page:() =>  const AddAddress() ),
  GetPage(name: AppRoute.addressView, page:() =>  const AddressView() , ),
  GetPage(name: AppRoute.editAddress, page:() =>  const EditAddress()  ),

  // =====================================================================

  // =============================items========================================
  GetPage(name: AppRoute.itemsAdd, page:() =>  const ItemsAdd() ),
  GetPage(name: AppRoute.itemsView, page:() =>  const ItemsView() , ),
  GetPage(name: AppRoute.itemsEdit, page:() =>  const ItemsEdit()  ),

  // =====================================================================
  // =============================categores========================================
  GetPage(name: AppRoute.categoriesAdd, page:() =>  const CategoriesAdd() ),
  GetPage(name: AppRoute.categoriesView, page:() =>  const CategoriesView() , ),
  GetPage(name: AppRoute.categoriesEdit, page:() =>  const categoriesEdit()  ),
  // =====================================================================
  // =============================orders========================================

  GetPage(name: AppRoute.pendingOrders, page:() =>  const PendingOrders()   , binding: OrdersPendingBinding () ),
  GetPage(name: AppRoute.archiveOrders, page:() =>  const ArchivedOrders()  , binding: OrdersArchivedBinding()),
  GetPage(name: AppRoute.orderDetails, page:() =>  const OrderDetails()     , binding: OrderDetailsBinding()  ),
  GetPage(name: AppRoute.OrderScreen, page:() =>  const OrderScreen()       ),
  GetPage(name: AppRoute.trakingOrders, page:() =>  const OrderTracking()       ),

  // =====================================================================

  // =============================users========================================
  GetPage(name: AppRoute.usersView, page:() =>  const UsersView()       ),
  GetPage(name: AppRoute.userOrders, page:() =>  const UserOrders()       ),
  // =====================================================================

  // =============================delivery========================================
  GetPage(name: AppRoute.deliveryView, page:() =>  const DeliveryVIew()       ),
  GetPage(name: AppRoute.deliveryOrders, page:() =>  const DeliveryOrders()       ),
  GetPage(name: AppRoute.deliveryAdd, page:() =>  const DelveryAdd()       ),

  // =====================================================================
  // =============================coupon========================================
  GetPage(name: AppRoute.couponView, page:() =>  const CouponVIew()       ),
  GetPage(name: AppRoute.couponAdd, page:() =>  const CouponAdd()       ),
  GetPage(name: AppRoute.couponEdit, page:() =>  const EditCoupon()       ),

  // =====================================================================
    // sttingtext Editing 
  GetPage(name: AppRoute.settingTextEdit, page:() =>  const SettingEditingText()       ),


];

