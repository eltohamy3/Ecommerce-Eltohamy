import 'package:eltohmayecommerceapp/controller/homecontroller.dart';
import 'package:eltohmayecommerceapp/view/widget/home/customCategoryview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCategoresList extends GetView<HomeControllerImp> {
  const CustomCategoresList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      alignment: Alignment.center,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          scrollDirection: Axis.horizontal,
          itemCount: controller.CategoryData.length,
          itemBuilder: (context, index) {
            return CustomCategoryView(categoriesMOdel:  controller.CategoryData[index]  , onTap: () {
              
            },);
          }),
    );
  }
}
