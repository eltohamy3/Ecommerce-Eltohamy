import 'package:eltohamyecommerceadminapp/controller/coupon/couponViewController.dart';
import 'package:eltohamyecommerceadminapp/core/class/handlingDataView.dart';
import 'package:eltohamyecommerceadminapp/core/constant/mycolors.dart';
import 'package:eltohamyecommerceadminapp/core/constant/routename.dart';
import 'package:eltohamyecommerceadminapp/view/widget/coupon/customCouponViewCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponVIew extends StatelessWidget {
  const CouponVIew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.secondarycolor,
        onPressed: () {
          Get.toNamed(AppRoute.couponAdd);
        },
        child: Icon(
          Icons.add,
          color: AppColor.white,
        ),
      ),
      appBar: AppBar(
        title: Text('Coupon View'),
      ),
      body: GetBuilder<CouponViewControllerImp>(
        init: CouponViewControllerImp(),
        builder: (controller) => HanddlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
              child: ListView.builder(
                  itemCount: controller.CouponViewList.length,
                  itemBuilder: (context, index) => CustomCouponViewCard(
                        couponModel: controller.CouponViewList[index],
                      ))),
        ),
      ),
    );
  }
}
