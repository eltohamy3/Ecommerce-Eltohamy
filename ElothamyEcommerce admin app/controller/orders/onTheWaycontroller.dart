import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/core/class/statusrequest.dart';
import 'package:eltohamyecommerceadminapp/core/function/handlingdata.dart';
import 'package:eltohamyecommerceadminapp/data/datasource/remote/orderData.dart';
import 'package:eltohamyecommerceadminapp/data/model/ontheWayOrderModel.dart';
import 'package:get/get.dart';

abstract class OnTheWayController extends GetxController {}

class OnTheWayControllerImp extends OnTheWayController {
  List<OnTheWayOrderModel> onTheWayOrdersList = [];
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
            onTheWayOrdersList.add(OnTheWayOrderModel.fromJson(element));
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
