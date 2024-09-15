import 'package:eltohamyecommerceadminapp/controller/categories/addcatController.dart';
import 'package:eltohamyecommerceadminapp/core/constant/mycolors.dart';
import 'package:eltohamyecommerceadminapp/view/widget/orders/customMaterialButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CusotomAddCattbutomAppbar extends GetView<AddCategoresControllerImp> {
  const CusotomAddCattbutomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: CustomMaterialButton(
        title: "Add Categories",
        color: AppColor.secondarycolor,
        textcolor: AppColor.white,
        onPressed: () {
          controller.addcategorybutton();
        },
      ),
    );
  }
}
