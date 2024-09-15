import 'package:eltohamyecommercedeliveryapp/core/constant/routename.dart';
import 'package:eltohamyecommercedeliveryapp/core/services/services.dart';
import 'package:get/get.dart';

abstract class SettingController extends GetxController {
  logout();
}

class SettingControllerImp extends SettingController {
  MyServices myServices = Get.find();

  @override
  logout() async {
    await myServices.sharedPreferences.setString('step', '1'); 

    Get.offAllNamed(AppRoute.login);
  }
}
