import 'package:eltohmayecommerceapp/controller/auth/signInController.dart';
import 'package:eltohmayecommerceapp/core/class/handlingDataView.dart';
import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:eltohmayecommerceapp/core/function/alertexitapp.dart';
import 'package:eltohmayecommerceapp/view/widget/auth/customButtonAuth.dart';
import 'package:eltohmayecommerceapp/view/widget/auth/customTextTitleauth.dart';
import 'package:eltohmayecommerceapp/view/widget/auth/customTextsubtitleAuth.dart';
import 'package:eltohmayecommerceapp/view/widget/auth/custtomAuthAppbar.dart';
import 'package:eltohmayecommerceapp/view/widget/auth/logoauth.dart';
import 'package:eltohmayecommerceapp/view/widget/auth/signin/Customdonthaveaccount.dart';
import 'package:eltohmayecommerceapp/view/widget/auth/signin/customForgetpasstext.dart';
import 'package:eltohmayecommerceapp/view/widget/auth/signin/customTextformSignIN.dart';
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
          AppbarTitle: 'Sign In',
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
                      const CustomTextTitleAuth(texttitle: "Welcome Back"),
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
                      CustomDontHaveAccount(
                        FirstString: "Don`t Have an Account? ",
                        SecondString: "Sign Up",
                        onTap: () => controller.GoToSignUP(),
                      )
                    ],
                  ),
                )),
          ),
        ));
  }
}
