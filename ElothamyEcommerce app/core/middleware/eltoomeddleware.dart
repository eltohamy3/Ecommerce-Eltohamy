import 'package:eltohmayecommerceapp/core/constant/routename.dart';
import 'package:eltohmayecommerceapp/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppMeddleWare extends GetMiddleware {
  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    String? step =
        myServices.sharedPreferences.getString('step');
    print('=================${step} value======================');
        if (step=='2'){
      return const RouteSettings(name: AppRoute.home); 
    }
    if (step == '1') {
      return const RouteSettings(name: AppRoute.login);
    }
    return null;
  }
}
