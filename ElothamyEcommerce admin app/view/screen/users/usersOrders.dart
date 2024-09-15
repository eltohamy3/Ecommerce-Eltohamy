import 'package:eltohamyecommerceadminapp/controller/users/usersOrderController.dart';
import 'package:eltohamyecommerceadminapp/core/class/handlingDataView.dart';
import 'package:eltohamyecommerceadminapp/view/widget/orders/customArchivedCard.dart';
import 'package:eltohamyecommerceadminapp/view/widget/orders/customOrdersAppbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class UserOrders extends StatelessWidget {
  const UserOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<UsersOrdersControllerImp>(
        init: UsersOrdersControllerImp(),
        builder: (controller) =>  Scaffold(
      appBar: CustomOrdersAppBar(pageName: "${controller.userModel.username} Orders"),
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