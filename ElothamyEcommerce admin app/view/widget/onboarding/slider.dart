import 'package:eltohamyecommerceadminapp/controller/onboarding_controller.dart';
import 'package:eltohamyecommerceadminapp/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImb> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      itemCount: OnBoardingList.length,
      itemBuilder: (context, index) {
        return Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 70,
            ),
            Text(OnBoardingList[index].title!,style: Theme.of(context).textTheme.headline1),
            const SizedBox( height: 70,),
            Container(
              child: Image.asset(
                OnBoardingList[index].image!,
                width: 200,
                height: 250,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(OnBoardingList[index].body,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2),
            )
          ],
        );
      },
    );
  }
}
