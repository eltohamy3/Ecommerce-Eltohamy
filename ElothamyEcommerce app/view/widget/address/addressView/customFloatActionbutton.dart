import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:eltohmayecommerceapp/core/constant/routename.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomAddressViewFloatActionButton extends StatelessWidget {
  const CustomAddressViewFloatActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Get.toNamed(AppRoute.addAddress , 
        arguments: {'fromCeckout':0}); 
      },
      backgroundColor: AppColor.secondarycolor,
      child: Icon(
        Icons.add,
        color: AppColor.white,
      ),
    );
  }
}
