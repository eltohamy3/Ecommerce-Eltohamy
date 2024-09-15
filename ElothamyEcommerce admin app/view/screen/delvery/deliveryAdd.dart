import 'package:eltohamyecommerceadminapp/controller/delivery/deliveryAddController.dart';
import 'package:eltohamyecommerceadminapp/core/class/handlingDataView.dart';
import 'package:eltohamyecommerceadminapp/core/constant/mycolors.dart';
import 'package:eltohamyecommerceadminapp/view/widget/auth/customButtonAuth.dart';
import 'package:eltohamyecommerceadminapp/view/widget/auth/customTextTitleauth.dart';
import 'package:eltohamyecommerceadminapp/view/widget/auth/custtomAuthAppbar.dart';
import 'package:eltohamyecommerceadminapp/view/widget/delivery/customDeliveryAddForm.dart';
import 'package:eltohamyecommerceadminapp/view/widget/orders/customMaterialButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class DelveryAdd extends StatelessWidget {
  const DelveryAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        title: Text("Add Delivery"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: GetBuilder<DeliveryAddControllerImp>(
            init: DeliveryAddControllerImp(),
            builder: (controller) => Container(
                  child: HanddlingDataViewRequest(
                    statusRequest: controller.statusRequest,
                    widget: ListView(
                      children: [
                        const CustomTextTitleAuth(
                            texttitle: "Add Delivery Data"),
                        const SizedBox(
                          height: 40,
                        ),
                        const CustomAddDeliveryForm(),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomMaterialButton(
                          title: "Add Delivery",
                          color: AppColor.secondarycolor,
                          textcolor: AppColor.white,
                          onPressed: () {
                            controller.AddDelivery();
                          },
                        ),
                        // CustomButtonAuth(
                        //   btnText: "Add Delivery",
                        //   onPressed: () => controller.AddDelivery(),
                        // ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
