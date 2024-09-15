import 'package:eltohamyecommerceadminapp/controller/orders/ApprovedOrderController.dart';
import 'package:eltohamyecommerceadminapp/core/class/handlingDataView.dart';
import 'package:eltohamyecommerceadminapp/view/widget/orders/customOrdersAppbar.dart';
import 'package:eltohamyecommerceadminapp/view/widget/orders/customorderCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ApprovedOrder extends StatelessWidget {
  const ApprovedOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomOrdersAppBar(pageName: "Approved Orders"),
      body: GetBuilder<ApprovedOrderControllerImp>(
        init: ApprovedOrderControllerImp(),
        builder: (controller) => HanddlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsets.all(20),
            child: ListView(children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.approvedOrderList.length,
                  itemBuilder: (context, index) => CustomOrderCard(
                        doneOnpress: () {
                          controller.OrderPrepared(                              controller.approvedOrderList[index]);
                        },
                        ordersModel: controller.approvedOrderList[index],
                      ))
            ]),
          ),
        ),
      ),
    );
  }
}
