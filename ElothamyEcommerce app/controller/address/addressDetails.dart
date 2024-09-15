import 'package:eltohmayecommerceapp/core/class/statusrequest.dart';
import 'package:eltohmayecommerceapp/core/constant/routename.dart';
import 'package:eltohmayecommerceapp/data/model/addressModel.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class AddressDetailsController extends GetxController {
  GoToEditPage();
}

class AddressDetailsControllerImp extends AddressDetailsController {
  late AddressModel addressModel;
  late GoogleMapController googleMapController;
  List<Marker> markers = [];
  CameraPosition mycurrentCameraPostion = CameraPosition(
    target: LatLng(30.340060, 31.333986),
    zoom: 15.4746,
  );

  LatLng? currentpositonLatLng;
  late StatusRequest statusRequest;

  initalData() {
        addressModel = Get.arguments['addressModel'];

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

  @override
  void onInit() {
    statusRequest = StatusRequest.loading;
    update();
    initalData();
    statusRequest = StatusRequest.success; 

    super.onInit();
  }

  @override
  GoToEditPage() {
    Get.toNamed(AppRoute.editAddress,
        arguments: {'addressModel': addressModel});
  }
}
