import 'package:eltohmayecommerceapp/controller/auth/Forgetpassword/resetpasswordcontroller.dart';
import 'package:eltohmayecommerceapp/core/class/handlingDataView.dart';
import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:eltohmayecommerceapp/view/widget/auth/customButtonAuth.dart';
import 'package:eltohmayecommerceapp/view/widget/auth/customTextTitleauth.dart';
import 'package:eltohmayecommerceapp/view/widget/auth/customTextsubtitleAuth.dart';
import 'package:eltohmayecommerceapp/view/widget/auth/custtomAuthAppbar.dart';
import 'package:eltohmayecommerceapp/view/widget/auth/resetpassword/customResetPasswordForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: const AuthAppBar(
        AppbarTitle: 'Reset Password ',
      ),
      body: GetBuilder<ResetPasswordControllerImp>(
        init: ResetPasswordControllerImp(),
        builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child:   HanddlingDataViewRequest(
                  statusRequest: controller.statusRequest,
                  widget:ListView(
          children: [
            const CustomTextTitleAuth(texttitle: "Set New Password"),
            const SizedBox(
              height: 20,
            ),
            const CustomTextsubtitleAuth(
              subtitle: 'Reset your Password and Remember it',
            ),
            const SizedBox(
              height: 40,
            ),
            const CustomResetPasswordForm(),
            CustomButtonAuth(
              btnText: "Reset Password",
              onPressed: () => controller.resetPassword(),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),)
      ),)
    );
  }
}
