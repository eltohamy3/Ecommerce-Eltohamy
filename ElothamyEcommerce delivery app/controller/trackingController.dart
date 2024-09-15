import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eltohamyecommercedeliveryapp/controller/orders/onTheWaycontroller.dart';
import 'package:eltohamyecommercedeliveryapp/core/class/statusrequest.dart';
import 'package:eltohamyecommercedeliveryapp/core/function/getpositon.dart';
import 'package:eltohamyecommercedeliveryapp/core/services/services.dart';
import 'package:eltohamyecommercedeliveryapp/data/model/ordersModel.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class TrackingController extends GetxController {}

class TrackingControllerImp extends TrackingController {
  late OrdersModel ordersModel;

  OrderDone() async {
    OnTheWayControllerImp onTheWayControllerImp = Get.find();
    Get.back();
    Get.back();
    await onTheWayControllerImp.orderDone(ordersModel);

  }

  Timer? timer;
  Position? mycurrentPositon;
  StreamSubscription<Position>? positionStream;
  GoogleMapController? googleMapController;
  late StatusRequest statusRequest;
  List<Marker> markers = [];
  CameraPosition mycurrentCameraPostion = CameraPosition(
    target: LatLng(30.340060, 31.333986),
    zoom: 15.4746,
  );

  LatLng? customerpositionLatlang;

  GetCurentLocation() {
    positionStream =
        Geolocator.getPositionStream().listen((Position? position) {
      if (position != null) {
        mycurrentPositon = position;
        updateData();
      }
      print('My current Position ====== ${position.toString()}');
    });
  }

  updateData() {
    markers[1] = Marker(
        markerId: MarkerId(
          '2',
        ),
        position:
            LatLng(mycurrentPositon!.latitude, mycurrentPositon!.longitude));
    mycurrentCameraPostion = CameraPosition(
      target: LatLng(mycurrentPositon!.latitude, mycurrentPositon!.longitude),
      zoom: 14.4746,
    );
    // if (googleMapController != null)
    //   googleMapController!.animateCamera(
    //       CameraUpdate.newCameraPosition(mycurrentCameraPostion));
    update();
  }

  updateLocation() {
    timer = Timer.periodic(Duration(seconds: 10), (timer) {
      print('hear in the firebase update location');
      FirebaseFirestore.instance
          .collection('delivery')
          .doc("${ordersModel.ordersId}")
          .set(
        {
          "lat": "${mycurrentPositon!.latitude}",
          "long": "${mycurrentPositon!.longitude}",
          "deliveryid": "${ordersModel.deldelivery_id}"
        },
      );
      print('adderd successfully================');
    });
  }

  initalData() async {
    customerpositionLatlang =
        LatLng(ordersModel.addressLat!, ordersModel.addressLong!);
    markers = [
      Marker(
          markerId: MarkerId(
            '1',
          ),
          position: LatLng(customerpositionLatlang!.latitude,
              customerpositionLatlang!.longitude)),
      Marker(
          markerId: MarkerId(
            '2',
          ),
          position:
              LatLng(mycurrentPositon!.latitude, mycurrentPositon!.longitude)),
    ];

    mycurrentCameraPostion = CameraPosition(
      target: LatLng(mycurrentPositon!.latitude, mycurrentPositon!.longitude),
      zoom: 10.4746,
    );
    GetCurentLocation();
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
    mycurrentPositon = await GetPositon();
    if (mycurrentPositon != null) {
      initalData();
      statusRequest = StatusRequest.success;
      updateLocation();
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
    super.onInit();
  }
}
