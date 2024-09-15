import 'package:eltohmayecommerceapp/controller/homescreencontroller.dart';
import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:eltohmayecommerceapp/data/datasource/static/static.dart';
import 'package:eltohmayecommerceapp/view/widget/home/appBar/customAppbarItme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CustomButtomNavigationBar extends GetView<HomeScreenControllerImp> {
  const CustomButtomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      shadowColor: AppColor.black,
      clipBehavior: Clip.hardEdge,
      height: 70,
      elevation: 50,
      surfaceTintColor: AppColor.white,
      notchMargin: 10,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(
            AppBarList.length + 1,
            (index) {
              if (index == AppBarList.length / 2) return const Spacer();
              int workingindex =
                  index > (AppBarList.length / 2) ? index - 1 : index;
              return CustomAPPBarItem(
                appBarModel: AppBarList[workingindex],
                currentPage: controller.currentPage,
                index: workingindex,
              );
            },
          )
        ],
      ),
    );
  }
}
