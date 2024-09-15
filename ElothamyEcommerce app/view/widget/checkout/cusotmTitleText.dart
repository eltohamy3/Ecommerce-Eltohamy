import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:flutter/material.dart';

class CusotmTitleText extends StatelessWidget {
  final String Titel;
  const CusotmTitleText({super.key , required this.Titel});

  @override
  Widget build(BuildContext context) {
    return  Text(
      Titel,
      style: TextStyle(
          color: AppColor.secondarycolor,
          fontWeight: FontWeight.bold,
          fontSize: 20),
    );
  }
}
