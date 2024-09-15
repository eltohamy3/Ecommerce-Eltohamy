
import 'package:eltohmayecommerceapp/core/localization/languageController.dart';
import 'package:eltohmayecommerceapp/core/localization/translation.dart';
import 'package:eltohmayecommerceapp/core/services/services.dart';
import 'package:eltohmayecommerceapp/iniialBinding.dart';
import 'package:eltohmayecommerceapp/routes.dart';
import 'package:eltohmayecommerceapp/testGoogleMap.dart';
import 'package:eltohmayecommerceapp/view/screen/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await initialService();
  //  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: controller.language,
      translations: MyTranslation(),
      theme: controller.appTheme,
      initialBinding: myBinding(),
      getPages: GetRoutes,
    );
  }
}
