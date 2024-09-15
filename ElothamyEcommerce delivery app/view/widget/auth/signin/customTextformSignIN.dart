import 'package:eltohamyecommercedeliveryapp/controller/auth/signInController.dart';
import 'package:eltohamyecommercedeliveryapp/core/function/validation.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomSignInForm extends StatelessWidget {
  const CustomSignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    SignInControllerImp controller = Get.find();
    return Form(
        key: controller.singInformKey,
        child: Column(
          children: [
            CustomTextFormAuth(
              hintText: "Enter Your Email",
              labelText: "Email",
              icondata: const Icon(Icons.email_outlined),
              mycontroller: controller.emailController,
              validator: (email) => Emailvalidate(email),
            ),
            GetBuilder<SignInControllerImp>(
              builder: (controller) => CustomTextFormAuth(
                  hintText: "Enter Your Password",
                  labelText: "Password",
                  obscureText: controller.showpassword,
                  onTap: () => controller.changShowPassword(),
                  icondata: Icon(controller.showpassword
                      ? Icons.visibility
                      : Icons.visibility_off),
                  mycontroller: controller.passwordController,
                  validator: (password) =>
                      controller.passwordSignInValidate(password)),
            )
          ],
        ));
  }
}
