import 'package:eltohamyecommerceadminapp/controller/coupon/couponEditController.dart';
import 'package:eltohamyecommerceadminapp/core/class/handlingDataView.dart';
import 'package:eltohamyecommerceadminapp/core/constant/mycolors.dart';
import 'package:eltohamyecommerceadminapp/view/widget/auth/customTextTitleauth.dart';
import 'package:eltohamyecommerceadminapp/view/widget/coupon/customCouponEditForm.dart';
import 'package:eltohamyecommerceadminapp/view/widget/orders/customMaterialButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCoupon extends StatelessWidget {
  const EditCoupon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Coupon'),
        ),
        body: GetBuilder<CouponEditControllerImp>(
          init: CouponEditControllerImp(),
          builder: (controller) => HanddlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: ListView(
                  children: [
                    CustomTextTitleAuth(texttitle: "Edit Coupon Data"),
                    SizedBox(
                      height: 40,
                    ),
                    CustomCouponEditForm(),
                    ElevatedButton(
                      onPressed: () {
                        controller.selectTime(context);
                      },
                      child: Text('Select Time'),
                    ),
                        CustomMaterialButton(
                          title: "Edit Coupon",
                          color: AppColor.secondarycolor,
                          textcolor: AppColor.white,
                          onPressed: () {
                            controller.EditCoupon();
                          },
                        ),

                  ],

                ),
              )),
        ));
  }
}
