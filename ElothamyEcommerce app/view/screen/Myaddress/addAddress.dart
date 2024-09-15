import 'package:eltohmayecommerceapp/controller/address/addAddressController.dart';
import 'package:eltohmayecommerceapp/core/class/handlingDataView.dart';
import 'package:eltohmayecommerceapp/core/class/statusrequest.dart';
import 'package:eltohmayecommerceapp/view/widget/address/addressAdd/customFloatAcctionbuttonadd.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressAddControllerImp>(
        init: AddressAddControllerImp(),
        builder: (controller) => Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: controller.statusRequest == StatusRequest.success? CustomCompleatAddingAddressButton() : null ,
      appBar:
       AppBar(
        title: Text(
          'Add Address',
        ),
      ),
      body:  HanddlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
              child: Column(
            children: [
              Expanded(
                child: GoogleMap(
                  markers: controller.markers.toSet(),
                  mapType: MapType.normal,
                  onTap: (LatLng slectedPositon) {
                    controller.updateCameraPositonAndMarkers(slectedPositon);
                  },
                  initialCameraPosition: controller.mycurrentCameraPostion,
                  onMapCreated: (GoogleMapController mycontroller) {
                    controller.googleMapController = mycontroller;
                  },
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
