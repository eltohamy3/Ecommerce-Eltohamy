import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/core/class/statusrequest.dart';
import 'package:eltohamyecommerceadminapp/core/constant/routename.dart';
import 'package:eltohamyecommerceadminapp/core/function/alertexitapp.dart';
import 'package:eltohamyecommerceadminapp/core/function/handlingdata.dart';
import 'package:eltohamyecommerceadminapp/data/datasource/remote/deliveryData.dart';
import 'package:eltohamyecommerceadminapp/data/model/deliveryModel.dart';
import 'package:get/get.dart';

abstract class DeliveryViewController extends GetxController {
  GetData();
  DeleteDeliveryButton(int userid);
  DeleteDelivery(int userId);
  GoToDeliveryOrders(DeliveryModel deliveryModel);
}

class DeliveryViewControllerImp extends DeliveryViewController {
  DeliveryData deliveryData = DeliveryData(crud: Crud());
  List<DeliveryModel> DeliveryViewList = [];
  late StatusRequest statusRequest;
  
  @override
  GetData() async {
    DeliveryViewList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var responce = await deliveryData.PostDeliveryView();
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in Items view :  ${responce}');
      if (responce['status'] == 'Success') {
        if (responce['data'] != null) {
          responce['data'].forEach((element) {
            DeliveryViewList.add(DeliveryModel.fromJson(element));
          });
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  @override
  DeleteDeliveryButton(int deliveryId ) {
    showHazardMassage(
        Get.context!, "Delivery Delete", "Are you sure to Delete This Delivery Man",
        () async {
      await DeleteDelivery(deliveryId);
    }, "Ok");
  }
  @override
  DeleteDelivery(int deliveryId) async {
    statusRequest = StatusRequest.loading;
    update();
    var responce = await deliveryData.postDeleteDelivery(deliveryId);
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in Delet Delivery view :  ${responce}');
      if (responce['status'] == 'Success') {
        showSuccessMassageWithOk(
          Get.context!,
          "Delete Delivery",
          "Delivery Has been Deleted successfully",
          () {},
          "Ok",
          (p0) async {
            DeliveryViewList.removeWhere((element) => element.deliveryId == deliveryId);
            update();
          },
        );
      } else {
        showErrorMassage(Get.context!, "Delete Delivery",
            "Server Error while Deleting the Delivery");
        statusRequest = StatusRequest.success;
      }
    } else {
      showErrorMassage(
          Get.context!, "Delete Delivery", " Error while Deleting the User");
      statusRequest = StatusRequest.success;
    }
    update();
  }

  @override
  void onInit() async {
    statusRequest = StatusRequest.loading;
    update();
    await GetData();
    super.onInit();
  }

  @override
  GoToDeliveryOrders(DeliveryModel deliveryModel) {
    Get.toNamed(AppRoute.deliveryOrders, 
    arguments: {
      "deliveryModel": deliveryModel
    }
    );
  }
}
