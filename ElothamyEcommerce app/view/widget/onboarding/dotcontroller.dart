import 'package:eltohmayecommerceapp/controller/onboarding_controller.dart';
import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:eltohmayecommerceapp/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDotCOntrollerOoBoarding extends StatelessWidget {
  const CustomDotCOntrollerOoBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImb>(
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(

                OnBoardingList.length,
                
                (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 900),
                      width: controller.currentPage== index? 20: 7,
                      height: 7,
                      margin: EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                          color:controller.currentPage== index?  AppColor.secondarycolor: AppColor.wightGrey,
                          borderRadius: BorderRadius.circular(20)),
                    )),
          ],
        );
      },
    );
  }
}
