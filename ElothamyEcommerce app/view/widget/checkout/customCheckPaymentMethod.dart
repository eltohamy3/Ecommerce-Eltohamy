import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCheckPaymentMethod extends StatelessWidget {
  final String title;
  final Function()? onTap;
  bool isSelected;
   CustomCheckPaymentMethod({super.key, required this.title,required this.onTap , required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:isSelected?AppColor.secondarycolor : AppColor.thirdColor,
        ),
        child: Text(
            title,
            textAlign: TextAlign.start,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: isSelected? AppColor.white : AppColor.secondarycolor2),
          ),
        
      ),
    );
  }
}
