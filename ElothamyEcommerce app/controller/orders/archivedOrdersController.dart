import 'package:eltohmayecommerceapp/core/class/crud.dart';
import 'package:eltohmayecommerceapp/core/class/statusrequest.dart';
import 'package:eltohmayecommerceapp/core/function/alertexitapp.dart';
import 'package:eltohmayecommerceapp/core/function/handlingdata.dart';
import 'package:eltohmayecommerceapp/data/datasource/remote/orderData.dart';
import 'package:eltohmayecommerceapp/data/model/ordersModel.dart';
import 'package:get/get.dart';

abstract class ArchivedOrderController extends GetxController {}

class ArchivedOrderControllerImp extends ArchivedOrderController {
  List<OrdersModel> archivedOrdersList = [];
  OrdersData ordersData = OrdersData(crud: Crud());
  late StatusRequest statusRequest;

  RatingOrder(double rating, int orderId, String? massage) async {
    statusRequest = StatusRequest.loading;
    update();
    var responce = await ordersData.PostRatingOrder(rating, orderId, massage);
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in Pending orders :  ${responce}');
      if (responce['status'] == 'Success') {
        showSuccessMassage(Get.context!, "Rating", "Rating done successfully");
      } else {
        showErrorMassage(Get.context!, "Rating", "Error while Rating Process ");
      }
    } else {
      showErrorMassage(Get.context!, "Rating", "Error while Rating Process ");
    }
    await GetArchiveData();

  }

  GetArchiveData() async {
    archivedOrdersList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var responce = await ordersData.PostArchivedOrders();
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in Pending orders :  ${responce}');
      if (responce['status'] == 'Success') {
        if (responce['data'] != null) {
          responce['data'].forEach((element) {
            archivedOrdersList.add(OrdersModel.fromJson(element));
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
    await GetArchiveData();
    super.onInit();
  }
}
