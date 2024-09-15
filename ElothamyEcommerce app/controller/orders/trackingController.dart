import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eltohmayecommerceapp/core/class/statusrequest.dart';
import 'package:eltohmayecommerceapp/data/model/ordersModel.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class TrackingController extends GetxController {}

class TrackingControllerImp extends TrackingController {
  late OrdersModel ordersModel;

  Timer? timer;
  LatLng? deleveryPositionLatlng;
  GoogleMapController? googleMapController;
  late StatusRequest statusRequest;
  List<Marker> markers = [];
  CameraPosition mycurrentCameraPostion = const CameraPosition(
    target: LatLng(30.340060, 31.333986),
    zoom: 15.4746,
  );

  LatLng? userPositionLatlng;

  updateData() {
    markers[1] = Marker(
        markerId: const MarkerId(
          '2',
        ),
        position: LatLng(deleveryPositionLatlng!.latitude,
            deleveryPositionLatlng!.longitude));
    update();
  }

  ListenDeleveryLocation() {
    FirebaseFirestore.instance
        .collection('delivery')
        .doc("${ordersModel.ordersId}")
        .snapshots()
        .listen((DocumentSnapshot<Map<String, dynamic>> event) {
      if (event.exists) {
        print('listen hear ${event.data().toString()} ');
        deleveryPositionLatlng = LatLng(
            double.parse(event.get('lat')), double.parse(event.get('long')));
        updateData();
      }
    });
  }

  initalData() async {
    print('in the inialal ');
    DocumentSnapshot<Map<String, dynamic>> data = await FirebaseFirestore
        .instance
        .collection('delivery')
        .doc("${ordersModel.ordersId}")
        .get();

    print("in the inialal");
    print("$data");
    Map<String, dynamic>? databody = data.data();
    print("${databody.toString()}");

    if (databody != null) {
      if (databody['lat'] != null && databody['long'] != null) {
        deleveryPositionLatlng = LatLng(
            double.parse(databody['lat']), double.parse(databody['long']));
        userPositionLatlng =
            LatLng(ordersModel.addressLat!, ordersModel.addressLong!);
        markers = [
          Marker(
              markerId: const MarkerId(
                '1',
              ),
              position: LatLng(
                  userPositionLatlng!.latitude, userPositionLatlng!.longitude)),
          Marker(
              markerId: const MarkerId(
                '2',
              ),
              position: LatLng(deleveryPositionLatlng!.latitude,
                  deleveryPositionLatlng!.longitude)),
        ];
        mycurrentCameraPostion = CameraPosition(
          target: LatLng(
              userPositionLatlng!.latitude, userPositionLatlng!.longitude),
          zoom: 10.4746,
        );
        statusRequest = StatusRequest.success;
        ListenDeleveryLocation();
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
  }

  @override
  void onClose() {
    if (timer != null) {
      timer!.cancel();
    }
    super.onClose();
  }

  @override
  void onInit() async {
    statusRequest = StatusRequest.loading;
    update();
    ordersModel = Get.arguments['ordersModel'];

    await initalData();
    update();
    super.onInit();
  }
}
