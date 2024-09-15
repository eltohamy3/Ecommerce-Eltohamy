import 'package:eltohmayecommerceapp/controller/profileEdit.dart';
import 'package:eltohmayecommerceapp/core/function/validation.dart';
import 'package:eltohmayecommerceapp/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomProfileEditForm extends GetView<ProfileEditControllerImp> {
  const CustomProfileEditForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.EditProfileKey,
      
      child: Column(
      children: [
                    CustomTextFormAuth(
                      enable: false,
              hintText: "Enter Your Email",
              labelText: "Email",
              icondata: const Icon(Icons.email_outlined),
              mycontroller: controller.emailController,
              validator: (email) => Emailvalidate(email),
            ),
            CustomTextFormAuth(
                hintText: "Enter Your Username",
                labelText: "Username",
                icondata: const Icon(Icons.person_outline),
                mycontroller: controller.usernamecontroller,
                validator: (username) => controller.usernameValidate(username)),

            CustomTextFormAuth(
                hintText: "Enter Your Phone",
                labelText: "Phone",
                isnumber: true,
                icondata: const Icon(Icons.phone_outlined),
                mycontroller: controller.phoneNumberController,
                validator: (phonenumber) =>
                    controller.phonenumberValidate(phonenumber)),

      ],
    ));
  }
}
