import 'dart:async';


import 'package:eltohmayecommerceapp/core/class/statusrequest.dart';
import 'package:eltohmayecommerceapp/core/function/alertexitapp.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapTestController extends GetxController {
  late StatusRequest statusRequest;
  // Position? myposting;
  StreamSubscription<Position>? positionStream;
  Position? currentPosition;
  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );
  late LatLng myCurrentPosition;

  late GoogleMapController googleMapcon;
  // supply location settings to getPositionStream

  CameraPosition eltohamyhome = CameraPosition(
    target: LatLng(30.340060, 31.333986),
    zoom: 15.4746,
  );

  List<Marker> markers = [
    Marker(
        markerId: MarkerId(
          '1',
        ),
        position: LatLng(31.340090, 31.333990)),
    Marker(
        markerId: MarkerId(
          '2',
        ),
        position: LatLng(30.340070, 31.333996))
  ];

  updateCameraPositonAndMarkers(LatLng mycurrentpos) {
    myCurrentPosition = mycurrentpos;
    markers[0] = Marker(
        markerId: MarkerId(
          '1',
        ),
        position: mycurrentpos);

    eltohamyhome = CameraPosition(
      target: mycurrentpos,
      zoom: 15.4746,
    );
    googleMapcon.animateCamera(CameraUpdate.newCameraPosition(eltohamyhome));
    // update();
  }

  _determinePosition() async {
    print('hear in the head of the function ');
    bool serviceEnabled;
    LocationPermission permission;
    print('hear befor is location ');

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print('hear after is location ');

    if (!serviceEnabled) {
      showErrorMassage(
          Get.context!, "Location", "Location Surverce are disabled");
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showErrorMassage(
            Get.context!, "Location", "Location permissions are denied");
        return null;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      showErrorMassage(Get.context!, "Location",
          "   'Location permissions are permanently denied, we cannot request permissions.'");
      return null;
    }
    print('befor the end of the function');
    // currentPosition = await Geolocator.getCurrentPosition();
    positionStream =
        await Geolocator.getPositionStream().listen((Position? position) {
      // print('hear in the getpositon');

      markers.add(Marker(
          markerId: MarkerId('1'),
          position: LatLng(position!.latitude, position.longitude)));
      eltohamyhome = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 15.4746,
      );
      googleMapcon.animateCamera(CameraUpdate.newCameraPosition(eltohamyhome));
      update();
      print(position == null
          ? 'Unknown'
          : '========${position.latitude.toString()}, ${position.longitude.toString()}=============');
    });
    print("${positionStream.toString()}");

    // print("${currentPosition}");
    // await initalizeData();
    print('Out from this function');
  }

  List<LatLng> polylinePointsList = [];

  Future<void> getpolinePoients() async {
    PolylinePoints polylinePoints = PolylinePoints();
    try {
      PolylineResult? result = await polylinePoints.getRouteBetweenCoordinates(
          "AIzaSyCP5dKuUn6JY65QB2pVF_oqDm2uqQGL_T0",
          PointLatLng(31.340090, 31.333990),
          PointLatLng(30.340070, 31.333996));

      if (result != null) {
        if (result.points.isNotEmpty) {
          result.points.forEach((element) {
            polylinePointsList.add(LatLng(element.latitude, element.longitude));
          });
        }
      }
    } catch (e) {
      print('faller because $e');
    }
  }

  @override
  void dispose() {
    if (positionStream != null) {
      positionStream!.cancel();
    }
    super.dispose();
  }

  initalizeData() async {
    myCurrentPosition =
        LatLng(currentPosition!.latitude, currentPosition!.longitude);
    ;
    markers = [
      Marker(
          markerId: MarkerId(
            '1',
          ),
          position: myCurrentPosition)
    ];
    eltohamyhome = CameraPosition(
      target: myCurrentPosition,
      zoom: 15.4746,
    );
  }

  @override
  void onInit() async {
    statusRequest = StatusRequest.loading;
    print('hear in the on in');
    update();
    await getpolinePoients();
    // await _determinePosition();
    // googleMapcon = Completer<GoogleMapController>();
    // print("${myposting}");
    statusRequest = StatusRequest.success;
    print('state changed');
    update();
    super.onInit();
  }

}
