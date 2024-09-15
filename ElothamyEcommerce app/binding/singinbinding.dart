import 'package:eltohmayecommerceapp/controller/auth/signInController.dart';
import 'package:eltohmayecommerceapp/controller/productdeteilscontroller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    print('in the LoginBinding');
    Get.put(SignInControllerImp());
  }
}
