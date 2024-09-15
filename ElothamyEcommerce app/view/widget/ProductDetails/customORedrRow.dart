import 'package:eltohmayecommerceapp/controller/productdeteilscontroller.dart';
import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CustomOrderRow extends GetView<ProductDetailsControllerImp> {
  CustomOrderRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        controller.increaseNumberOfProduct(
                            controller.itemsModel.itemsId!);
                        // CartControllerImp cartController =
                        //     Get.put(CartControllerImp());
                        // cartController.AddToCart(
                        //     controller.itemsModel);
                      },
                      icon: const Icon(Icons.add)),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(border: Border.all(width: 1)),
                    child: GetBuilder<ProductDetailsControllerImp>(
                      builder: (controller) => Text(
                        '${controller.NoOfProduct}',
                        style: const TextStyle(fontFamily: "sans"),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        controller.decreasNumberOfProduct(
                            controller.itemsModel.itemsId!);
                      },
                      icon: const Icon(Icons.remove))
                ],
              ),
              Row(
                children: [
                  Text(
                    "${controller.itemsModel.priceAfterDiscount!}\$",
                    style: const TextStyle(
                        color: AppColor.secondarycolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        fontFamily: "sans"),
                  ),
                  controller.itemsModel.itemsDiscount! > 0
                      ? SizedBox(
                          width: 10,
                        )
                      : SizedBox(
                          width: 1,
                        ),
                  controller.itemsModel.itemsDiscount! > 0
                      ? Text(
                          "${controller.itemsModel.itemsPrice}\$",
                          style: TextStyle(
                              color: AppColor.wightGrey,
                              decoration: TextDecoration.lineThrough,
                              fontSize: 20,
                              fontFamily: "sans"),
                        )
                      : Text("")
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
