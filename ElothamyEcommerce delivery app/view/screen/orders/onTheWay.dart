import 'package:eltohamyecommercedeliveryapp/controller/orders/onTheWaycontroller.dart';
import 'package:eltohamyecommercedeliveryapp/core/class/handlingDataView.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/orders/customOrdersAppbar.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/orders/customorderCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OnTheWayOrders extends StatelessWidget {
  const OnTheWayOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomOrdersAppBar(pageName: "Orders"),
      body: GetBuilder<OnTheWayControllerImp>(
        init: OnTheWayControllerImp(),
        builder: (controller) => HanddlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsets.all(20),
            child: ListView(children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.onTheWayOrdersList.length,
                  itemBuilder: (context, index) => CustomOrderCard(
                        doneOnpress: () {
                          controller
                              .orderDone(controller.onTheWayOrdersList[index]);
                        },
                        ordersModel: controller.onTheWayOrdersList[index],
                      ))
            ]),
          ),
        ),
      ),
    );
  }
}
