import 'package:eltohmayecommerceapp/core/class/crud.dart';
import 'package:eltohmayecommerceapp/core/class/statusrequest.dart';
import 'package:eltohmayecommerceapp/core/constant/routename.dart';
import 'package:eltohmayecommerceapp/core/function/alertexitapp.dart';
import 'package:eltohmayecommerceapp/core/function/handlingdata.dart';
import 'package:eltohmayecommerceapp/core/function/validation.dart';
import 'package:eltohmayecommerceapp/core/services/services.dart';
import 'package:eltohmayecommerceapp/data/datasource/remote/auth/resendcode.dart';
import 'package:eltohmayecommerceapp/data/datasource/remote/auth/signInData.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class SignInController extends GetxController {
  void login();
  void GoToSignUP();
  void GoToFogetPassword();
}

class SignInControllerImp extends SignInController {
  // text field controller
   TextEditingController emailController= TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> singInformKey = GlobalKey();
  MyServices myServices = Get.find();

  // GetDat
  late StatusRequest statusRequest;
  late SingInData singInData;
  ResendCodeData resendCodeData = ResendCodeData(crud: Crud());

  bool showpassword = true;

  changShowPassword() {
    showpassword = !showpassword;
    update();
  }

  String? passwordSignInValidate(String? password) {
    if (checkNullandEmpty(password)) {
      return 'Password cannot be empty';
    }
    return null;
  }

  @override
  void GoToSignUP() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void GoToFogetPassword() {
    Get.toNamed(AppRoute.Forgetpassword);
  }

  @override
  void login() async {
    print('in the login');
    if (singInformKey.currentState!.validate()) {
      singInData = SingInData(crud: Crud());
      statusRequest = StatusRequest.loading;
      update();
      var responce = await singInData.POstSingInData(
          emailController.text, passwordController.text);
      print("========================responce:::: $responce");
      statusRequest = handleData(responce);
      if (statusRequest == StatusRequest.success) {
        if (responce['status'] == 'Success') {
          print(responce['data']);
          myServices.userinfo = responce['data'];
          print(
              " ==========MYSErveces user info ${myServices.userinfo}============");
          await myServices.sharedPreferences
              .setString("id", responce['data']['user_id'].toString());
          myServices.sharedPreferences
              .setString("email", responce['data']['email']);
          myServices.sharedPreferences
              .setString("phoneNumber", responce['data']['phoneNumber']);
          myServices.sharedPreferences
              .setString("username", responce['data']['username']);
          myServices.sharedPreferences.setString("login", "true");
          myServices.sharedPreferences.setString("step", "2");
          Get.offNamed(AppRoute.home);
          // data.addAll(responce['data']);
        } else if (responce['message'] == 'email should be verifyed') {
          showErrorMassageWithOk(Get.context!, "SignUP", responce['message'],
              () async {
            var responce =
                await resendCodeData.PostResendCodeData(emailController.text);
            Get.toNamed(AppRoute.signUpVerificationCode,
                parameters: {'email': emailController.text});
          }, "Go To verify Your Account");
        } else {
          showErrorMassage(Get.context!, "SignUP", responce['message']);
          statusRequest = StatusRequest.success;
        }
      } else {
        showErrorMassage(
            Get.context!, "SignUP", 'server error while trying to login');
        statusRequest = StatusRequest.success;
      }
      update();
    }
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      String? token = value;
      print(token);
    });
    print('========================ON Initial SIngInController');
    statusRequest = StatusRequest.success;
    super.onInit();
  }

  @override
  void onClose() {
    // emailController.dispose();
    // passwordController.dispose();
    super.onClose();
  }
}
