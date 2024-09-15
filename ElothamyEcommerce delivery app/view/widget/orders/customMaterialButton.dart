import 'package:eltohamyecommercedeliveryapp/core/constant/mycolors.dart';
import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const CustomMaterialButton({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: AppColor.thirdColor,
      child: Text(
        title,
        style: TextStyle(color: AppColor.secondarycolor),
      ),
    );
  }
}
