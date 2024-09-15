import 'package:eltohamyecommerceadminapp/controller/coupon/couponViewController.dart';
import 'package:eltohamyecommerceadminapp/data/model/couponModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomCouponViewCard extends GetView<CouponViewControllerImp> {
  CouponModel couponModel;
  CustomCouponViewCard({super.key, required this.couponModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.GoToCouponEdit(couponModel);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ListTile(
          title: Text(couponModel.couponName!,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("ExpireData :  ${couponModel.couponExpiredata}"),
              Text("Count : " + "${couponModel.couponCount}"),
              Text("Discount : " + "${couponModel.couponDiscount}" ),
            ],
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.red),
            onPressed: () {
              controller.DeleteCouponButton(couponModel.couponId!);
            },
          ),
        ),
      ),
    );
  }
}
