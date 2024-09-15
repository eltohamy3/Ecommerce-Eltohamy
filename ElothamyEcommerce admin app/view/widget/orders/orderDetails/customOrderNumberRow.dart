import 'package:eltohamyecommerceadminapp/core/constant/mycolors.dart';
import 'package:eltohamyecommerceadminapp/data/model/ordersModel.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class CusotmOrderNumberRow extends StatelessWidget {
  int orderId;
  String orderDatatime; 
  CusotmOrderNumberRow({super.key, required this.orderId , required this.orderDatatime});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        "Orders Number : " + "${orderId}",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: AppColor.grey500),
      ),
      Text(
        "${Jiffy.parse(orderDatatime).fromNow() // 25 years ago
        }",

        // Jiffy.parse(ordersModel.ordersDatatime!).format(pattern: 'MMMM do yyyy, h:mm:ss a') ,// January 1st 2021, 12:00:00 AM

        style: TextStyle(
          color: AppColor.secondarycolor,
          fontFamily: "sans",
          // fontSize: 12
        ),
      )
    ]);
  }
}
