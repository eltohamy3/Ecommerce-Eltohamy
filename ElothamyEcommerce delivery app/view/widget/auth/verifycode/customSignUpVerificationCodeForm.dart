import 'package:eltohamyecommercedeliveryapp/controller/auth/Forgetpassword/verifycodecontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomSignUpVerificationCodeForm extends StatelessWidget {
  const CustomSignUpVerificationCodeForm({super.key});

  @override
  Widget build(BuildContext context) {
    
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    return  Column(
          children: [
            OtpTextField(
              fieldWidth: 50,
              borderRadius: BorderRadius.circular(20),
              numberOfFields: 5,
              borderColor: Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) =>controller.setverificaioncode(verificationCode)
               // end onSubmit
            ),
          ],
        );
  }
}
