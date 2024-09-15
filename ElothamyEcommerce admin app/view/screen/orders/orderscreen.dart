import 'package:eltohamyecommerceadminapp/controller/orders/OrderScreencontroller.dart';
import 'package:eltohamyecommerceadminapp/view/widget/home/appBar/customButtomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderScreenControllerImp());
    return GetBuilder<OrderScreenControllerImp>(
            init: OrderScreenControllerImp(),
        builder: (controller) =>  Scaffold(
          bottomNavigationBar: CustomButtomNavigationBar(
            currentpage:  controller.currentPage,
            AppBarList: controller.OrderButtonAppbarList,
          ),
          backgroundColor: Colors.white,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          body: controller.listPage[controller.currentPage],
      )
      );
    
  }
}
