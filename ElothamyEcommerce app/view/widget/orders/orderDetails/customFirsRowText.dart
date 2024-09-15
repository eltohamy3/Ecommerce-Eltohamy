import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:flutter/material.dart';

class CustomFristRowText extends StatelessWidget {
  final String titel;
  const CustomFristRowText({super.key, required this.titel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      child: Text(
        titel,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: AppColor.secondarycolor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
