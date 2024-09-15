import 'package:eltohamyecommerceadminapp/controller/orders/deleverywatingController.dart';
import 'package:eltohamyecommerceadminapp/core/class/handlingDataView.dart';
import 'package:eltohamyecommerceadminapp/view/widget/orders/customOrdersAppbar.dart';
import 'package:eltohamyecommerceadminapp/view/widget/orders/customorderCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DeleveryWating extends StatelessWidget {
  const DeleveryWating({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomOrdersAppBar(pageName: "Delevery wating Orders"),
      body: GetBuilder<DeleveryWatingControllerImp>(
        init: DeleveryWatingControllerImp(),
        builder: (controller) => HanddlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsets.all(20),
            child: ListView(children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.DeleveryWatingList.length,
                  itemBuilder: (context, index) => CustomOrderCard(
                        ordersModel: controller.DeleveryWatingList[index],
                      ))
            ]),
          ),
        ),
      ),
    );
  }
}
