import 'package:eltohamyecommercedeliveryapp/controller/auth/signUp/singUpController.dart';
import 'package:eltohamyecommercedeliveryapp/core/class/crud.dart';
import 'package:eltohamyecommercedeliveryapp/core/constant/linkApi.dart';
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
      "delivery_password": controller.passwordController.text,
      "delivery_name": controller.usernamecontroller.text,
      "delivery_phoneNumber": controller.Phonecontroller.text,
      "delivery_email": controller.emailController.text,
    });
    print(responce);
    return responce.fold((l) => l, (r) => r);
  }
}
