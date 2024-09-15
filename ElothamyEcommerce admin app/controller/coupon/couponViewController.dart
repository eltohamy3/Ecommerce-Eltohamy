import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/core/class/statusrequest.dart';
import 'package:eltohamyecommerceadminapp/core/constant/routename.dart';
import 'package:eltohamyecommerceadminapp/core/function/alertexitapp.dart';
import 'package:eltohamyecommerceadminapp/core/function/handlingdata.dart';
import 'package:eltohamyecommerceadminapp/data/datasource/remote/couponData.dart';
import 'package:eltohamyecommerceadminapp/data/model/couponModel.dart';
import 'package:get/get.dart';

abstract class CouponViewController extends GetxController {
  GetData();
  DeleteCouponButton(int userid);
  DeleteCoupon(int userId);
  GoToCouponEdit(CouponModel couponModel);
}

class CouponViewControllerImp extends CouponViewController {
  CouponData couponData = CouponData(crud: Crud());
  List<CouponModel> CouponViewList = [];
  late StatusRequest statusRequest;

  @override
  GetData() async {
    CouponViewList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var responce = await couponData.PostCouponView();
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in coupon view :  ${responce}');
      if (responce['status'] == 'Success') {
        if (responce['data'] != null) {
          responce['data'].forEach((element) {
            CouponViewList.add(CouponModel.fromJson(element));
          });
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  DeleteCouponButton(int CouponId) {
    showHazardMassage(
        Get.context!, "Coupon Delete", "Are you sure to Delete This Coupon Man",
        () async {
      await DeleteCoupon(CouponId);
    }, "Ok");
  }

  @override
  DeleteCoupon(int CouponId) async {
    statusRequest = StatusRequest.loading;
    update();
    var responce = await couponData.postDeleteCoupon(CouponId);
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in Delet Coupon view :  ${responce}');
      if (responce['status'] == 'Success') {
        showSuccessMassageWithOk(
          Get.context!,
          "Delete Coupon",
          "Coupon Has been Deleted successfully",
          () {},
          "Ok",
          (p0) async {
            CouponViewList.removeWhere(
                (element) => element.couponId == CouponId);
            update();
          },
        );
      } else {
        showErrorMassage(Get.context!, "Delete Coupon",
            "Server Error while Deleting the Coupon");
        statusRequest = StatusRequest.success;
      }
    } else {
      showErrorMassage(
          Get.context!, "Delete Coupon", " Error while Deleting the User");
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
  GoToCouponEdit(CouponModel couponModel) {
    Get.toNamed(AppRoute.couponEdit,
    arguments: {
      "couponModel": couponModel
    }
    );
  }
}
