import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:eltohmayecommerceapp/core/constant/routename.dart';
import 'package:eltohmayecommerceapp/view/screen/Myaddress/compleatAddingaddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCompleatAddingAddressButton extends StatelessWidget {
  const CustomCompleatAddingAddressButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: AppColor.secondarycolor,
      child: Text(
        'Compleat Adding Addresss',
        style: TextStyle(color: AppColor.white, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        print('hear'); 
        Get.toNamed(AppRoute.addressaddCompleat);
      },
    );
  }
}
