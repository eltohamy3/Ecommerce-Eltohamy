import 'package:eltohmayecommerceapp/core/constant/routename.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CustomFloatActionButton extends StatelessWidget {
  const CustomFloatActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 56.0, // Custom width
        height: 56.0, // Custom height
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(56)),
        child: IconButton(
          onPressed: () {
            Get.toNamed(AppRoute.cart , arguments: {
              "lastPage" : 0 
            });
          },
          icon: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
          ),
        ));
  }
}
