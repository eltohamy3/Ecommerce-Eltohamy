import 'package:eltohmayecommerceapp/controller/auth/signUp/singUpController.dart';
import 'package:eltohmayecommerceapp/core/class/crud.dart';
import 'package:eltohmayecommerceapp/core/constant/linkApi.dart';
import 'package:get/get.dart';

// class to get the data from database
class SignUpData {
  Crud crud;
  // Map usernameData;
  SignUpData({required this.crud, });
  // dealing with database //   SignUpData to deal with data

  POstSignUpData() async {
   SignUpControllerImb controller =Get.put(SignUpControllerImb());
    var responce = await crud.PostGetDataRequest(LinkAPI.signUp,{
      "password": controller.passwordController.text ,
      "username": controller.usernamecontroller.text ,
      "phoneNumber": controller.Phonecontroller.text ,
      "email": controller.emailController.text ,
    } );
    return responce.fold((l) => l, (r) => r);
  }
}
