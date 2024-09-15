import 'package:eltohamyecommerceadminapp/controller/auth/signUp/checkemailcontroller.dart';
import 'package:eltohamyecommerceadminapp/core/constant/mycolors.dart';
import 'package:eltohamyecommerceadminapp/view/widget/auth/customButtonAuth.dart';
import 'package:eltohamyecommerceadminapp/view/widget/auth/customTextTitleauth.dart';
import 'package:eltohamyecommerceadminapp/view/widget/auth/customTextsubtitleAuth.dart';
import 'package:eltohamyecommerceadminapp/view/widget/auth/custtomAuthAppbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundcolor,
        appBar: const AuthAppBar(
          AppbarTitle: 'Check Email ',
        ),
        body: GetBuilder<CheckEmailControllerImp>(
          builder: (controller) => Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: ListView(
              children: [
                const CustomTextTitleAuth(texttitle: "Check Email"),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextsubtitleAuth(
                  subtitle:
                      'We Will send you a verificaiton code to ensure your email',
                ),
                const SizedBox(
                  height: 40,
                ),
                // const CustomCheckEmailForm(),
                CustomButtonAuth(
                  btnText: "Check Email",
                  onPressed: () => controller.GoTOSignUpVerificationCode(),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ));
  }
}
