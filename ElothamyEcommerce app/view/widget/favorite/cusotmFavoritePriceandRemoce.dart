import 'package:eltohmayecommerceapp/controller/favoriteController.dart';
import 'package:eltohmayecommerceapp/controller/myfavoriteController.dart';
import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:eltohmayecommerceapp/data/model/itemsModel.dart';
import 'package:eltohmayecommerceapp/view/widget/items/customTextPrice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CusotmPriceAndRemoceRow extends GetView<MyFavoriteControllerImp> {
  final ItemsModel itemsModel;
  const CusotmPriceAndRemoceRow({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextPrice(itemsModel: itemsModel),
        IconButton(
            onPressed: () {
              controller.RemoveFromFavorite(itemsModel.itemsId!);
            },
            icon: Icon(
              Icons.delete_outline,
              color: AppColor.secondarycolor,
            ))
      ],
    );
  }
}
