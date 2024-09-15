import 'package:eltohamyecommercedeliveryapp/core/class/crud.dart';
import 'package:eltohamyecommercedeliveryapp/core/class/statusrequest.dart';
import 'package:eltohamyecommercedeliveryapp/core/function/alertexitapp.dart';
import 'package:eltohamyecommercedeliveryapp/core/function/handlingdata.dart';
import 'package:eltohamyecommercedeliveryapp/data/datasource/remote/orderData.dart';
import 'package:eltohamyecommercedeliveryapp/data/model/ordersModel.dart';
import 'package:get/get.dart';

abstract class OnTheWayController extends GetxController {}

class OnTheWayControllerImp extends OnTheWayController {
  List<OrdersModel> onTheWayOrdersList = [];
  OrdersData ordersData = OrdersData(crud: Crud());
  late StatusRequest statusRequest;

  getData() async {
    onTheWayOrdersList.clear();
    statusRequest = StatusRequest.loading;
    update();

    var responce = await ordersData.PostOnTheWayOrders();
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in Pending orders :  ${responce}');
      if (responce['status'] == 'Success') {
        if (responce['data'] != null) {
          responce['data'].forEach((element) {
            onTheWayOrdersList.add(OrdersModel.fromJson(element));
          });
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  orderDone(OrdersModel ordersModel) async {
    statusRequest = StatusRequest.loading;
    update();
    var responce = await ordersData.PostOrderDone(
        ordersModel.ordersId!, ordersModel.ordersUserid!);
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in on the way orders :  ${responce}');
      if (responce['status'] == 'Success') {
        showSuccessMassage(Get.context!, "Order Archive ",
            "the order has been updated to archived state");
        await getData();
      } else {
        showErrorMassage(Get.context!, "Order Archive",
            "Order Archived hasn`t been done sucessesfully");
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
