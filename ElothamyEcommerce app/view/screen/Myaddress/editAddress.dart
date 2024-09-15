import 'package:eltohmayecommerceapp/controller/address/editAddressControllr.dart';
import 'package:eltohmayecommerceapp/core/class/handlingDataView.dart';
import 'package:eltohmayecommerceapp/view/widget/ProductDetails/CustomButtonprimarycolor.dart';
import 'package:eltohmayecommerceapp/view/widget/address/addressEdit/addressEditForm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EditAddress extends StatelessWidget {
  const EditAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressEditControllerImp>(
      
      init: AddressEditControllerImp(),
      builder: (controller) => Scaffold(
              bottomNavigationBar: CustomPrimaryButton(
        Title: "Edit Address",
        onPressed: () {
          controller.EditAddress();
        },
      ),

        appBar: AppBar(
          title: Text(' Edit Address'),
        ),
        body: HanddlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
              padding: EdgeInsets.all(20),
              child: ListView(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  customEditAddressForm(),
                  Container(
                    height: 400,
                    width: Get.width,
                    child: GoogleMap(
                      markers: controller.markers.toSet(),
                      mapType: MapType.hybrid,
                      onTap: (LatLng slectedPositon) {
                        controller
                            .updateCameraPositonAndMarkers(slectedPositon);
                      },
                      initialCameraPosition: controller.mycurrentCameraPostion,
                      onMapCreated: (GoogleMapController mycontroller) {
                        controller.googleMapController = mycontroller;
                      },
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
