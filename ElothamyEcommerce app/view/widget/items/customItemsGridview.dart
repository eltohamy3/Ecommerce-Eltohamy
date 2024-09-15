import 'package:eltohmayecommerceapp/controller/favoriteController.dart';
import 'package:eltohmayecommerceapp/controller/itemscontroller.dart';
import 'package:eltohmayecommerceapp/view/widget/items/customitemviewcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomItemsGridView extends StatelessWidget {
  const CustomItemsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteControllerImp Favcontroller = Get.put(FavoriteControllerImp());
    return GetBuilder<ItemsControllerImp>(
        builder: (controller) => GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: .7),
              itemCount: controller.viewEdItems.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                Favcontroller.inializeIsFavorite(
                    controller.viewEdItems[index].itemsId!,
                    controller.viewEdItems[index].Favorite!);
                return InkWell(
                    child: CustomItemViewCard(
                  itemsModel: controller.viewEdItems[index],
                ));
              },
            ));
  }
}
