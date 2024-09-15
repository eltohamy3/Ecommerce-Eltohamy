import 'package:eltohmayecommerceapp/core/constant/routename.dart';
import 'package:eltohmayecommerceapp/core/services/services.dart';
import 'package:get/get.dart';

abstract class SettingController extends GetxController {
  logout();
}

class SettingControllerImp extends SettingController {
  MyServices myServices = Get.find();
  String? email;

  @override
  logout() async {
    await myServices.sharedPreferences.setString('step', '1');

    Get.offAllNamed(AppRoute.login);
  }

  @override
  void onInit() async {
    email = await myServices.sharedPreferences.getString("email");
    super.onInit();
  }
}
