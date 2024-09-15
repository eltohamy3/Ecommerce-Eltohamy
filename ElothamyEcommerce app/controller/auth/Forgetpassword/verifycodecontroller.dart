import 'package:eltohmayecommerceapp/core/class/crud.dart';
import 'package:eltohmayecommerceapp/core/class/statusrequest.dart';
import 'package:eltohmayecommerceapp/core/constant/linkApi.dart';
import 'package:eltohmayecommerceapp/core/constant/routename.dart';
import 'package:eltohmayecommerceapp/core/function/alertexitapp.dart';
import 'package:eltohmayecommerceapp/core/function/handlingdata.dart';
import 'package:eltohmayecommerceapp/core/function/validation.dart';
import 'package:eltohmayecommerceapp/data/datasource/remote/auth/resendcode.dart';
import 'package:eltohmayecommerceapp/data/datasource/remote/auth/verificaitonData.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  GoToresetPassword();
  GoTOSuccessSignUp();
  SignUpCodeVerificaiotn();
  CodeVerify();
  resendcode();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  String? verificaioncode;
  String? email;

  // GetDat
  late StatusRequest statusRequest;
  late VerificaitonData verificaitonData;
  late ResendCodeData resendCodeData;

  @override
  resendcode() async {
    statusRequest = StatusRequest.loading;
    update();

    resendCodeData = ResendCodeData(crud: Crud());
    var responce = await resendCodeData.PostResendCodeData(email!);
    print("==========respocne :: $responce");
    statusRequest = handleData(responce);

    if (statusRequest == StatusRequest.success) {
      if (responce['status'] == 'Success') {
        showSuccessMassage(Get.context!, "Resend Code",
            'Code verification has been successfully resnd Check your Email');
        // GoTOSuccessSignUp();
        // data.addAll(responce['data']);
      } else {
        showErrorMassage(Get.context!, "Email ", responce['message']);
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  GoToresetPassword() {

    Get.offNamed(AppRoute.resetPassword, parameters: {"email": email!});
  }

  @override
  SignUpCodeVerificaiotn() async {
    print("================${verificaioncode}====================");

    if (verificaioncode != null) {

      statusRequest = StatusRequest.loading;
      update();
      verificaitonData = VerificaitonData(crud: Crud());
      var responce = await verificaitonData.PostVerificaitonData(  email! ,verificaioncode! , LinkAPI.Verificaioncode );
      print("==========respocne :: $responce");
      statusRequest = handleData(responce);

      if (statusRequest == StatusRequest.success) {
        if (responce['status'] == 'Success') {
          GoTOSuccessSignUp();
          // data.addAll(responce['data']);
        } else {
          showErrorMassage(
              Get.context!, "Verificaition code", responce['message']);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  GoTOSuccessSignUp() {
    Get.offAllNamed(AppRoute.successSignUp);
  }

  @override
  CodeVerify() async {
    print("================${verificaioncode}====================");

    if (verificaioncode != null) {
      statusRequest = StatusRequest.loading;
      update();
      verificaitonData = VerificaitonData(crud: Crud());
      var responce = await verificaitonData.PostVerificaitonData(  email! ,verificaioncode! , LinkAPI.resetPasswordVerificationCode );
      print("==========respocne :: $responce");
      statusRequest = handleData(responce);
      if (statusRequest == StatusRequest.success) {
        if (responce['status'] == 'Success') {
              GoToresetPassword();
        } else {
          showErrorMassage(
              Get.context!, "Verificaition code", responce['message']);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
    
  }

  setverificaioncode(String? code) {
    verificaioncode = code;
  }

  String? CodeVerificaitonValidate(String? code) {
    if (checkNullandEmpty(code)) {
      return "Enter A Varification Code to Continue";
    }
    return null;
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.success;
    email = Get.parameters['email'];

    super.onInit();
  }

  @override
  void onClose() {}
}
