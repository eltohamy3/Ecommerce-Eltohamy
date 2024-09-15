import 'package:eltohmayecommerceapp/core/constant/AppThem.dart';
import 'package:eltohmayecommerceapp/core/constant/routename.dart';
import 'package:eltohmayecommerceapp/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();
  ThemeData appTheme = AppThem.themEnglish;

  void changeLang(String codeLang) async {
    Locale locale = Locale(codeLang);
    await myServices.sharedPreferences.setString('codeLang', codeLang);
    language = locale;

    appTheme = codeLang == 'ar' ? AppThem.arabicThem : AppThem.themEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
    Get.offNamed(AppRoute.onBoarding);
  }

  @override
  void onInit() {
    String? codeLang = myServices.sharedPreferences.getString('codeLang');
    language = codeLang != null ? Locale(codeLang) : Get.deviceLocale;
    appTheme = language!.languageCode == 'ar' ? AppThem.arabicThem : AppThem.themEnglish;

    super.onInit();
  }
}
