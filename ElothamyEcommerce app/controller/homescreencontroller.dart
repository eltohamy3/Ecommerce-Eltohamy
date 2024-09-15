import 'package:eltohmayecommerceapp/controller/homecontroller.dart';
import 'package:eltohmayecommerceapp/view/screen/home.dart';
import 'package:eltohmayecommerceapp/view/screen/offersPage.dart';
import 'package:eltohmayecommerceapp/view/screen/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentPage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  List<Widget> listPage = [
    const HomePage(),
    const OffersPage(),
    const Center(child: Text('setting')),
    MySettings()
  ];

  @override
  changePage(int currentPage) async {
    this.currentPage = currentPage;

    update();
    if (currentPage == 0) {
      HomeControllerImp homeControllerImp = Get.put(HomeControllerImp());
     await  homeControllerImp.getData();
    }
  }
}
