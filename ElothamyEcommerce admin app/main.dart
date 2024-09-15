
import 'package:eltohamyecommerceadminapp/core/localization/languageController.dart';
import 'package:eltohamyecommerceadminapp/core/localization/translation.dart';
import 'package:eltohamyecommerceadminapp/core/services/services.dart';
import 'package:eltohamyecommerceadminapp/iniialBinding.dart';
import 'package:eltohamyecommerceadminapp/routes.dart';
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
      // home: const Test(),
      // home:  TestView(),
      initialBinding: myBinding(),

      getPages: GetRoutes,
    );
  }
}
