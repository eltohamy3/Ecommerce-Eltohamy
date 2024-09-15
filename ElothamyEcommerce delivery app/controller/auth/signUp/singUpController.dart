import 'package:eltohamyecommercedeliveryapp/core/class/crud.dart';
import 'package:eltohamyecommercedeliveryapp/core/class/statusrequest.dart';
import 'package:eltohamyecommercedeliveryapp/core/constant/routename.dart';
import 'package:eltohamyecommercedeliveryapp/core/function/alertexitapp.dart';
import 'package:eltohamyecommercedeliveryapp/core/function/handlingdata.dart';
import 'package:eltohamyecommercedeliveryapp/core/function/validation.dart';
import 'package:eltohamyecommercedeliveryapp/data/datasource/remote/auth/signUpData.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();
  GoTOSignIN();
  GoTOSignCheckEmail();
}

class SignUpControllerImb extends SignUpController {
  // controllers
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController usernamecontroller;
  late TextEditingController repeatPasswordController;
  late TextEditingController Phonecontroller;
  late GlobalKey<FormState> singUpformKey;

  // GetDat
  late StatusRequest statusRequest;
  late SignUpData signUpData;

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
  signUp() async {
    if (singUpformKey.currentState!.validate()) {
      signUpData = SignUpData(crud: Crud());
      statusRequest = StatusRequest.loading;
      update();

      var responce = await signUpData.POstSignUpData();
      print("========================responce:::: $responce");
      statusRequest = handleData(responce);

      if (statusRequest == StatusRequest.success) {
        if (responce['status'] == 'Success') {
          GoTOSignCheckEmail();

          // data.addAll(responce['data']);
        } else {
          showErrorMassage(Get.context!, "SignUP", responce['message']);
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
    singUpformKey = GlobalKey();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    repeatPasswordController = TextEditingController();
    usernamecontroller = TextEditingController();
    Phonecontroller = TextEditingController();

    super.onInit();
  }

  @override
  GoTOSignCheckEmail() {
    Get.offNamed(AppRoute.signUPCheckEmail  , parameters: {
      "email":emailController.text
    });
  }

  @override
  GoTOSignIN() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    usernamecontroller.dispose();
    Phonecontroller.dispose();
    repeatPasswordController.dispose();
    super.onClose();
  }
}
