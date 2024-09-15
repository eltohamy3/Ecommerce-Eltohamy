
import 'package:eltohamyecommercedeliveryapp/core/function/alertexitapp.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

GetPositon() async {
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
      return await Geolocator.getCurrentPosition();
  }