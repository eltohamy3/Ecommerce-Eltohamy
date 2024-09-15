import 'package:eltohmayecommerceapp/controller/cartController.dart';
import 'package:eltohmayecommerceapp/core/constant/linkApi.dart';
import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:eltohmayecommerceapp/core/function/translateDatabase.dart';
import 'package:eltohmayecommerceapp/data/model/cartModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CustomCartCard extends GetView<CartControllerImp> {
  final CartModel cartModel;
  CustomCartCard({super.key, required this.cartModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: AppColor.white,
      child: Container(
        // height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Image.network(
                "${LinkAPI.ItemsImage}/${cartModel.itemsImage}",
                height: 110,
              ),
            ),
            Expanded(
                flex: 3,
                child: ListTile(
                  title: Text(
                    translateDataBase(
                        cartModel.itemsName!, cartModel.itemsNameAr!),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${cartModel.priceAfterDiscount}\$',
                        style: TextStyle(
                            color: AppColor.secondarycolor, fontFamily: "sans"),
                      ),
                    ],
                  ),
                )),
            Expanded(
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {
                        controller.onadd(cartModel.itemsId!);
                      },
                      icon: Icon(Icons.add)),
                  Text(
                    "${cartModel.noOFItemsInCart}",
                    style: TextStyle(fontFamily: "sans"),
                  ),
                  IconButton(
                      onPressed: () {
                        controller.onRemove(cartModel.itemsId!);
                      },
                      icon: Icon(Icons.remove)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
