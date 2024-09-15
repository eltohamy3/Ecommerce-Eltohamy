import 'package:eltohamyecommerceadminapp/controller/coupon/couponAddController.dart';
import 'package:eltohamyecommerceadminapp/core/function/validation.dart';
import 'package:eltohamyecommerceadminapp/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCouponAddForm extends GetView<CouponAddControllerImp> {
  const CustomCouponAddForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.CouponAddFOrmKey,
        child: Column(
      children: [
        CustomTextFormAuth(
            hintText: "Enter the  Coupon Name",
            labelText: "Coupon Name",
            mycontroller: controller.CouponNameController,
            validator: (val) => CheckEmpty(val)),
        CustomTextFormAuth(
            hintText: "Enter the Coupon discount",
            labelText: "Coupon discount",
            mycontroller: controller.couponDiscountController,
            isnumber: true,
            validator: (val) => checkDiscount(val)),
        CustomTextFormAuth(
            hintText: "Enter Coupon count",
            labelText: "Coupon count",
            mycontroller: controller.couponCountController,
            isnumber: true,
            validator: (val) => CheckEmpty(val)),
        CustomTextFormAuth(
            enable: false,
            AllOntap: () {
              controller.selectDate(context);
            },
            hintText: "Select  Coupon  Expiry Date",
            labelText: "Expiry Date (YYYY-MM-DD HH:MM:SS)",
            mycontroller: controller.couponExpiredataController,
            isnumber: true,
            validator: (val) => CheckEmpty(val)),
      ],
    ));
  }
}
