import 'package:eltohamyecommercedeliveryapp/core/services/services.dart';
import 'package:get/get.dart';

String translateDataBase(String english, String arabic) {
  MyServices myService = Get.find();

  if (myService.sharedPreferences.getString('codeLang') == 'ar') {
    return arabic;
  }
  return english;
}
