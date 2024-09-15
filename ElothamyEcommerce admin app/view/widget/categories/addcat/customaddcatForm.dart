import 'package:eltohamyecommerceadminapp/controller/categories/addcatController.dart';
import 'package:eltohamyecommerceadminapp/core/function/validation.dart';
import 'package:eltohamyecommerceadminapp/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAddCatForm extends GetView<AddCategoresControllerImp> {
  const CustomAddCatForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.formkey,
        child: Column(
          children: [
            CustomTextFormAuth(
                hintText: "Enter Your Categorie Name",
                labelText: "Categorie Name",
                mycontroller: controller.catnameController,
                validator: (val) => CheckEmpty(val)),
            CustomTextFormAuth(
                hintText: "أدخل الإسم بالعربية",
                labelText: "Categorie Name arabic",
                isarabic: true,
                mycontroller: controller.catnameArabicController,
                validator: (val) => CheckEmpty(val)),
          ],
        ));
  }
}
