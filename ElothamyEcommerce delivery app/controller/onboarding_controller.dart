import 'package:eltohamyecommercedeliveryapp/core/constant/routename.dart';
import 'package:eltohamyecommercedeliveryapp/core/services/services.dart';
import 'package:eltohamyecommercedeliveryapp/data/datasource/static/static.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImb extends OnBoardingController {
  late PageController pageController;

  int currentPage = 0;
  MyServices myServices = Get.find();
  
  @override
  next() async {
    currentPage++;
    if (currentPage == (OnBoardingList.length)) {
      await myServices.sharedPreferences
          .setString('step', '1'); // خلص تسجيل الدخول
      print('done onbording ');
      Get.offAllNamed(AppRoute.login);
    }
    pageController.animateToPage(currentPage,
        duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
  }

  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {

    pageController = PageController();
    super.onInit();
  }
}
