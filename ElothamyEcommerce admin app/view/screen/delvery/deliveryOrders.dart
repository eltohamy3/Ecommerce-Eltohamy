import 'package:eltohamyecommerceadminapp/controller/delivery/deliveryOrderConroller.dart';
import 'package:eltohamyecommerceadminapp/core/class/handlingDataView.dart';
import 'package:eltohamyecommerceadminapp/view/widget/orders/customArchivedCard.dart';
import 'package:eltohamyecommerceadminapp/view/widget/orders/customOrdersAppbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class DeliveryOrders extends StatelessWidget {
  const DeliveryOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<DeliveryOrdersControllerImp>(
        init: DeliveryOrdersControllerImp(),
        builder: (controller) =>  Scaffold(
      appBar: CustomOrdersAppBar(pageName: "${controller.deliveryModel.deliveryName} Orders"),
      body:
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
                    itemBuilder: (context, index) => CustomArchivedCard(
                      onTheWayOrderModel: controller.archivedOrdersList[index],
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