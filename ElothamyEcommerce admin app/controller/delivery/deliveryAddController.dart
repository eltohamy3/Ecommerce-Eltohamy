import 'package:eltohamyecommerceadminapp/controller/delivery/deliveryViewController.dart';
import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/core/class/statusrequest.dart';
import 'package:eltohamyecommerceadminapp/core/function/alertexitapp.dart';
import 'package:eltohamyecommerceadminapp/core/function/handlingdata.dart';
import 'package:eltohamyecommerceadminapp/core/function/validation.dart';
import 'package:eltohamyecommerceadminapp/data/datasource/remote/deliveryData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class DeliveryAddController extends GetxController {
  AddDelivery();
}

class DeliveryAddControllerImp extends DeliveryAddController {
  // controllers
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController deliveryNameController;
  late TextEditingController repeatPasswordController;
  late TextEditingController Phonecontroller;
  late GlobalKey<FormState> deliveryAddFOrmKey;

  // GetDat
  late StatusRequest statusRequest;
  DeliveryData deliveryData = DeliveryData(crud: Crud());

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
  AddDelivery() async {
    if (deliveryAddFOrmKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var responce = await deliveryData.PostDeliveryAdd({
        "delivery_email": emailController.text,
        "delivery_phoneNumber": Phonecontroller.text,
        "delivery_name": deliveryNameController.text,
        "delivery_password": passwordController.text,
      });
      print("========================responce:::: $responce");
      statusRequest = handleData(responce);

      if (statusRequest == StatusRequest.success) {
        if (responce['status'] == 'Success') {
          DeliveryViewControllerImp deliveryViewControllerImp = Get.find();
          Get.back();
          showSuccessMassage(
              Get.context!, "Add Delivery", "Add Delivery Done successfully");
          await deliveryViewControllerImp.GetData();

        } else {
          showErrorMassage(Get.context!, "add Delivery", responce['message']);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  String? usernameValidate(String? username) {
    if (checkNullandEmpty(username)) {
      return "username Cant be empty";
    }
    // if (GetUtils.isUsername(username!)) {
    //   return "Not a Valid username";
    // }
    if (username!.length < 4) {
      return 'username must be at least 4 characters long';
    }
    return null;
  }

  String? phonenumberValidate(String? phoneNumber) {
    if (checkNullandEmpty(phoneNumber)) {
      return "phoneNumber Cant be empty";
    }
    if (!GetUtils.isPhoneNumber(phoneNumber!)) {
      return "Not a Valid phoneNumber";
    }
    // if (phoneNumber.length < 3) {
    //   return 'PhoneNumber must be at least 3 number long';
    // }
    return null;
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
  void onInit() {
    statusRequest = StatusRequest.success;
    deliveryAddFOrmKey = GlobalKey();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    repeatPasswordController = TextEditingController();
    deliveryNameController = TextEditingController();
    Phonecontroller = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    deliveryNameController.dispose();
    Phonecontroller.dispose();
    repeatPasswordController.dispose();
    super.onClose();
  }
}
