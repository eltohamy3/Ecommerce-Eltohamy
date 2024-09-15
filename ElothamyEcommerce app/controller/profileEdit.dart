import 'package:eltohmayecommerceapp/core/class/crud.dart';
import 'package:eltohmayecommerceapp/core/class/statusrequest.dart';
import 'package:eltohmayecommerceapp/core/function/alertexitapp.dart';
import 'package:eltohmayecommerceapp/core/function/handlingdata.dart';
import 'package:eltohmayecommerceapp/core/function/validation.dart';
import 'package:eltohmayecommerceapp/core/services/services.dart';
import 'package:eltohmayecommerceapp/data/datasource/remote/userData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileEditController extends GetxController {}

class ProfileEditControllerImp extends ProfileEditController {
  MyServices myServices = Get.find();
  late TextEditingController usernamecontroller;
  late TextEditingController phoneNumberController;
  late TextEditingController emailController;
  late String userId;
  String? email;
  GlobalKey<FormState> EditProfileKey = GlobalKey();
  late StatusRequest statusRequest;
  UserData userData = UserData(crud: Crud());
  EditProfile() async {
    if (EditProfileKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var responce = await userData.PostEditProfile(
          usernamecontroller.text, phoneNumberController.text, userId);
      statusRequest = handleData(responce);
      if (statusRequest == StatusRequest.success) {
        if (responce['status'] == 'Success') {
          showSuccessMassage(
              Get.context!, "Edit Profile", "Edit Profile Done Sucessfully");
          myServices.sharedPreferences
              .setString("phoneNumber", phoneNumberController.text);
          myServices.sharedPreferences
              .setString("username", usernamecontroller.text);
        } else {
          showErrorMassage(Get.context!, "Update Profile", responce['message']);
        }
      } else {
        showErrorMassage(Get.context!, "Update Profile", responce['message']);
        statusRequest = StatusRequest.success;
      }
      update();
    }
  }

  InitalData() async {
    usernamecontroller = TextEditingController();
    phoneNumberController = TextEditingController();
    emailController = TextEditingController();
    email = await myServices.sharedPreferences.getString('email');
        Future.delayed(Duration(seconds: 2));

    print("$email");
    usernamecontroller.text =
        await myServices.sharedPreferences.getString("username")!;
    phoneNumberController.text =
        await myServices.sharedPreferences.getString('phoneNumber')!;
    emailController.text = email!;
    userId = await myServices.sharedPreferences.getString('id')!;
        statusRequest = StatusRequest.success;
    update();

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

  @override
  void onInit() {
    statusRequest = StatusRequest.loading;
    update();
    InitalData();
    super.onInit();
  }
}
