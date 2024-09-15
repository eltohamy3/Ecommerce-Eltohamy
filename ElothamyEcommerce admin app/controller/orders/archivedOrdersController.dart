import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/core/class/statusrequest.dart';
import 'package:eltohamyecommerceadminapp/core/function/handlingdata.dart';
import 'package:eltohamyecommerceadminapp/data/datasource/remote/orderData.dart';
import 'package:eltohamyecommerceadminapp/data/model/ontheWayOrderModel.dart';
import 'package:get/get.dart';

abstract class ArchivedOrderController extends GetxController {}

class ArchivedOrderControllerImp extends ArchivedOrderController {
  List<OnTheWayOrderModel> archivedOrdersList = [];
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
            archivedOrdersList.add(OnTheWayOrderModel.fromJson(element));
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
