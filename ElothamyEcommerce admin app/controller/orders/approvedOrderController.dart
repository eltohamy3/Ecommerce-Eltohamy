import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/core/class/statusrequest.dart';
import 'package:eltohamyecommerceadminapp/core/function/alertexitapp.dart';
import 'package:eltohamyecommerceadminapp/core/function/handlingdata.dart';
import 'package:eltohamyecommerceadminapp/data/datasource/remote/orderData.dart';
import 'package:eltohamyecommerceadminapp/data/model/ordersModel.dart';
import 'package:get/get.dart';

abstract class ApprovedOrderController extends GetxController {}

class ApprovedOrderControllerImp extends ApprovedOrderController {
  List<OrdersModel> approvedOrderList = [];
  OrdersData ordersData = OrdersData(crud: Crud());
  late StatusRequest statusRequest;

  getData() async {
    approvedOrderList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var responce = await ordersData.postApprovedView();
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in Pending orders :  ${responce}');
      if (responce['status'] == 'Success') {
        if (responce['data'] != null) {
          responce['data'].forEach((element) {
            approvedOrderList.add(OrdersModel.fromJson(element));
          });
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  OrderPrepared(OrdersModel ordersModel) async {
    statusRequest = StatusRequest.loading;
    update();
    var responce = await ordersData.PostOrderPrepared(
        ordersModel.ordersId!, ordersModel.ordersUserid! , ordersModel.ordersTypes!);
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in on the way orders :  ${responce}');
      if (responce['status'] == 'Success') {
        showSuccessMassage(Get.context!, "Order Prepar ",
            "the order has been prepard succesfully  ");
        await getData();
      } else {
        showErrorMassage(Get.context!, "Order Prepar",
            "Order Prepar hasn`t been done sucessesfully");
        statusRequest = StatusRequest.success;
      }
    }else
    {
        showErrorMassage(Get.context!, "Order Prepar",
            "Order Prepar hasn`t been done sucessesfully");

    }
    statusRequest = StatusRequest.success;
    update();
  }


  @override
  void onInit() async {
    statusRequest = StatusRequest.loading;
    await getData();
    super.onInit();
  }
}
