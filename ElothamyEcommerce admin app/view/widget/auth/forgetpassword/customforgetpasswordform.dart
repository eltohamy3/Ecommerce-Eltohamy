import 'package:eltohamyecommerceadminapp/controller/auth/Forgetpassword/forgetpasswordcontroller.dart';
import 'package:eltohamyecommerceadminapp/core/function/validation.dart';
import 'package:eltohamyecommerceadminapp/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomForgetPasswordForm extends StatelessWidget {
  const CustomForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
     ForgetPasswordControllerImp controller = Get.find(); 
    return Form(
       key: controller.ForgetPasswordformkey,
        child: Column(
      children: [
        CustomTextFormAuth(
          mycontroller: controller.emailcontroller,
          hintText: "Enter Your Email",
          labelText: "Email",
          icondata: const Icon(Icons.email_outlined),
          validator: (email) => Emailvalidate(email),
        ),

      ],
    ));
  }
}
