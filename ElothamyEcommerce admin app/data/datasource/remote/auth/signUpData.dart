import 'package:eltohamyecommerceadminapp/controller/auth/signUp/singUpController.dart';
import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/core/constant/linkApi.dart';
import 'package:get/get.dart';

// class to get the data from database
class SignUpData {
  Crud crud;
  // Map usernameData;
  SignUpData({
    required this.crud,
  });
  // dealing with database //   SignUpData to deal with data

  POstSignUpData() async {
    SignUpControllerImb controller = Get.put(SignUpControllerImb());
    var responce = await crud.PostGetDataRequest(LinkAPI.signUp, {
      "admin_password": controller.passwordController.text,
      "admin_name": controller.usernamecontroller.text,
      "admin_phoneNumber": controller.Phonecontroller.text,
      "admin_email": controller.emailController.text,
    });
    print(responce);
    return responce.fold((l) => l, (r) => r);
  }
}
