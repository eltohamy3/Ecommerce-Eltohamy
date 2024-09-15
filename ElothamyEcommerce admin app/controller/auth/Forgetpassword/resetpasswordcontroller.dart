import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/core/class/statusrequest.dart';
import 'package:eltohamyecommerceadminapp/core/constant/routename.dart';
import 'package:eltohamyecommerceadminapp/core/function/alertexitapp.dart';
import 'package:eltohamyecommerceadminapp/core/function/handlingdata.dart';
import 'package:eltohamyecommerceadminapp/core/function/validation.dart';
import 'package:eltohamyecommerceadminapp/data/datasource/remote/auth/resetPasswordData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  GoTosuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController passwordController;
  late TextEditingController repeatPasswordController;
  late GlobalKey<FormState> resetPasswordKey;

  String? email;

  late ResetPasswordData resetPasswordData;
  late StatusRequest statusRequest;

  bool showpassword = true;
  bool showRepetePassword = true;
  // show passwordFunction
  changShowPassword() {
    showpassword = !showpassword;
    update();
  }

  changShowRepetPassword() {
    showRepetePassword = !showRepetePassword;
    update();
  }
  @override
  resetPassword() async {
    if (resetPasswordKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var responce = await resetPasswordData.PostResetPasswordData(
          email!, passwordController.text);
      statusRequest = handleData(responce);
      if (statusRequest == StatusRequest.success) {
        if (responce['status'] == 'Success') {
          GoTosuccessResetPassword();
        } else {
          showErrorMassage(Get.context!, "ResetPassword ", responce['message']);
          statusRequest = StatusRequest.failure;
        }
      } else {
        showErrorMassage(Get.context!, "ResetPassword ", "$responce");
      }
      update();
    }
  }

  String? repatepasswordVlaidate(String? password) {
    String? firstpassword = passwordSignUpValidate(passwordController.text);

    if (firstpassword != null) return null;
    if (checkNullandEmpty(password)) {
      return 'cannot be empty';
    }
    if (passwordController.text != repeatPasswordController.text) {
      return "password doesnt match ";
    }
    return null;
  }

  @override
  GoTosuccessResetPassword() {
    Get.offAllNamed(AppRoute.successResetPassword);
  }

  @override
  void onInit() {
    email = Get.parameters['email'];
    statusRequest = StatusRequest.success;
    resetPasswordData = ResetPasswordData(crud: Crud());
    passwordController = TextEditingController();
    repeatPasswordController = TextEditingController();
    resetPasswordKey = GlobalKey();
    super.onInit();
  }

  @override
  void onClose() {
    passwordController.dispose();
    repeatPasswordController.dispose();
  }
}
