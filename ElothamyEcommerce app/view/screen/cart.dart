// ignore_for_file: prefer_const_constructors

import 'package:eltohmayecommerceapp/controller/cartController.dart';
import 'package:eltohmayecommerceapp/core/class/handlingDataView.dart';
import 'package:eltohmayecommerceapp/view/widget/cart/customCartButtomNavigationBar.dart';
import 'package:eltohmayecommerceapp/view/widget/cart/customCartList.dart';
import 'package:eltohmayecommerceapp/view/widget/cart/customcartAppbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Cart extends GetView<CartControllerImp> {
  const Cart({super.key});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        controller.onCartClose();
        return Future.value(false);
      },
      child: Scaffold(
        bottomNavigationBar: const CustomCardButtomNavigationBar(),
        appBar: CustomCartAppBar(),
        body: GetBuilder<CartControllerImp>(
          builder: (controller) => Container(
            child: HanddlingDataView(
                statusRequest: controller.statusRequest,
                widget: CustomCartList()),
          ),
        ),
      ),
    );
  }
}
