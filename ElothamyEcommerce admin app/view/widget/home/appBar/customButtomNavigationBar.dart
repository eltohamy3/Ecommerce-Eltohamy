import 'package:eltohamyecommerceadminapp/controller/orders/OrderScreencontroller.dart';
import 'package:eltohamyecommerceadminapp/core/constant/mycolors.dart';
import 'package:eltohamyecommerceadminapp/view/widget/home/appBar/customAppbarItme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CustomButtomNavigationBar extends GetView<OrderScreenControllerImp> {
  List AppBarList;

  int currentpage;

  CustomButtomNavigationBar(
      {super.key,
      required this.currentpage,
      required this.AppBarList,
      require});

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
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          ...List.generate(
            AppBarList.length,
            (index) {
              return Container(
                width: Get.width / (AppBarList.length + 1),
                child: CustomAPPBarItem(
                  onTap: () {
                    controller.changePage(index);
                  },
                  appBarModel: AppBarList[index],
                  currentPage: currentpage,
                  index: index,
                ),
              );
            },
          )
        ]));
  }
}
