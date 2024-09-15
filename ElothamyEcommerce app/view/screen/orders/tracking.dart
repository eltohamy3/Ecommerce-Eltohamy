
import 'package:eltohmayecommerceapp/controller/orders/orderDetailsController.dart';
import 'package:eltohmayecommerceapp/controller/orders/trackingController.dart';
import 'package:eltohmayecommerceapp/core/class/handlingDataView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderTracking extends StatelessWidget {
  const OrderTracking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Tracking Order')),
        body: GetBuilder<TrackingControllerImp>(
          init: TrackingControllerImp(),
            builder: (controller) => HanddlingDataView(
              statusRequest: controller.statusRequest,
              widget:  Column(
                    children: [
                      Expanded(
                        child: GoogleMap(
                          markers: controller.markers.toSet(),
                          mapType: MapType.normal,
                          initialCameraPosition:
                              controller.mycurrentCameraPostion,
                          onMapCreated: (GoogleMapController mycontroller) {
                            controller.googleMapController = mycontroller;
                          },
                        ),
                      )
                    ],
                  ),
            )));
  }
}
