import 'package:eltohamyecommerceadminapp/controller/coupon/couponEditController.dart';
import 'package:eltohamyecommerceadminapp/core/function/validation.dart';
import 'package:eltohamyecommerceadminapp/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCouponEditForm extends GetView<CouponEditControllerImp> {
  const CustomCouponEditForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.CouponEditFOrmKey,
        child: Column(
      children: [
        CustomTextFormAuth(
            hintText: "Edit the  Coupon Name",
            labelText: "Edit Coupon Name",
            mycontroller: controller.CouponNameController,
            validator: (val) => CheckEmpty(val)),
        CustomTextFormAuth(
            hintText: "Edit the Coupon discount",
            labelText: "Edit Coupon discount",
            mycontroller: controller.couponDiscountController,
            isnumber: true,
            validator: (val) => checkDiscount(val)),
        CustomTextFormAuth(
            hintText: "Edit  Coupon count",
            labelText: "Edit Coupon count",
            mycontroller: controller.couponCountController,
            isnumber: true,
            validator: (val) => CheckEmpty(val)),
        CustomTextFormAuth(
            enable: false,
            AllOntap: () {
              controller.selectDate(context);
            },
            hintText: "Change  Coupon  Expiry Date",
            labelText: "Expiry Date (YYYY-MM-DD HH:MM:SS)",
            mycontroller: controller.couponExpiredataController,
            isnumber: true,
            validator: (val) => CheckEmpty(val)),
      ],
    ));
  }
}
