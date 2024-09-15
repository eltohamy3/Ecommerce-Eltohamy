import 'package:eltohamyecommercedeliveryapp/binding/orders/checkOutBinding.dart';
import 'package:eltohamyecommercedeliveryapp/binding/homebinding.dart';
import 'package:eltohamyecommercedeliveryapp/binding/orders/orderDetailsBindeing.dart';
import 'package:eltohamyecommercedeliveryapp/binding/orders/ordersArchivedBinding.dart';
import 'package:eltohamyecommercedeliveryapp/binding/orders/ordersPendingBinding.dart';
import 'package:eltohamyecommercedeliveryapp/core/middleware/eltoomeddleware.dart';
import 'package:eltohamyecommercedeliveryapp/view/screen/address/addAddress.dart';
import 'package:eltohamyecommercedeliveryapp/view/screen/address/editAddress.dart';
import 'package:eltohamyecommercedeliveryapp/view/screen/address/viewAddress.dart';
import 'package:eltohamyecommercedeliveryapp/view/screen/orders/ordersArchive.dart';
import 'package:eltohamyecommercedeliveryapp/view/screen/orders/checkout.dart';
import 'package:eltohamyecommercedeliveryapp/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:eltohamyecommercedeliveryapp/view/screen/auth/signUP/checkEmail.dart';
import 'package:eltohamyecommercedeliveryapp/view/screen/auth/signUP/signupverificaitoncode.dart';
import 'package:eltohamyecommercedeliveryapp/view/screen/auth/signUP/success_singUp.dart';
import 'package:eltohamyecommercedeliveryapp/core/constant/routename.dart';
import 'package:eltohamyecommercedeliveryapp/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:eltohamyecommercedeliveryapp/view/screen/auth/loginpage.dart';
import 'package:eltohamyecommercedeliveryapp/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:eltohamyecommercedeliveryapp/view/screen/auth/signUP/signUp.dart';
import 'package:eltohamyecommercedeliveryapp/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:eltohamyecommercedeliveryapp/view/screen/homeScreen.dart';
import 'package:eltohamyecommercedeliveryapp/view/screen/language.dart';
import 'package:eltohamyecommercedeliveryapp/view/screen/onboarding.dart';
import 'package:eltohamyecommercedeliveryapp/view/screen/orders/orderDetails.dart';
import 'package:eltohamyecommercedeliveryapp/view/screen/orders/pendingOrders.dart';
import 'package:eltohamyecommercedeliveryapp/view/screen/orders/tracking.dart';
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

  GetPage(name: AppRoute.home, page:() =>  const HomeScreen()  , binding: HomeBinding()),
  // =====================================================================


  // =============================address========================================
  GetPage(name: AppRoute.addAddress, page:() =>  const AddAddress() ),
  GetPage(name: AppRoute.addressView, page:() =>  const AddressView() , ),
  GetPage(name: AppRoute.editAddress, page:() =>  const EditAddress()  ),

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
