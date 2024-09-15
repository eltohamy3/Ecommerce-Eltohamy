import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:flutter/material.dart';

class CustomCategoresText extends StatelessWidget {
  const CustomCategoresText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 15),
      child: const Text(
        "Categores",
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: AppColor.secondarycolor),
      ),
    );
  }
}
