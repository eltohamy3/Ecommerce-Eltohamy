import 'package:eltohmayecommerceapp/controller/myfavoriteController.dart';
import 'package:eltohmayecommerceapp/view/widget/favorite/customFavoriteviewCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CusotmFavoriteGridView extends GetView<MyFavoriteControllerImp> {
  const CusotmFavoriteGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyFavoriteControllerImp>(builder: (controller) =>  GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: .7),
        itemCount: controller.ItemsListData.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => controller.GoToProductDetails(controller.ItemsListData[index]),
              child: CustomFavoriteViewCard(
            itemsModel: controller.ItemsListData[index],
          ));
        }));
  }
}
