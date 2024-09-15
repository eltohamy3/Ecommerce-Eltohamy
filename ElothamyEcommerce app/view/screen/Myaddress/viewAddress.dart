import 'package:eltohmayecommerceapp/controller/address/viewAddressController.dart';
import 'package:eltohmayecommerceapp/core/class/handlingDataView.dart';
import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:eltohmayecommerceapp/view/widget/address/addressView/customAddressviewcard.dart';
import 'package:eltohmayecommerceapp/view/widget/address/addressView/customFloatActionbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: CustomAddressViewFloatActionButton(),
        appBar: AppBar(
          title: Text(
            ' My Address',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: AppColor.secondarycolor,
        ),
        body: GetBuilder<AddressViewControllerImp>(
          init: AddressViewControllerImp(),
          builder: (controller) => HanddlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: EdgeInsets.all(20),
              child: ListView(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.AddressDataList.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          controller.GoToAddressDetails(
                              controller.AddressDataList[index]);
                        },
                        child: CustomAddressViewCard(
                          onPressed: () {
                            controller.Deleteitemsbutton(
                                controller.AddressDataList[index]);
                          },
                          addressModel: controller.AddressDataList[index],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
