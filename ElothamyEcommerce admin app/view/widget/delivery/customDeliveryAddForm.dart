import 'package:eltohamyecommerceadminapp/controller/delivery/deliveryAddController.dart';
import 'package:eltohamyecommerceadminapp/core/function/validation.dart';
import 'package:eltohamyecommerceadminapp/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAddDeliveryForm extends GetView<DeliveryAddControllerImp> {
  const CustomAddDeliveryForm({super.key});

  @override
  Widget build(BuildContext context) {

    return Form(
        key: controller.deliveryAddFOrmKey,
        child: Column(
          children: [
            CustomTextFormAuth(
                hintText: "Enter Delivery Name",
                labelText: "DeliveryName",
                icondata: const Icon(Icons.person_outline),
                mycontroller: controller.deliveryNameController,
                validator: (username) => controller.usernameValidate(username)),
            CustomTextFormAuth(
              hintText: "Enter Delivery Email",
              labelText: "Email",
              icondata: const Icon(Icons.email_outlined),
              mycontroller: controller.emailController,
              validator: (email) => Emailvalidate(email),
            ),
            CustomTextFormAuth(
                hintText: "Enter Delivery Phone",
                labelText: "Phone",
                isnumber: true,
                icondata: const Icon(Icons.phone_outlined),
                mycontroller: controller.Phonecontroller,
                validator: (phonenumber) =>
                    controller.phonenumberValidate(phonenumber)),
            GetBuilder<DeliveryAddControllerImp>(
              builder: (controller) => CustomTextFormAuth(
                  hintText: "Enter Delivery Password",
                  labelText: "Delivery Password",
                  obscureText: controller.showpassword,
                  icondata: Icon(controller.showpassword
                      ? Icons.visibility
                      : Icons.visibility_off),
                  mycontroller: controller.passwordController,
                  onTap: () => controller.changShowPassword(),
                  validator: (password) => passwordSignUpValidate(password)),
            ),
            GetBuilder<DeliveryAddControllerImp>(
              builder: (controller) => CustomTextFormAuth(
                  onTap: () => controller.changShowRepetPassword(),
                  obscureText: controller.showRepetePassword,
                  hintText: "Repete Delivery Password",
                  labelText: "Delivery Password Repete",
                  icondata: Icon(controller.showRepetePassword
                      ? Icons.visibility
                      : Icons.visibility_off),
                  mycontroller: controller.repeatPasswordController,
                  validator: (repPassword) =>
                      controller.repatepasswordVlaidate(repPassword)),
            )
          ],
        ));
  }
}
