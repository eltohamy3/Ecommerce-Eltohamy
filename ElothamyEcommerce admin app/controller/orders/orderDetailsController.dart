import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/core/class/statusrequest.dart';
import 'package:eltohamyecommerceadminapp/core/function/handlingdata.dart';
import 'package:eltohamyecommerceadminapp/data/datasource/remote/orderData.dart';
import 'package:eltohamyecommerceadminapp/data/model/ordersDetailsModel.dart';
import 'package:eltohamyecommerceadminapp/data/model/ordersModel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class OrderDetailsController extends GetxController {}

class OrderDetailsControllerImp extends OrderDetailsController {
  late OrdersModel ordersModel;

  List<OrdersDetailsModel> OrderdetailsList = [];
  late GoogleMapController googleMapController;
  List<Marker> markers = [];
  CameraPosition mycurrentCameraPostion = CameraPosition(
    target: LatLng(30.340060, 31.333986),
    zoom: 15.4746,
  );

  Position? mycurrentLocation;
  LatLng? currentpositonLatLng;

  OrdersData ordersData = OrdersData(crud: Crud());
  StatusRequest statusRequest = StatusRequest.loading;

  getData() async {
    OrderdetailsList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var responce = await ordersData.PostOrdersDetails(ordersModel.ordersId!);
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in Pending orders :  ${responce}');
      if (responce['status'] == 'Success') {
        if (responce['data'] != null) {
          responce['data'].forEach((element) {
            OrderdetailsList.add(OrdersDetailsModel.fromJson(element));
          });
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  initalData() {
    currentpositonLatLng =
        LatLng(ordersModel.addressLat!, ordersModel.addressLong!);
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
  void onInit() async {
    statusRequest = StatusRequest.loading;
    ordersModel = Get.arguments['ordersModel'];
    if (ordersModel.ordersTypes == 1 && ordersModel.addressLat!=null && ordersModel.ordersStatus != 4) initalData();
    // update();
    await getData();
    super.onInit();
  }
}
