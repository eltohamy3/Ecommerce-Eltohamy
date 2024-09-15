import 'package:eltohamyecommercedeliveryapp/controller/homecontroller.dart';
import 'package:eltohamyecommercedeliveryapp/core/constant/mycolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomItemsCategory extends StatelessWidget {
  const CustomItemsCategory({super.key, });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Container(
              margin: const EdgeInsets.only(top: 10, bottom: 15),
              child: Text(
                controller.itemsCategory,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColor.secondarycolor),
              ),
            ));
  }
}
