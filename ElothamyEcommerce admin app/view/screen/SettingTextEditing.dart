import 'package:eltohamyecommerceadminapp/controller/EditSettingController.dart';
import 'package:eltohamyecommerceadminapp/core/class/handlingDataView.dart';
import 'package:eltohamyecommerceadminapp/core/constant/mycolors.dart';
import 'package:eltohamyecommerceadminapp/core/function/validation.dart';
import 'package:eltohamyecommerceadminapp/view/widget/auth/customTextTitleauth.dart';
import 'package:eltohamyecommerceadminapp/view/widget/auth/customtextformauth.dart';
import 'package:eltohamyecommerceadminapp/view/widget/orders/customMaterialButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SettingEditingText extends StatelessWidget {
  const SettingEditingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting Text Edit'),
      ),
      body: GetBuilder<EditSettingControllerImp>(
        init:EditSettingControllerImp() ,
        builder: (controller) => HanddlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: ListView(
                children: [
                  const CustomTextTitleAuth(texttitle: "Edit Setting Data"),
                  const SizedBox(
                    height: 40,
                  ),
                  Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          CustomTextFormAuth(
                              hintText: "Edit Your Setting title",
                              labelText: "Setting title",
                              mycontroller: controller.titelController,
                              validator: (val) => CheckEmpty(val)),
                          CustomTextFormAuth(
                              hintText: "Edit Your Setting subtitle",
                              labelText: "Setting subtitle",
                              mycontroller: controller.subTitelController,
                              validator: (val) => CheckEmpty(val)),
                          CustomTextFormAuth(
                              hintText: "Edit Your Setting Delivery time",
                              labelText: " Setting Delivery time",
                              mycontroller:
                                  controller.settingDeliverytimeController,
                              isnumber: true,
                              validator: (val) => CheckEmpty(val)),
                          CustomTextFormAuth(
                              hintText: "Edit Your Setting Delivery price",
                              labelText: " Setting Delivery price",
                              mycontroller:
                                  controller.setting_DeliveryPriceController,
                              isnumber: true,
                              validator: (val) => CheckEmpty(val)),
                        ],
                      )),
                  CustomMaterialButton(
                    title: "Edit Setting",
                    color: AppColor.secondarycolor,
                    textcolor: AppColor.white,
                    onPressed: () {
                      controller.EditSettingutton();
                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
