import 'package:eltohamyecommerceadminapp/data/model/AppbarModel.dart';
import 'package:eltohamyecommerceadminapp/view/screen/orders/deleveryWating.dart';
import 'package:eltohamyecommerceadminapp/view/screen/orders/onTheWay.dart';
import 'package:eltohamyecommerceadminapp/view/screen/orders/orderApproved.dart';
import 'package:eltohamyecommerceadminapp/view/screen/orders/ordersArchive.dart';
import 'package:eltohamyecommerceadminapp/view/screen/orders/pendingOrders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrderScreenController extends GetxController {
  changePage(int currentPage);
}

class OrderScreenControllerImp extends OrderScreenController {
  int currentPage = 0;
  List<Widget> listPage = [
    const PendingOrders(),
    const ApprovedOrder() ,
    const DeleveryWating() ,
    const OnTheWayOrders(),
    const ArchivedOrders() ,
  ];
  
  List<AppBarModel> OrderButtonAppbarList = [
    // pending  to pe approved 
    // approved to be compleatly prepar 
    // prepared orderd to be taken by the delevery 
    // on the way with the delevery to be 
    // archived orders that has been done
  AppBarModel(title: 'Pending', icon: Icons.hourglass_empty),
  AppBarModel(title: 'approved', icon: Icons.check_circle_outline),// 
  AppBarModel(title: 'Waiting', icon: Icons.hourglass_empty),
  AppBarModel(title: 'onWay', icon: Icons.local_shipping),
  AppBarModel(title: 'Archived', icon: Icons.check_circle_outline),

];

  @override
  changePage(int currentPage) {
    this.currentPage = currentPage;
    print("the curret page is ${currentPage}" ); 
    update(); 
  }
}
