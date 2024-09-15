import 'package:eltohmayecommerceapp/controller/auth/signInController.dart';
import 'package:eltohmayecommerceapp/controller/auth/signUp/singUpController.dart';
import 'package:eltohmayecommerceapp/core/class/handlingDataView.dart';
import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:eltohmayecommerceapp/core/function/alertexitapp.dart';
import 'package:eltohmayecommerceapp/view/widget/auth/customButtonAuth.dart';
import 'package:eltohmayecommerceapp/view/widget/auth/customTextTitleauth.dart';
import 'package:eltohmayecommerceapp/view/widget/auth/customTextsubtitleAuth.dart';
import 'package:eltohmayecommerceapp/view/widget/auth/custtomAuthAppbar.dart';
import 'package:eltohmayecommerceapp/view/widget/auth/signin/Customdonthaveaccount.dart';
import 'package:eltohmayecommerceapp/view/widget/auth/singUp/customSinUpForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SignInControllerImp());
    return Scaffold(
        backgroundColor: AppColor.backgroundcolor,
        appBar: const AuthAppBar(
          AppbarTitle: 'Sign Up',
        ),
        body: WillPopScope(
          onWillPop: () => alertExitApp(context),
          child: GetBuilder<SignUpControllerImb>(
            builder: (controller) => Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child:  GetBuilder<SignUpControllerImb>(
                  builder: (controller) => Container(
                    child: HanddlingDataViewRequest(
                  statusRequest: controller.statusRequest,
                  widget:ListView(
                            children: [
                              const CustomTextTitleAuth(
                                  texttitle: "Complete Profile"),
                              const SizedBox(
                                height: 20,
                              ),
                              const CustomTextsubtitleAuth(
                                subtitle:
                                    'Complete your details or Continue\nwith social media ',
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              const CustomSignUPForm(),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomButtonAuth(
                                btnText: "Sign Up",
                                onPressed: () => controller.signUp(),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              CustomDontHaveAccount(
                                  FirstString: "Already Have an Account? ",
                                  SecondString: "SignIn",
                                  onTap: () => controller.GoTOSignIN())
                            ],
                          ),
                  ),
                )),
          ),
        )));
  }
}
