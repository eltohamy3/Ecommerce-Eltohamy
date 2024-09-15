import 'package:eltohmayecommerceapp/controller/cartController.dart';
import 'package:eltohmayecommerceapp/view/widget/cart/customNoofitems.dart';
import 'package:eltohmayecommerceapp/view/widget/cart/customcartCard.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CustomCartList extends GetView<CartControllerImp> {
  const CustomCartList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const CustomNumberOfItems(),
        Padding(
          padding: const EdgeInsets.all(20),
          child: GetBuilder<CartControllerImp>(
            builder: (controller) => Column(
              children: [
                ...List.generate(
                    controller.ItemsListData.length,
                    (index) => CustomCartCard(
                          cartModel: controller.ItemsListData[index],
                        ))
                        
              ],
            ),
          ),
        )
      ],
    );
  }
}
