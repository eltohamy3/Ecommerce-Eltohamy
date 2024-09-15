import 'package:eltohmayecommerceapp/controller/address/editAddressControllr.dart';
import 'package:eltohmayecommerceapp/core/function/validation.dart';
import 'package:eltohmayecommerceapp/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class customEditAddressForm extends GetView<AddressEditControllerImp> {
  const customEditAddressForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      
      child: Column(
      children: [
                          CustomTextFormAuth(
                      hintText: "Edit Address Name",
                      labelText: "Address Name",
                      mycontroller: controller.addressNameController,
                      validator: (val) => CheckEmpty(val)),
                  CustomTextFormAuth(
                      hintText: "Edit Address City",
                      labelText: "Address City",
                      mycontroller: controller.addressCityCOntroller,
                      validator: (val) => CheckEmpty(val)),
                  CustomTextFormAuth(
                      hintText: "Edit Address Street",
                      labelText: "Address Street",
                      mycontroller: controller.addressStreetController,
                      validator: (val) => CheckEmpty(val)),

      ],
    ));
  }
}
