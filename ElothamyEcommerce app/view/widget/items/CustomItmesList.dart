import 'package:eltohmayecommerceapp/controller/itemscontroller.dart';
import 'package:eltohmayecommerceapp/view/widget/items/customCategoryItemsView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCategoryItemList extends GetView<ItemsControllerImp> {
  const CustomCategoryItemList({super.key});

  @override
  Widget build(BuildContext context) {
    
    return  GetBuilder<ItemsControllerImp>(builder: (controller) =>  Container(
      height: 60,
      alignment: Alignment.center,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          scrollDirection: Axis.horizontal,
          itemCount: controller.CategoryData.length,
          itemBuilder: (context, index) {
            return CustomCategoryItemsView(categoriesMOdel:  controller.CategoryData[index]  );
          }),
    ));
  }
}
