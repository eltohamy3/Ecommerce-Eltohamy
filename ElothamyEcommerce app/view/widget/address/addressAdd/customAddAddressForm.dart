import 'package:eltohmayecommerceapp/controller/address/addAddressController.dart';
import 'package:eltohmayecommerceapp/core/function/validation.dart';
import 'package:eltohmayecommerceapp/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAddAddressForm extends GetView<AddressAddControllerImp> {
  const CustomAddAddressForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      
      child: Column(
      children: [
                          CustomTextFormAuth(
                      hintText: "Enter Address Name",
                      labelText: "Address Name",
                      mycontroller: controller.addressNameController,
                      validator: (val) => CheckEmpty(val)),
                  CustomTextFormAuth(
                      hintText: "Enter Address City",
                      labelText: "Address City",
                      mycontroller: controller.addressCityCOntroller,
                      validator: (val) => CheckEmpty(val)),
                  CustomTextFormAuth(
                      hintText: "Enter Address Street",
                      labelText: "Address Street",
                      mycontroller: controller.addressStreetController,
                      validator: (val) => CheckEmpty(val)),

      ],
    ));
  }
}
