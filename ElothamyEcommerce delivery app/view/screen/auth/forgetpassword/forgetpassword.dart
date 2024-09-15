import 'package:eltohamyecommercedeliveryapp/controller/auth/Forgetpassword/forgetpasswordcontroller.dart';
import 'package:eltohamyecommercedeliveryapp/core/class/handlingDataView.dart';
import 'package:eltohamyecommercedeliveryapp/core/constant/mycolors.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/auth/customButtonAuth.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/auth/customTextTitleauth.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/auth/customTextsubtitleAuth.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/auth/custtomAuthAppbar.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/auth/forgetpassword/customforgetpasswordform.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: const AuthAppBar(
        AppbarTitle: 'Forget Password ',
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(builder: (controller) =>  Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: HanddlingDataViewRequest(
                  statusRequest: controller.statusRequest,
                  widget:ListView(
          children: [
            const CustomTextTitleAuth(texttitle: "Check Email"),
            const SizedBox(
              height: 20,
            ),
            const CustomTextsubtitleAuth(
              subtitle: 'Enter your Email to to continue to reaset your password ',
            ),
            const SizedBox(
              height: 40,
            ),
            const CustomForgetPasswordForm(),
            CustomButtonAuth(
              btnText: "Check Email",
              onPressed: () => controller.checkEmail(),
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
