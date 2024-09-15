import 'package:eltohamyecommerceadminapp/controller/auth/Forgetpassword/verifycodecontroller.dart';
import 'package:eltohamyecommerceadminapp/core/class/handlingDataView.dart';
import 'package:eltohamyecommerceadminapp/core/constant/mycolors.dart';
import 'package:eltohamyecommerceadminapp/view/widget/auth/customButtonAuth.dart';
import 'package:eltohamyecommerceadminapp/view/widget/auth/customTextTitleauth.dart';
import 'package:eltohamyecommerceadminapp/view/widget/auth/customTextsubtitleAuth.dart';
import 'package:eltohamyecommerceadminapp/view/widget/auth/custtomAuthAppbar.dart';
import 'package:eltohamyecommerceadminapp/view/widget/auth/verifycode/customResendcode.dart';
import 'package:eltohamyecommerceadminapp/view/widget/auth/verifycode/customVerificaitonCodeForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUpVerificationCode extends StatelessWidget {
  const SignUpVerificationCode({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerImp());

    return Scaffold(
        backgroundColor: AppColor.backgroundcolor,
        appBar: const AuthAppBar(
          AppbarTitle: 'verificaiton Code',
        ),
        body: GetBuilder<VerifyCodeControllerImp>(
          builder: (controller) => Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: HanddlingDataViewRequest(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      const CustomTextTitleAuth(
                          texttitle: "Check verificaiton Code"),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomTextsubtitleAuth(
                        subtitle:
                            'Enter your code to to continue to  Create your Accout ',
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomVerificaitonCodeForm(),
                      const SizedBox(
                        height: 25,
                      ),
                      const CustomResendCode(),
                      CustomButtonAuth(
                        btnText: "Check verificaiton Code",
                        onPressed: () => controller.SignUpCodeVerificaiotn(),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),)
          ),
        ));
  }
}
