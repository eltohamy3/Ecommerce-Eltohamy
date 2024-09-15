import 'package:eltohmayecommerceapp/controller/cartController.dart';
import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:eltohmayecommerceapp/core/constant/routename.dart';
import 'package:eltohmayecommerceapp/view/widget/ProductDetails/CustomButtonprimarycolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CustomCardButtomNavigationBar extends StatelessWidget {
  const CustomCardButtomNavigationBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<CartControllerImp>(
        builder: (controller) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            controller.couponName==null?
            Container(
              height: 40,
              margin: const EdgeInsets.only(top: 10 , bottom: 15, left: 10 , right: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Form(
                        key: controller.couponFormKey,
                        child: TextFormField(
                          controller: controller.couponController,
                          decoration: InputDecoration(
                             
                              border: OutlineInputBorder(),
                              hintText: "Coupon Code"),
                        )),
                  ),
                  Expanded(
                      child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(color: AppColor.secondarycolor),
                    child: MaterialButton(
                      onPressed: () {
                        controller.applyCoupon();
                      },
                      child: Text(
                        'apply',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: AppColor.white),
                      ),
                    ),
                  ))
                ],
              ),
            ):Center(child: Text('Coupon Name used ${controller.couponName}' , 
            style: TextStyle(color: AppColor.secondarycolor , fontWeight: FontWeight.bold),),),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
              height: 190,
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColor.secondarycolor)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(color: AppColor.grey500, fontSize: 18),
                      ),
                      Text(
                        "${controller.totalPriceOrder}\$",
                        style: TextStyle(
                            color: AppColor.grey500,
                            fontSize: 18,
                            fontFamily: "sans"),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'discount',
                        style: TextStyle(color: AppColor.grey500, fontSize: 18),
                      ),
                      Text(
                        "${controller.discountCoupon}\%",
                        style: TextStyle(
                            color: AppColor.grey500,
                            fontSize: 18,
                            fontFamily: "sans"),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'shipping',
                        style: TextStyle(color: AppColor.grey500, fontSize: 18),
                      ),
                      Text(
                        "0",
                        style: TextStyle(
                            color: AppColor.grey500,
                            fontSize: 18,
                            fontFamily: "sans"),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Price',
                        style: TextStyle(
                            color: AppColor.secondarycolor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Text(
                        "${controller.FinalTOtalPrice}\$",
                        style: TextStyle(
                            color: AppColor.secondarycolor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: "sans"),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            CustomPrimaryButton(
              Title: "Order",
              onPressed: () {
                controller.goToCheckOut(); 
              },
            ),
          
          ],
        ),
      ),
    );
  }
}
