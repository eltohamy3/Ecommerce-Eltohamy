import 'package:eltohamyecommerceadminapp/controller/auth/signInController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomForgetPasswordText extends StatelessWidget {
  const CustomForgetPasswordText({super.key});
  @override
  Widget build(BuildContext context) {
     SignInControllerImp controller = Get.put(SignInControllerImp()); 
    return InkWell(
        child: const Text(
          'Forget Password',
          textAlign: TextAlign.end,
          style: TextStyle(decoration: TextDecoration.underline),
        ),
        onTap: () => controller.GoToFogetPassword());
  }
}
