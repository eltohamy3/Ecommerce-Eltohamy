import 'package:eltohmayecommerceapp/controller/productdeteilscontroller.dart';
import 'package:eltohmayecommerceapp/core/class/handlingDataView.dart';
import 'package:eltohmayecommerceapp/core/constant/routename.dart';
import 'package:eltohmayecommerceapp/view/widget/ProductDetails/CustomButtonprimarycolor.dart';
import 'package:eltohmayecommerceapp/view/widget/ProductDetails/CustomItemSubtitle.dart';
import 'package:eltohmayecommerceapp/view/widget/ProductDetails/CustomItmesName.dart';
import 'package:eltohmayecommerceapp/view/widget/ProductDetails/CustomStatkView.dart';
import 'package:eltohmayecommerceapp/view/widget/ProductDetails/customORedrRow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProductDetails extends GetView<ProductDetailsControllerImp> {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomPrimaryButton(
          Title: "Go To Cart",
          onPressed: () {
            controller.GoToCart();
          },
        ),
        body: GetBuilder<ProductDetailsControllerImp>(
            builder: (controller) => ListView(children: [
                  const CustomStackView(),
                  const SizedBox(
                    height: 10,
                  ),
                  HanddlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomItemName(),
                          CustomOrderRow(),
                          const SizedBox(
                            height: 10,
                          ),
                          const CustomItemSubtitle(),
                          const SizedBox(
                            height: 240,
                          ),
                        ],
                      ))
                ])));
  }
}
