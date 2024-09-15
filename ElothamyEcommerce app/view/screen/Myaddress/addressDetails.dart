import 'package:eltohmayecommerceapp/controller/address/addressDetails.dart';
import 'package:eltohmayecommerceapp/core/class/handlingDataView.dart';
import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:eltohmayecommerceapp/view/widget/ProductDetails/CustomButtonprimarycolor.dart';
import 'package:eltohmayecommerceapp/view/widget/orders/cusotmorderText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressDetails extends StatelessWidget {
  const AddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Address Details ',
        ),
        backgroundColor: AppColor.secondarycolor,
      ),
      body: GetBuilder<AddressDetailsControllerImp>(
        init: AddressDetailsControllerImp(),
        builder: (controller) => HanddlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsets.all(0),
            child: Column(
              children: [
                Card(
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              CustomOrderTextItem("Address City   : " +
                                  controller.addressModel.addressCity!),
                              CustomOrderTextItem("Address Name   : " +
                                  controller.addressModel.addressName!),
                              CustomOrderTextItem("Address Street : " +
                                  controller.addressModel.addressStreet!),
                            ]))),
                            SizedBox(height: 30,) ,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 500 ,
                  width: Get.width,
                  child: GoogleMap(
                    markers: controller.markers.toSet(),
                    mapType: MapType.hybrid,
                    initialCameraPosition: controller.mycurrentCameraPostion,
                    onMapCreated: (GoogleMapController mycontroller) {
                      controller.googleMapController = mycontroller;
                    },
                  ),
                ) ,
                SizedBox(height: 30,) ,
                CustomPrimaryButton(
        Title: "Go To Edit Address ",
        onPressed: () {
          controller.GoToEditPage();
        },
      ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
