import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/core/class/statusrequest.dart';
import 'package:eltohamyecommerceadminapp/core/function/handlingdata.dart';
import 'package:eltohamyecommerceadminapp/data/datasource/remote/userData.dart';
import 'package:eltohamyecommerceadminapp/data/model/ontheWayOrderModel.dart';
import 'package:eltohamyecommerceadminapp/data/model/userModel.dart';
import 'package:get/get.dart';

abstract class UsersOrdersController extends GetxController {
  GetArchiveData();
}

class UsersOrdersControllerImp extends UsersOrdersController {
  late UserModel userModel;
  List<OnTheWayOrderModel> archivedOrdersList = [];
  UserData userData = UserData(crud: Crud());
  late StatusRequest statusRequest;

  @override
  GetArchiveData() async {
    archivedOrdersList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var responce = await userData.PostUserOrders(userModel.userId!);
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
    userModel = Get.arguments['userModel'];
    await GetArchiveData();
    super.onInit();
  }
}
