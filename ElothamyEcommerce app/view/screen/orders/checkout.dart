import 'package:eltohmayecommerceapp/controller/orders/checkoutController.dart';
import 'package:eltohmayecommerceapp/core/class/handlingDataView.dart';
import 'package:eltohmayecommerceapp/core/constant/imageasset.dart';
import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:eltohmayecommerceapp/view/widget/ProductDetails/CustomButtonprimarycolor.dart';
import 'package:eltohmayecommerceapp/view/widget/checkout/cusotmTitleText.dart';
import 'package:eltohmayecommerceapp/view/widget/checkout/cusotomDeliveryType.dart';
import 'package:eltohmayecommerceapp/view/widget/checkout/customCheckPaymentMethod.dart';
import 'package:eltohmayecommerceapp/view/widget/checkout/customaddressCard.dart';
import 'package:eltohmayecommerceapp/view/widget/orders/customOrdersAppbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutPage extends GetView<CheckoutControllerImp> {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomPrimaryButton(
          Title: "CheckOut",
          onPressed: () {
            controller.CheckOut();
          },
        ),
      appBar: CustomOrdersAppBar(pageName: "Checkout"),

        body: GetBuilder<CheckoutControllerImp>(
          init: CheckoutControllerImp(),
          builder: (controller) => HanddlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(15),
              child: ListView(children: [
                const SizedBox(
                  height: 15,
                ),
                const CusotmTitleText(
                  Titel: 'Choose Payment Method',
                ),
                CustomCheckPaymentMethod(
                  title: "Chach ON Delivary",
                  onTap: () {
                    controller.setPaymentMethod(1);
                  },
                  isSelected: controller.PaymentMethod == 1,
                ),
                CustomCheckPaymentMethod(
                  title: "Payment Cards",
                  onTap: () {
                    controller.setPaymentMethod(2);
                  },
                  isSelected: controller.PaymentMethod == 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                const CusotmTitleText(
                  Titel: 'Choose Delivery Type',
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CustomDeliveryType(
                      imageSource: AppImageAsset.delivery,
                      titel: "Delivery",
                      onTap: () {
                        controller.setDeliveryType(1);
                      },
                      isSelected: controller.deliveryType == 1,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomDeliveryType(
                      imageSource: AppImageAsset.Recive,
                      titel: "Recive",
                      onTap: () {
                        controller.setDeliveryType(2);
                      },
                      isSelected: controller.deliveryType == 2,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                controller.deliveryType == 1
                    ? const CusotmTitleText(
                        Titel: 'Shipping Address',
                      )
                    : const Text(''),
                const SizedBox(
                  height: 10,
                ),
                controller.deliveryType == 1
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.addressList.length,
                        itemBuilder: (context, index) => CustomAddressCard(
                          onTap: () {
                            controller.setSelectedAddress(controller.addressList[index].addressId!);
                          },


                          isSelected: controller.selectedAddress == controller.addressList[index].addressId!,
                          title: controller.addressList[index].addressName!,
                          subtitle:
                              controller.addressList[index].addressStreet!,
                        ),
                      )
                    : const Text("")
              ]),
            ),
          ),
        ));
  }
}
