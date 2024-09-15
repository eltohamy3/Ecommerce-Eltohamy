import 'package:eltohmayecommerceapp/binding/cartbinding.dart';
import 'package:eltohmayecommerceapp/binding/orders/checkOutBinding.dart';
import 'package:eltohmayecommerceapp/binding/homebinding.dart';
import 'package:eltohmayecommerceapp/binding/itemsbinding.dart';
import 'package:eltohmayecommerceapp/binding/myfavoritebinding.dart';
import 'package:eltohmayecommerceapp/binding/orders/orderDetailsBindeing.dart';
import 'package:eltohmayecommerceapp/binding/orders/ordersArchivedBinding.dart';
import 'package:eltohmayecommerceapp/binding/orders/ordersPendingBinding.dart';
import 'package:eltohmayecommerceapp/binding/productdetailsBinding.dart';
import 'package:eltohmayecommerceapp/binding/singinbinding.dart';
import 'package:eltohmayecommerceapp/binding/singupbinding.dart';
import 'package:eltohmayecommerceapp/view/screen/Myaddress/compleatAddingaddress.dart';
import 'package:eltohmayecommerceapp/core/middleware/eltoomeddleware.dart';
import 'package:eltohmayecommerceapp/view/screen/Myaddress/addAddress.dart';
import 'package:eltohmayecommerceapp/view/screen/Myaddress/addressDetails.dart';
import 'package:eltohmayecommerceapp/view/screen/Myaddress/editAddress.dart';
import 'package:eltohmayecommerceapp/view/screen/Myaddress/viewAddress.dart';
import 'package:eltohmayecommerceapp/view/screen/cart.dart';
import 'package:eltohmayecommerceapp/view/screen/orders/ordersArchive.dart';
import 'package:eltohmayecommerceapp/view/screen/orders/checkout.dart';
import 'package:eltohmayecommerceapp/view/screen/favorite.dart';
import 'package:eltohmayecommerceapp/view/screen/items.dart';
import 'package:eltohmayecommerceapp/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:eltohmayecommerceapp/view/screen/auth/signUP/checkEmail.dart';
import 'package:eltohmayecommerceapp/view/screen/auth/signUP/signupverificaitoncode.dart';
import 'package:eltohmayecommerceapp/view/screen/auth/signUP/success_singUp.dart';
import 'package:eltohmayecommerceapp/core/constant/routename.dart';
import 'package:eltohmayecommerceapp/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:eltohmayecommerceapp/view/screen/auth/loginpage.dart';
import 'package:eltohmayecommerceapp/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:eltohmayecommerceapp/view/screen/auth/signUP/signUp.dart';
import 'package:eltohmayecommerceapp/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:eltohmayecommerceapp/view/screen/homeScreen.dart';
import 'package:eltohmayecommerceapp/view/screen/language.dart';
import 'package:eltohmayecommerceapp/view/screen/onboarding.dart';
import 'package:eltohmayecommerceapp/view/screen/orders/orderDetails.dart';
import 'package:eltohmayecommerceapp/view/screen/orders/pendingOrders.dart';
import 'package:eltohmayecommerceapp/view/screen/orders/tracking.dart';
import 'package:eltohmayecommerceapp/view/screen/productdetails.dart';
import 'package:eltohmayecommerceapp/view/screen/profileEdit.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>> GetRoutes = [

  // language 
  GetPage(name: AppRoute.languagepage, page:() =>  const Language()  , middlewares:[
    AppMeddleWare()
  ]) ,

  // OnBoarding
  GetPage(name: AppRoute.onBoarding, page:() =>  const OnBoarding() ) ,
  // Auth
  GetPage(name: AppRoute.login, page:() =>  const Login()  , binding: LoginBinding()),
  GetPage(name: AppRoute.signUp, page:() =>  const SignUp()  , binding: SignUpBindings()) ,
  GetPage(name: AppRoute.Forgetpassword, page:() =>  const ForgetPassword() ),
  GetPage(name: AppRoute.verfiycode, page:() =>  const VerificaitonCode() ) ,
  GetPage(name: AppRoute.resetPassword, page:() =>  const ResetPassword() ),
  GetPage(name: AppRoute.successResetPassword, page:() =>  const SuccessResetPassword() ) ,
  GetPage(name: AppRoute.successSignUp, page:() =>  const SuccessSingUp() ),
  GetPage(name: AppRoute.signUPCheckEmail, page:() =>  const CheckEmail() ) ,
  GetPage(name: AppRoute.signUpVerificationCode, page:() =>  const SignUpVerificationCode() ),
  GetPage(name: AppRoute.editprofile, page:() =>  const ProfileEdit() ),


  // 
      // =============================home========================================

  GetPage(name: AppRoute.home, page:() =>  const HomeScreen()  , binding: HomeBinding()),
  // =====================================================================
  
    // =============================items========================================

  GetPage(name: AppRoute.items, page:() =>  const Items()  , binding: ItemsBinding()),
  // =====================================================================

    // =============================productDetails========================================

  GetPage(name: AppRoute.productDetails, page:() =>  const ProductDetails()  , binding: ProductDetailsBinding()),
  // =====================================================================

  // 
    // =============================favoritePage========================================

  GetPage(name: AppRoute.favoritePage, page:() =>  const Favorite() , binding: MyFavoriteBinding() ),
  // =====================================================================

  // 
  // =============================cart========================================

  GetPage(name: AppRoute.cart, page:() =>  const Cart() , binding: CartBinding() ),
  // =====================================================================

  // =============================address========================================
  GetPage(name: AppRoute.addAddress, page:() =>  const AddAddress() ),
  GetPage(name: AppRoute.addressView, page:() =>  const AddressView() , ),
  GetPage(name: AppRoute.editAddress, page:() =>  const EditAddress()  ),
  GetPage(name: AppRoute.addressDetails, page: () => const AddressDetails(),),
  GetPage(name: AppRoute.addressaddCompleat, page: () => const CompleatAddingAddress(),),

  // =====================================================================
  // =============================orders========================================
  GetPage(name: AppRoute.checkOutPage, page:() =>  const CheckOutPage() ,binding: CheckOutBinding()  ),

  GetPage(name: AppRoute.pendingOrders, page:() =>  const PendingOrders()   , binding: OrdersPendingBinding () ),
  GetPage(name: AppRoute.archiveOrders, page:() =>  const ArchivedOrders()  , binding: OrdersArchivedBinding()),
  GetPage(name: AppRoute.orderDetails, page:() =>  const OrderDetails()     , binding: OrderDetailsBinding()  ),
  GetPage(name: AppRoute.trakingOrders, page:() =>  const OrderTracking()      ),

  // =====================================================================

];

Map<String, Widget Function(BuildContext context)> routes = {
  // OnBoarding
  AppRoute.onBoarding: (context) => const OnBoarding(),
  // Auth
  AppRoute.login: (context) => const Login(),
  AppRoute.signUp: (context) => const SignUp(),
  AppRoute.Forgetpassword: (context) => const ForgetPassword(),
  AppRoute.verfiycode: (context) => const VerificaitonCode(),
  AppRoute.resetPassword: (context) => const ResetPassword(),
  AppRoute.successResetPassword: (context) => const SuccessResetPassword(),
  AppRoute.successSignUp: (context) => const SuccessSingUp(),
  AppRoute.signUPCheckEmail: (context) => const CheckEmail(),
  AppRoute.signUpVerificationCode: (context) => const SignUpVerificationCode()
  // HOme

};
