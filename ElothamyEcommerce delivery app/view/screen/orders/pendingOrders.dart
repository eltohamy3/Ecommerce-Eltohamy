import 'package:eltohamyecommercedeliveryapp/controller/orders/pendingOrdersController.dart';
import 'package:eltohamyecommercedeliveryapp/core/class/handlingDataView.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/orders/customOrdersAppbar.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/orders/customorderCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PendingOrders extends StatelessWidget {
  const PendingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomOrdersAppBar(pageName: "Orders"),
      body: GetBuilder<PendingOrdersControllerImp>(
        init: PendingOrdersControllerImp(),
        builder: (controller) => HanddlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsets.all(20),
            child: ListView(children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.PendingOrdersList.length,
                  itemBuilder: (context, index) => CustomOrderCard(
                        approveOnpress: () {
                          controller.orderApprove(
                              controller.PendingOrdersList[index]);
                        },
                        ordersModel: controller.PendingOrdersList[index],
                      ))
            ]),
          ),
        ),
      ),
    );
  }
}
