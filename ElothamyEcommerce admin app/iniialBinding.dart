import 'package:eltohamyecommerceadminapp/controller/auth/Forgetpassword/verifycodecontroller.dart';
import 'package:eltohamyecommerceadminapp/controller/auth/Forgetpassword/forgetpasswordcontroller.dart';
import 'package:eltohamyecommerceadminapp/controller/auth/Forgetpassword/resetpasswordcontroller.dart';
import 'package:eltohamyecommerceadminapp/controller/auth/signInController.dart';
import 'package:eltohamyecommerceadminapp/controller/auth/signUp/checkemailcontroller.dart';
import 'package:eltohamyecommerceadminapp/controller/auth/signUp/singUpController.dart';
import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/core/services/services.dart';
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
