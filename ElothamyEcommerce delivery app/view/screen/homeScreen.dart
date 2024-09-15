import 'package:eltohamyecommercedeliveryapp/controller/homescreencontroller.dart';
import 'package:eltohamyecommercedeliveryapp/core/function/alertexitapp.dart';
import 'package:eltohamyecommercedeliveryapp/view/screen/setting.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/home/appBar/customButtomNavigationBar.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/home/appBar/customfloatActionButton.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/orders/customOrdersAppbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return  WillPopScope(
          onWillPop: () => alertExitApp(context),
          child: GetBuilder<HomeScreenControllerImp>(
        builder: (controller) =>  Scaffold(
          // drawer: Drawer(
          //   child: MySettings(),
          // ),
          backgroundColor: Colors.white,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: CustomButtomNavigationBar() ,
          body: controller.listPage[controller.currentPage],
      )
      ),
    ); 
  }
}
