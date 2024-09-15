import 'package:eltohmayecommerceapp/core/class/crud.dart';
import 'package:eltohmayecommerceapp/core/class/statusrequest.dart';
import 'package:eltohmayecommerceapp/core/function/alertexitapp.dart';
import 'package:eltohmayecommerceapp/core/function/handlingdata.dart';
import 'package:eltohmayecommerceapp/data/datasource/remote/orderData.dart';
import 'package:eltohmayecommerceapp/data/model/ordersModel.dart';
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

  checkOrderDelete(int OrderId) {
    showHazardMassage(
        Get.context!, "orderDelete", "are you sure to delete this order", () {
      deleteOrder(OrderId);
    }, "ok");
  }

  deleteOrder(int orderId) async {
    statusRequest = StatusRequest.loading;
    update();
    var responce = await ordersData.PostDeleteOrder(orderId);
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in Pending orders :  ${responce}');
      if (responce['status'] == 'Success') {
        PendingOrdersList.removeWhere(
            (element) => element.ordersId! == orderId);
      } else {
        showErrorMassage(
            Get.context!, "Orders", "Order has`t been removed try again");
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
