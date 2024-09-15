import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/core/class/statusrequest.dart';
import 'package:eltohamyecommerceadminapp/core/function/handlingdata.dart';
import 'package:eltohamyecommerceadminapp/data/datasource/remote/deliveryData.dart';
import 'package:eltohamyecommerceadminapp/data/model/deliveryModel.dart';
import 'package:eltohamyecommerceadminapp/data/model/ontheWayOrderModel.dart';
import 'package:get/get.dart';

abstract class DeliveryOrdersController extends GetxController {
  GetArchiveData();
}

class DeliveryOrdersControllerImp extends DeliveryOrdersController {
  late DeliveryModel deliveryModel;
  List<OnTheWayOrderModel> archivedOrdersList = [];
  DeliveryData deliveryData = DeliveryData(crud: Crud());
  late StatusRequest statusRequest;

  @override
  GetArchiveData() async {
    archivedOrdersList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var responce = await deliveryData.PostDeliveryOrders(deliveryModel.deliveryId!);
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in Delvery orders :  ${responce}');
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
    deliveryModel = Get.arguments['deliveryModel'];
    await GetArchiveData();
    super.onInit();
  }
}
