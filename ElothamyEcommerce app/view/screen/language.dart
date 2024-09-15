import 'package:eltohmayecommerceapp/core/localization/languageController.dart';
import 'package:eltohmayecommerceapp/view/widget/language/custombuttomlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LocalController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr, style: Theme.of(context).textTheme.headline1),
            const SizedBox(height: 20),
            CustomButtonLang(
              textbutton: "Ar",
              onPressed: () {
                controller.changeLang('ar');
              },
            ),
            CustomButtonLang(
              textbutton: "En",
              onPressed: () {
                controller.changeLang('en');
              },
            ),
          ],
        ),
      ),
    );
  }
}
