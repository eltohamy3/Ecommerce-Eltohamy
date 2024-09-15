import 'package:eltohamyecommerceadminapp/controller/coupon/couponAddController.dart';
import 'package:eltohamyecommerceadminapp/core/class/handlingDataView.dart';
import 'package:eltohamyecommerceadminapp/core/constant/mycolors.dart';
import 'package:eltohamyecommerceadminapp/view/widget/auth/customTextTitleauth.dart';
import 'package:eltohamyecommerceadminapp/view/widget/coupon/customCouponAddForm.dart';
import 'package:eltohamyecommerceadminapp/view/widget/orders/customMaterialButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponAdd extends StatelessWidget {
  const CouponAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Coupon'),
        ),
        body: GetBuilder<CouponAddControllerImp>(
          init: CouponAddControllerImp(),
          builder: (controller) => HanddlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: ListView(
                  children: [
                    CustomTextTitleAuth(texttitle: "Add Coupon Data"),
                    SizedBox(
                      height: 40,
                    ),
                    CustomCouponAddForm(),
                    ElevatedButton(
                      onPressed: () {
                        controller.selectTime(context);
                      },
                      child: Text('Select Time'),
                    ),
                        CustomMaterialButton(
                          title: "Add Coupon",
                          color: AppColor.secondarycolor,
                          textcolor: AppColor.white,
                          onPressed: () {
                            controller.AddCoupon();
                          },
                        ),

                  ],

                ),
              )),
        ));
  }
}
