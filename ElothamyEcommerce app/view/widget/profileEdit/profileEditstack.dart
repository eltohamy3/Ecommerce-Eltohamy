import 'package:eltohmayecommerceapp/core/constant/imageasset.dart';
import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfileEditStack extends StatelessWidget {
  String? email;
   ProfileEditStack({super.key , required this.email});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: Get.width / 2,
          color: AppColor.secondarycolor,
        ),
        Positioned(
            top: Get.width / 2.5,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: CircleAvatar(
                    backgroundColor: AppColor.white,
                    radius: 40,
                    backgroundImage: const AssetImage(AppImageAsset.avatar),
                  ),
                ),
                Text('$email')
              ],
            ))
      ],
    );
  }
}
