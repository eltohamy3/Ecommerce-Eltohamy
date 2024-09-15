import 'package:eltohamyecommercedeliveryapp/controller/homescreencontroller.dart';
import 'package:eltohamyecommercedeliveryapp/core/constant/mycolors.dart';
import 'package:eltohamyecommercedeliveryapp/data/datasource/static/static.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/home/appBar/customAppbarItme.dart';
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
            AppBarList.length ,
            (index) {
              return Expanded(
                child: CustomAPPBarItem(
                  appBarModel: AppBarList[index],
                  currentPage: controller.currentPage,
                  index: index,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
