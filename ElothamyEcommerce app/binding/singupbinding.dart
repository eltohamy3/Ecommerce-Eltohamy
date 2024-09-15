import 'package:eltohmayecommerceapp/controller/auth/signUp/singUpController.dart';
import 'package:get/get.dart';

class SignUpBindings extends Bindings {
  @override
  void dependencies() {
    print('in the SignUpBindings');
    Get.put(SignUpControllerImb());
  }
}
