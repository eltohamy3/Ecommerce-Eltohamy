import 'package:eltohmayecommerceapp/controller/favoriteController.dart';
import 'package:eltohmayecommerceapp/controller/itemscontroller.dart';
import 'package:eltohmayecommerceapp/core/constant/imageasset.dart';
import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:eltohmayecommerceapp/data/model/itemsModel.dart';
import 'package:eltohmayecommerceapp/view/widget/favorite/customitemName.dart';
import 'package:eltohmayecommerceapp/view/widget/items/customCachedNetwork.dart';
import 'package:eltohmayecommerceapp/view/widget/items/customTextPrice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomItemViewCard extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  CustomItemViewCard({super.key, required this.itemsModel });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.GoToProductDetails(itemsModel),
      child: Card(
          surfaceTintColor: AppColor.white, // the color of the card
          color: AppColor.white,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCachedImage(
                      itemsModel: itemsModel,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    CustomItemsName(
                      itemsModel: itemsModel,
                    ),
                    // Text('Description of the content')
                    const SizedBox(
                      height: 10,
                    ),
                     Row(
                      children: [
                        Icon(
                          Icons.alarm,
                          color: Colors.grey,
                          size: 20,
                        ),
                        Text('  ${itemsModel.setting_deliverytime} Minute${itemsModel.setting_deliverytime!>1?"s":""}',
                            style: TextStyle(
                                color: Colors.grey, fontFamily: "sans"))
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextPrice(itemsModel: itemsModel),
                        GetBuilder<FavoriteControllerImp>(
                          init: FavoriteControllerImp(),
                          builder: (controller) => IconButton(
                              onPressed: () {
                                controller.ChangFavorite(itemsModel.itemsId!);
                              },
                              icon: Icon(
                                controller.isFavorite[itemsModel.itemsId] == 1
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: AppColor.secondarycolor,
                              )),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              itemsModel.itemsDiscount! > 0
                  ? Positioned(
                      top: 5,
                      left: 5,
                      child: Image.asset(
                        AppImageAsset.saleOne,
                        width: 40,
                      ),
                    )
                  : Text('')
            ],
          )),
    );
  }
}
