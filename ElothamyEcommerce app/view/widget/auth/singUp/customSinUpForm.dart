import 'package:eltohmayecommerceapp/controller/auth/signUp/singUpController.dart';
import 'package:eltohmayecommerceapp/core/function/validation.dart';
import 'package:eltohmayecommerceapp/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomSignUPForm extends StatelessWidget {
  const CustomSignUPForm({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImb controller = Get.find();

    return Form(
        key: controller.singUpformKey,
        child: Column(
          children: [
            CustomTextFormAuth(
                hintText: "Enter Your Username",
                labelText: "Username",
                icondata: const Icon(Icons.person_outline),
                mycontroller: controller.usernamecontroller,
                validator: (username) => controller.usernameValidate(username)),
            CustomTextFormAuth(
              hintText: "Enter Your Email",
              labelText: "Email",
              icondata: const Icon(Icons.email_outlined),
              mycontroller: controller.emailController,
              validator: (email) => Emailvalidate(email),
            ),
            CustomTextFormAuth(
                hintText: "Enter Your Phone",
                labelText: "Phone",
                isnumber: true,
                icondata: const Icon(Icons.phone_outlined),
                mycontroller: controller.Phonecontroller,
                validator: (phonenumber) =>
                    controller.phonenumberValidate(phonenumber)),
            GetBuilder<SignUpControllerImb>(
              builder: (controller) => CustomTextFormAuth(
                  hintText: "Enter Your Password",
                  labelText: "Password",
                  obscureText: controller.showpassword,
                  icondata: Icon(controller.showpassword
                      ? Icons.visibility
                      : Icons.visibility_off),
                  mycontroller: controller.passwordController,
                  onTap: () => controller.changShowPassword(),
                  validator: (password) => passwordSignUpValidate(password)),
            ),
            GetBuilder<SignUpControllerImb>(
              builder: (controller) => CustomTextFormAuth(
                  onTap: () => controller.changShowRepetPassword(),
                  obscureText: controller.showRepetePassword,
                  hintText: "Repete Your Password",
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
