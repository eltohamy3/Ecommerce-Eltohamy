import 'package:eltohamyecommercedeliveryapp/controller/auth/signInController.dart';
import 'package:eltohamyecommercedeliveryapp/controller/auth/signUp/singUpController.dart';
import 'package:eltohamyecommercedeliveryapp/core/class/handlingDataView.dart';
import 'package:eltohamyecommercedeliveryapp/core/constant/mycolors.dart';
import 'package:eltohamyecommercedeliveryapp/core/function/alertexitapp.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/auth/customButtonAuth.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/auth/customTextTitleauth.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/auth/customTextsubtitleAuth.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/auth/custtomAuthAppbar.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/auth/signin/Customdonthaveaccount.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/auth/singUp/customSinUpForm.dart';
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
          AppbarTitle: 'Delivery App Sign Up',
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
