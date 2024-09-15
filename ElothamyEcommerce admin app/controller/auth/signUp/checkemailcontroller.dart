import 'package:eltohamyecommerceadminapp/core/constant/routename.dart';
import 'package:get/get.dart';

abstract class CheckEmailController extends GetxController {
  GoTOSignUpVerificationCode();
}

class CheckEmailControllerImp extends CheckEmailController {
  String? email;
  @override
  GoTOSignUpVerificationCode() {
    Get.offNamed(AppRoute.signUpVerificationCode , parameters: {
      "email":email!
    });
  }

  @override
  void onInit() {
    email = Get.parameters['email'];
    super.onInit();
  }

  @override
  void onClose() {}
}
