import 'package:eltohmayecommerceapp/controller/auth/Forgetpassword/resetpasswordcontroller.dart';
import 'package:eltohmayecommerceapp/core/function/validation.dart';
import 'package:eltohmayecommerceapp/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomResetPasswordForm extends StatelessWidget {
  const CustomResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller = Get.find();
    return Form(
        key: controller.resetPasswordKey,
        child: Column(
          children: [
            GetBuilder<ResetPasswordControllerImp>(
              builder: (controller) => CustomTextFormAuth(
                  hintText: "Enter Your New Password",
                  labelText: "Password",
                  obscureText: controller.showpassword,
                  icondata: Icon(controller.showpassword
                      ? Icons.visibility
                      : Icons.visibility_off),
                  mycontroller: controller.passwordController,
                  onTap: () => controller.changShowPassword(),
                  validator: (password) => passwordSignUpValidate(password)),
            ),
            GetBuilder<ResetPasswordControllerImp>(
              builder: (controller) => CustomTextFormAuth(
                  onTap: () => controller.changShowRepetPassword(),
                  obscureText: controller.showRepetePassword,
                  hintText: "Repete Your New Password",
                  labelText: "Password Repete",
                  icondata: Icon(controller.showRepetePassword
                      ? Icons.visibility
                      : Icons.visibility_off),
                  mycontroller: controller.repeatPasswordController,
                  validator: (repPassword) =>
                      controller.repatepasswordVlaidate(repPassword)),
            )
          ],
        ));
  }
}
