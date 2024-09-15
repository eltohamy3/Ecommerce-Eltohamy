import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/core/class/statusrequest.dart';
import 'package:eltohamyecommerceadminapp/core/function/handlingdata.dart';
import 'package:eltohamyecommerceadminapp/data/datasource/remote/orderData.dart';
import 'package:eltohamyecommerceadminapp/data/model/ordersModel.dart';
import 'package:get/get.dart';

abstract class DeleveryWatingController extends GetxController {}

class DeleveryWatingControllerImp extends DeleveryWatingController {
  List<OrdersModel> DeleveryWatingList = [];
  OrdersData ordersData = OrdersData(crud: Crud());
  late StatusRequest statusRequest;

  getData() async {
    DeleveryWatingList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var responce = await ordersData.postDeleveryWatingView();
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in DeleveryWatingControllerView orders :  ${responce}');
      if (responce['status'] == 'Success') {
        if (responce['data'] != null) {
          responce['data'].forEach((element) {
            DeleveryWatingList.add(OrdersModel.fromJson(element));
          });
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  @override
  void onInit() async {
    statusRequest = StatusRequest.loading;
    await getData();
    super.onInit();
  }
}
