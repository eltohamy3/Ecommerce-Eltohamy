import 'package:eltohamyecommerceadminapp/core/constant/mycolors.dart';
import 'package:flutter/material.dart';

class CustomCellRow extends StatelessWidget {
  final String title;
  const CustomCellRow({super.key , required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.only(bottom: 5),

      alignment: Alignment.center,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColor.grey500),
      ),
    );
  }
}
