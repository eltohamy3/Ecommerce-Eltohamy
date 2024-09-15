import 'package:eltohmayecommerceapp/controller/address/viewAddressController.dart';
import 'package:eltohmayecommerceapp/core/class/crud.dart';
import 'package:eltohmayecommerceapp/controller/orders/checkoutController.dart';
import 'package:eltohmayecommerceapp/core/class/statusrequest.dart';
import 'package:eltohmayecommerceapp/core/function/alertexitapp.dart';
import 'package:eltohmayecommerceapp/core/function/getpositon.dart';
import 'package:eltohmayecommerceapp/core/function/handlingdata.dart';
import 'package:eltohmayecommerceapp/data/datasource/remote/addressData.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class AddressAddController extends GetxController {
  addAddress();
  updateCameraPositonAndMarkers(LatLng mycurrentpos);
}

class AddressAddControllerImp extends AddressAddController {
  AddressData addressData = AddressData(crud: Crud());
  late int fromCeckout;

  late GoogleMapController googleMapController;
  List<Marker> markers = [];
  CameraPosition mycurrentCameraPostion = CameraPosition(
    target: LatLng(30.340060, 31.333986),
    zoom: 15.4746,
  );

  Position? mycurrentLocation;

  LatLng? currentpositonLatLng;

  late TextEditingController addressCityCOntroller;
  late TextEditingController addressStreetController;
  late TextEditingController addressNameController;

  late StatusRequest statusRequest;
  late GlobalKey<FormState> formKey;

  addAddress() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var responce = await addressData.PostAddAddress(
          addressCityCOntroller.text,
          addressStreetController.text,
          addressNameController.text,
          currentpositonLatLng!.latitude,
          currentpositonLatLng!.longitude);
      statusRequest = handleData(responce);

      if (statusRequest == StatusRequest.success) {
        if (responce['status'] == 'Success') {
          showSuccessMassageWithOk(
            Get.context!,
            "Add Address",
            "Add the New Address Done Successfully",
            () {},
            "ok",
            (p0) async {
              if (fromCeckout == 1) {
                CheckoutControllerImp checkoutControllerImp = Get.find();
                Get.back();
                Get.back();
                await checkoutControllerImp.GetAllAddress();
              } else {
                AddressViewControllerImp addressviewcontroller = Get.find();
                Get.back();
                await addressviewcontroller.GetAddress();
              }
            },
          );
        } else {
          showErrorMassage(
              Get.context!, "Add Address", "Error while adding the address");
        }
      } else {
        showErrorMassage(
            Get.context!, "Add Address", "Error while adding the address");
      }
      statusRequest = StatusRequest.success;

      update();
    }
  }

  initalData() {
    currentpositonLatLng =
        LatLng(mycurrentLocation!.latitude, mycurrentLocation!.longitude);
    markers = [
      Marker(
          markerId: MarkerId(
            '1',
          ),
          position: LatLng(
              currentpositonLatLng!.latitude, currentpositonLatLng!.longitude))
    ];

    mycurrentCameraPostion = CameraPosition(
      target: LatLng(
          currentpositonLatLng!.latitude, currentpositonLatLng!.longitude),
      zoom: 15.4746,
    );
    update();
  }

  updateCameraPositonAndMarkers(LatLng mycurrentpos) {
    currentpositonLatLng = mycurrentpos;
    markers[0] = Marker(
        markerId: MarkerId(
          '1',
        ),
        position: currentpositonLatLng!);

    mycurrentCameraPostion = CameraPosition(
      target: currentpositonLatLng!,
      zoom: 15.4746,
    );
    googleMapController
        .animateCamera(CameraUpdate.newCameraPosition(mycurrentCameraPostion));
    update();
  }

  @override
  void onInit() async {
    statusRequest = StatusRequest.loading;
    fromCeckout = Get.arguments['fromCeckout'];
    formKey = GlobalKey();
    addressCityCOntroller = TextEditingController();
    addressStreetController = TextEditingController();
    addressNameController = TextEditingController();

    mycurrentLocation = await GetPositon();
    if (mycurrentLocation != null) {
      statusRequest = StatusRequest.success;
      initalData();
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
    super.onInit();
  }
}
