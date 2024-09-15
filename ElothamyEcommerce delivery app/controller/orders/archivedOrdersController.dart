import 'package:eltohamyecommercedeliveryapp/core/class/crud.dart';
import 'package:eltohamyecommercedeliveryapp/core/class/statusrequest.dart';
import 'package:eltohamyecommercedeliveryapp/core/function/alertexitapp.dart';
import 'package:eltohamyecommercedeliveryapp/core/function/handlingdata.dart';
import 'package:eltohamyecommercedeliveryapp/data/datasource/remote/orderData.dart';
import 'package:eltohamyecommercedeliveryapp/data/model/ordersModel.dart';
import 'package:get/get.dart';

abstract class ArchivedOrderController extends GetxController {}

class ArchivedOrderControllerImp extends ArchivedOrderController {
  List<OrdersModel> archivedOrdersList = [];
  OrdersData ordersData = OrdersData(crud: Crud());
  late StatusRequest statusRequest;


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
