import 'package:eltohmayecommerceapp/controller/cartController.dart';
import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CustomNumberOfItems extends GetView<CartControllerImp> {
  const CustomNumberOfItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 30,
      decoration: BoxDecoration(
          color: AppColor.thirdColor, borderRadius: BorderRadius.circular(50)),
      child: Text(
        "you have  ${controller.totalCountItems} Items in your Cart",
        textAlign: TextAlign.center,
        style: const TextStyle(color: AppColor.secondarycolor2),
      ),
    );
  }
}
