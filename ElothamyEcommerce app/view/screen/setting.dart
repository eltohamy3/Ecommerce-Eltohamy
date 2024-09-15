import 'package:eltohmayecommerceapp/controller/settingController.dart';
import 'package:eltohmayecommerceapp/data/datasource/static/static.dart';
import 'package:eltohmayecommerceapp/view/widget/profileEdit/profileEditstack.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MySettings extends StatelessWidget {
  SettingControllerImp controller = Get.put(SettingControllerImp());

   MySettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: [
        ProfileEditStack(
          email: controller.email,
        ),
        const SizedBox(
          height: 100,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              ...List.generate(
                  SettingData.length,
                  (index) => ListTile(
                      title: Text(SettingData[index].title),
                      leading: Icon(SettingData[index].prefexIcon),
                      onTap: SettingData[index].onPressed)),
            ],
          ),
        )
      ],
    ));
  }
}
