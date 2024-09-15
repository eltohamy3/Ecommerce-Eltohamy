import 'package:eltohmayecommerceapp/controller/homescreencontroller.dart';
import 'package:eltohmayecommerceapp/core/function/alertexitapp.dart';
import 'package:eltohmayecommerceapp/view/widget/home/appBar/customButtomNavigationBar.dart';
import 'package:eltohmayecommerceapp/view/widget/home/appBar/customfloatActionButton.dart';
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
          backgroundColor: Colors.white,
          floatingActionButton: CustomFloatActionButton() ,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: CustomButtomNavigationBar() ,
          body: controller.listPage[controller.currentPage],
      )
      ),
    ); 
  }
}
