import 'package:eltohamyecommerceadminapp/core/constant/mycolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDontHaveAccount extends StatelessWidget {
  final String FirstString;
  final String SecondString;
  final void Function()? onTap;

  const CustomDontHaveAccount(
      {super.key, required this.FirstString, required this.SecondString, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(FirstString),
        InkWell(
          onTap: onTap,
          child: Text(
            SecondString,
            style: TextStyle(color: AppColor.ButtonColorauth, fontSize: 14),
          ),
        )
      ],
    );
  }
}
