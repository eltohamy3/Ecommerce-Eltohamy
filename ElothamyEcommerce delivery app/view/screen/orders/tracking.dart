import 'package:eltohamyecommercedeliveryapp/controller/orders/orderDetailsController.dart';
import 'package:eltohamyecommercedeliveryapp/controller/trackingController.dart';
import 'package:eltohamyecommercedeliveryapp/core/class/handlingDataView.dart';
import 'package:eltohamyecommercedeliveryapp/core/constant/mycolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderTracking extends StatelessWidget {
  const OrderTracking({super.key});

  @override
  Widget build(BuildContext context) {
    OrderDetailsControllerImp DetailsController =
        Get.put(OrderDetailsControllerImp());
    return Scaffold(
        appBar: AppBar(title: const Text('Tracking Order')),
        body: GetBuilder<TrackingControllerImp>(
            init: TrackingControllerImp(),
            builder: (controller) => HanddlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Column(
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
                      ),
                      Container(
                        // margin: EdgeInsets.symmetric(horizontal: 20),
                        height: 40,
                        width: double.infinity,

                        child: MaterialButton(
                          

                          onPressed: () {
                            controller.OrderDone();
                          },
                          color: AppColor.white,
                          child: const Text(
                            "Done",
                            style: TextStyle(color: AppColor.secondarycolor , 
                            fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )));
  }
}
