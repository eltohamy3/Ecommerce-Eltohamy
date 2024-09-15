import 'package:eltohamyecommerceadminapp/controller/onboarding_controller.dart';
import 'package:eltohamyecommerceadminapp/core/constant/mycolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImb> {
   CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: MaterialButton(
        onPressed: () {
          controller.next(); 
        },
        padding: EdgeInsets.symmetric(horizontal: 30),
        color: AppColor.primarycolor,
        child: Text(
          "Continue",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
