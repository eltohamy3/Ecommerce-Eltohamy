import 'package:eltohmayecommerceapp/core/class/crud.dart';
import 'package:eltohmayecommerceapp/core/class/statusrequest.dart';
import 'package:eltohmayecommerceapp/core/constant/routename.dart';
import 'package:eltohmayecommerceapp/core/function/alertexitapp.dart';
import 'package:eltohmayecommerceapp/core/function/handlingdata.dart';
import 'package:eltohmayecommerceapp/data/datasource/remote/auth/checkEmailForgetpasswordData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
  GoToVerfiyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController emailcontroller;
  late GlobalKey<FormState> ForgetPasswordformkey;
  late CheckEmailData checkEmailData;
  late StatusRequest statusRequest;

  @override
  GoToVerfiyCode() {
    Get.offNamed(AppRoute.verfiycode,
        parameters: {"email": emailcontroller.text});
  }

  @override
  checkEmail() async {
    if (ForgetPasswordformkey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var responce =
          await checkEmailData.PostCheckEmailData(emailcontroller.text);
      statusRequest = handleData(responce);
      if (statusRequest == StatusRequest.success) {
        if (responce['status'] == 'Success') {
          GoToVerfiyCode();
        } else {
          showErrorMassage(Get.context!, "Email ", responce['message']);
          statusRequest = StatusRequest.failure;
        }
      }else
      {
          showErrorMassage(Get.context!, "Email ", "$responce" );
      }
      update();
    }
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.success;
    emailcontroller = TextEditingController();
    checkEmailData = CheckEmailData(crud: Crud());
    ForgetPasswordformkey = GlobalKey();
    super.onInit();
  }

  @override
  void onClose() {
    emailcontroller.dispose();
  }
}
