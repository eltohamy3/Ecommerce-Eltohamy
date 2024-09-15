import 'package:eltohmayecommerceapp/controller/address/addAddressController.dart';
import 'package:eltohmayecommerceapp/core/class/handlingDataView.dart';
import 'package:eltohmayecommerceapp/view/widget/ProductDetails/CustomButtonprimarycolor.dart';
import 'package:eltohmayecommerceapp/view/widget/address/addressAdd/customAddAddressForm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CompleatAddingAddress extends GetView<AddressAddControllerImp> {
  const CompleatAddingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomPrimaryButton(
        Title: "Add Address",
        onPressed: () {
          controller.addAddress();
        },
      ),
      appBar: AppBar(
        title: const Text(
          'Add Address',
        ),
      ),
      body: GetBuilder<AddressAddControllerImp>(
        builder: (controller) => HanddlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: const [
                  SizedBox(
                    height: 30,
                  ),
                  CustomAddAddressForm()
                ],
              )),
        ),
      ),
    );
  }
}
