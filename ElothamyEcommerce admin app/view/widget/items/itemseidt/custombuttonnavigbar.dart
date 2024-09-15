
import 'package:eltohamyecommerceadminapp/controller/Items/itemsEditcontroller.dart';
import 'package:eltohamyecommerceadminapp/core/constant/mycolors.dart';
import 'package:eltohamyecommerceadminapp/view/widget/orders/customMaterialButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CustomButtonNavBar extends GetView<EditItemsControllerImp> {
  const CustomButtonNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: CustomMaterialButton(
        title: "Edit Item",
        color: AppColor.secondarycolor,
        textcolor: AppColor.white,
        onPressed: () {
          controller.Edititembutton();
        },
      ),
    );
  }
}
