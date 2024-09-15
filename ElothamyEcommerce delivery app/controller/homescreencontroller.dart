import 'package:eltohamyecommercedeliveryapp/view/screen/home.dart';
import 'package:eltohamyecommercedeliveryapp/view/screen/orders/onTheWay.dart';
import 'package:eltohamyecommercedeliveryapp/view/screen/orders/ordersArchive.dart';
import 'package:eltohamyecommercedeliveryapp/view/screen/orders/pendingOrders.dart';
import 'package:eltohamyecommercedeliveryapp/view/screen/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentPage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  List<Widget> listPage = [
    const PendingOrders(),
    OnTheWayOrders() ,
    ArchivedOrders() ,
     MySettings()
  ];
  
  @override
  changePage(int currentPage) {
    this.currentPage = currentPage;
    update(); 
  }
}
