import 'package:eltohmayecommerceapp/controller/onboarding_controller.dart';
import 'package:eltohmayecommerceapp/view/widget/onboarding/custombutton.dart';
import 'package:eltohmayecommerceapp/view/widget/onboarding/dotcontroller.dart';
import 'package:eltohmayecommerceapp/view/widget/onboarding/slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImb());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 4, child: CustomSliderOnBoarding()),
            Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomDotCOntrollerOoBoarding(),
                    CustomButtonOnBoarding()
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
