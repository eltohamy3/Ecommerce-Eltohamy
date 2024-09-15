import 'package:eltohamyecommercedeliveryapp/controller/orders/archivedOrdersController.dart';
import 'package:eltohamyecommercedeliveryapp/core/class/handlingDataView.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/orders/customOrdersAppbar.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/orders/customorderCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ArchivedOrders extends StatelessWidget {
  const ArchivedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomOrdersAppBar(pageName: "Orders Archive"),

      body: GetBuilder<ArchivedOrderControllerImp>(
        init: ArchivedOrderControllerImp(),
        builder: (controller) => 
        HanddlingDataView(
          statusRequest: controller.statusRequest,
          widget:  Container(
            padding: EdgeInsets.all(20),
            child: ListView(
              children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics:NeverScrollableScrollPhysics(),
                    itemCount:controller.archivedOrdersList.length ,
                    itemBuilder: (context, index) => CustomOrderCard(
                      ordersModel: controller.archivedOrdersList[index],
                      isArchive: true,
                    )) 
              ]
            ),
                   ),
         ),
      ),
    );
  }
}