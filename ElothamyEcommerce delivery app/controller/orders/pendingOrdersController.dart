import 'package:eltohamyecommercedeliveryapp/core/class/crud.dart';
import 'package:eltohamyecommercedeliveryapp/core/class/statusrequest.dart';
import 'package:eltohamyecommercedeliveryapp/core/function/alertexitapp.dart';
import 'package:eltohamyecommercedeliveryapp/core/function/handlingdata.dart';
import 'package:eltohamyecommercedeliveryapp/data/datasource/remote/orderData.dart';
import 'package:eltohamyecommercedeliveryapp/data/model/ordersModel.dart';
import 'package:get/get.dart';

abstract class PendingOrdersController extends GetxController {}

class PendingOrdersControllerImp extends PendingOrdersController {
  List<OrdersModel> PendingOrdersList = [];
  OrdersData ordersData = OrdersData(crud: Crud());
  late StatusRequest statusRequest;

  getData() async {
    PendingOrdersList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var responce = await ordersData.PostPendingOrders();
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in Pending orders :  ${responce}');
      if (responce['status'] == 'Success') {
        if (responce['data'] != null) {
          responce['data'].forEach((element) {
            PendingOrdersList.add(OrdersModel.fromJson(element));
          });
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  orderApprove(OrdersModel ordersModel) async {
    statusRequest = StatusRequest.loading;
    update();
    var responce = await ordersData.PostOrderApprove(
        ordersModel.ordersId!, ordersModel.ordersUserid!);
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in order approve orders :  ${responce}');
      if (responce['status'] == 'Success') {
        showSuccessMassage(Get.context!, "Order approve ",
            "the order has been approved successfully");
        await getData();
      } else {
        showErrorMassage(Get.context!, "Order approve",
            "Order approve hasn`t been done sucessesfully");
        statusRequest = StatusRequest.success;
      }
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
