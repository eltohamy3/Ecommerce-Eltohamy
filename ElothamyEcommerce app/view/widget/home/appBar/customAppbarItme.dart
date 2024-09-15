import 'package:eltohmayecommerceapp/controller/homescreencontroller.dart';
import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:eltohmayecommerceapp/data/model/AppbarModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomAPPBarItem extends GetView<HomeScreenControllerImp> {
  final int index;
  final int currentPage;
  final AppBarModel appBarModel;
  void Function()? onPresse;
  CustomAPPBarItem(
      {super.key,
      required this.index,
      required this.appBarModel,
      required this.currentPage,
      this.onPresse});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        controller.changePage(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(appBarModel.icon,
              color: currentPage == index ? Colors.red : AppColor.AppBarIconColor),
          Text(
            appBarModel.title,
            style: TextStyle(
                color: currentPage == index ? Colors.red :AppColor.AppBarIconColor,)
          )
        ],
      ),
    );
  }
}
