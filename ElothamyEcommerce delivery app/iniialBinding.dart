import 'package:eltohamyecommercedeliveryapp/controller/auth/Forgetpassword/verifycodecontroller.dart';
import 'package:eltohamyecommercedeliveryapp/controller/auth/Forgetpassword/forgetpasswordcontroller.dart';
import 'package:eltohamyecommercedeliveryapp/controller/auth/Forgetpassword/resetpasswordcontroller.dart';
import 'package:eltohamyecommercedeliveryapp/controller/auth/signInController.dart';
import 'package:eltohamyecommercedeliveryapp/controller/auth/signUp/checkemailcontroller.dart';
import 'package:eltohamyecommercedeliveryapp/controller/auth/signUp/singUpController.dart';
import 'package:eltohamyecommercedeliveryapp/core/class/crud.dart';
import 'package:eltohamyecommercedeliveryapp/core/services/services.dart';
import 'package:get/get.dart';

class myBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInControllerImp(), fenix: true);
    Get.lazyPut(() => SignUpControllerImb(), fenix: true);
    Get.lazyPut(() => ResetPasswordControllerImp(), fenix: true);
    Get.lazyPut(() => CheckEmailControllerImp(), fenix: true);
    Get.lazyPut(() => VerifyCodeControllerImp(), fenix: true);
    Get.lazyPut(() => ForgetPasswordControllerImp(), fenix: true);
    Get.lazyPut(() => MyServices(), fenix: true);
    Get.put(Crud());
  }
}
