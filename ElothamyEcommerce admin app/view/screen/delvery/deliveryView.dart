import 'package:eltohamyecommerceadminapp/controller/delivery/deliveryViewController.dart';
import 'package:eltohamyecommerceadminapp/core/class/handlingDataView.dart';
import 'package:eltohamyecommerceadminapp/core/constant/mycolors.dart';
import 'package:eltohamyecommerceadminapp/core/constant/routename.dart';
import 'package:eltohamyecommerceadminapp/view/widget/delivery/customDeliveryVIewCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryVIew extends StatelessWidget {
  const DeliveryVIew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.secondarycolor,
        onPressed: () {
          Get.toNamed(AppRoute.deliveryAdd);
        },
        child: Icon(
          Icons.add,
          color: AppColor.white,
        ),
      ),
      appBar: AppBar(
        title: Text('Delivery'),
      ),
      body: GetBuilder<DeliveryViewControllerImp>(
        init: DeliveryViewControllerImp(),
        builder: (controller) => HanddlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
              child: ListView.builder(
                  itemCount: controller.DeliveryViewList.length,
                  itemBuilder: (context, index) => CustomDeliveryViewCard(
                        deliveryModel: controller.DeliveryViewList[index],
                      ))),
        ),
      ),
    );
  }
}
