import 'package:eltohmayecommerceapp/controller/address/viewAddressController.dart';
import 'package:eltohmayecommerceapp/core/class/crud.dart';
import 'package:eltohmayecommerceapp/core/class/statusrequest.dart';
import 'package:eltohmayecommerceapp/core/function/alertexitapp.dart';
import 'package:eltohmayecommerceapp/core/function/handlingdata.dart';
import 'package:eltohmayecommerceapp/data/datasource/remote/addressData.dart';
import 'package:eltohmayecommerceapp/data/model/addressModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressEditController extends GetxController {}

class AddressEditControllerImp extends AddressEditController {
  AddressData addressData = AddressData(crud: Crud());

  late GoogleMapController googleMapController;
  List<Marker> markers = [];
  CameraPosition mycurrentCameraPostion = CameraPosition(
    target: LatLng(30.340060, 31.333986),
    zoom: 15.4746,
  );

  LatLng? currentpositonLatLng;

  late TextEditingController addressCityCOntroller;
  late TextEditingController addressStreetController;
  late TextEditingController addressNameController;

  late StatusRequest statusRequest;
  late GlobalKey<FormState> formKey;
  late AddressModel addressModel;

  EditAddress() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var responce = await addressData.PostEditAddress(
          addressModel.addressId!,
          addressCityCOntroller.text,
                    addressNameController.text,

          addressStreetController.text,
          currentpositonLatLng!.latitude,
          currentpositonLatLng!.longitude);
      statusRequest = handleData(responce);

      if (statusRequest == StatusRequest.success) {
        if (responce['status'] == 'Success') {
          showSuccessMassageWithOk(
            Get.context!,
            "Edit Address",
            "Edit the  Address Done Successfully",
            () {},
            "ok",
            (p0) async {
              AddressViewControllerImp addressviewcontroller = Get.find();
              Get.back();
              Get.back();
              await addressviewcontroller.GetAddress();
            },
          );
        } else {
          showErrorMassage(
              Get.context!, "Edit Address", "Error while Editing the address");
        }
      } else {
        showErrorMassage(
            Get.context!, "Edit Address", "Error while Editing the address");
      }
      statusRequest = StatusRequest.success;

      update();
    }
  }

  initalData() {
    formKey = GlobalKey();
    print(addressModel.toString());
    addressCityCOntroller = TextEditingController();
    addressStreetController = TextEditingController();
    addressNameController = TextEditingController();
    addressCityCOntroller.text = addressModel.addressCity!;
    addressStreetController.text = addressModel.addressStreet!;
    addressNameController.text = addressModel.addressName!;

    currentpositonLatLng =
        LatLng(addressModel.addressLat!, addressModel.addressLong!);
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
  void onClose() {
    super.onClose();
  }

  @override
  void onInit() {
    addressModel = Get.arguments['addressModel'];
    statusRequest = StatusRequest.loading;
    initalData();
    statusRequest = StatusRequest.success;
    update();
    super.onInit();
  }
}
