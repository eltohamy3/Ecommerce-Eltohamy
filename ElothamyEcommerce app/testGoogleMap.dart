import 'dart:async';

import 'package:eltohmayecommerceapp/controller/gogleMapController.dart';
import 'package:eltohmayecommerceapp/core/class/handlingDataView.dart';
import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GogelMapCheck extends StatelessWidget {
  GogelMapCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GoogleMapTestController>(
      init: GoogleMapTestController(),
      builder: (controller) => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Google Map Check'),
          ),
          body: HanddlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              child: Column(
                children: [
                  Expanded(
                    child: GoogleMap(
                      polylines:{
                        Polyline(polylineId: PolylineId('route') , 
                        color: AppColor.secondarycolor,
                        points: controller.polylinePointsList.isEmpty? []:controller.polylinePointsList
                        )
                      } ,
                      
                      
                      markers: controller.markers.toSet(),
                      mapType: MapType.normal,
                      initialCameraPosition: controller.eltohamyhome,
                      onMapCreated: (GoogleMapController mycontroller) {
                        controller.googleMapcon = mycontroller;
                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
