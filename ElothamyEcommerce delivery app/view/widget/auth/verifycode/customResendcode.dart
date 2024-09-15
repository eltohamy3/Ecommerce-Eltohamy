
import 'package:eltohamyecommercedeliveryapp/controller/auth/Forgetpassword/verifycodecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class CustomResendCode extends StatelessWidget {
  const CustomResendCode({super.key});
  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller =  Get.find();
    return InkWell(
        child: const Text(
          'Resend Code',
          textAlign: TextAlign.end,
          style: TextStyle(decoration: TextDecoration.underline),
        ),
        onTap: ()=>controller.resendcode());
  }
}
