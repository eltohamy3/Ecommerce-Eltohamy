import 'package:eltohamyecommercedeliveryapp/controller/auth/signInController.dart';
import 'package:eltohamyecommercedeliveryapp/core/class/handlingDataView.dart';
import 'package:eltohamyecommercedeliveryapp/core/constant/mycolors.dart';
import 'package:eltohamyecommercedeliveryapp/core/function/alertexitapp.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/auth/customButtonAuth.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/auth/customTextTitleauth.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/auth/customTextsubtitleAuth.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/auth/custtomAuthAppbar.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/auth/logoauth.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/auth/signin/Customdonthaveaccount.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/auth/signin/customForgetpasstext.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/auth/signin/customTextformSignIN.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundcolor,
        appBar: const AuthAppBar(
          AppbarTitle: 'Delivery Sign In',
        ),
        body: WillPopScope(
          onWillPop: () => alertExitApp(context),
          child: GetBuilder<SignInControllerImp>(
            init: SignInControllerImp(),
            builder: (controller) => Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: HanddlingDataViewRequest(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      const LogoAuth(),
                      const CustomTextTitleAuth(texttitle: "Delivery App Sign In"),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomTextsubtitleAuth(
                        subtitle:
                            'Sign in with your email and password \nor continue with  social media',
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const CustomSignInForm(),
                      const SizedBox(
                        height: 25,
                      ),
                      const CustomForgetPasswordText(),
                      CustomButtonAuth(
                        btnText: "Sign In",
                        onPressed: () => controller.login(),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      
                    ],
                  ),
                )),
          ),
        ));
  }
}
