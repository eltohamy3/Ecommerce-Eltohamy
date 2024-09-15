import 'package:eltohamyecommerceadminapp/core/constant/imageasset.dart';
import 'package:eltohamyecommerceadminapp/core/constant/mycolors.dart';
import 'package:eltohamyecommerceadminapp/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MySettings extends StatelessWidget {
  const MySettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: Get.width / 2,
                color: AppColor.secondarycolor,
              ),
              Positioned(
                  top: Get.width / 2.5,
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: CircleAvatar(
                      backgroundColor: AppColor.white,
                      radius: 40,
                      backgroundImage: const AssetImage(AppImageAsset.avatar),
                    ),
                  ))
            ],
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
                        onTap: SettingData[index].onPressed)
                        ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
