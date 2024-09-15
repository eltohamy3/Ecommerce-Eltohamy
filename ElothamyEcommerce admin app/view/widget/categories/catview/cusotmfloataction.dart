import 'package:eltohamyecommerceadminapp/core/constant/mycolors.dart';
import 'package:eltohamyecommerceadminapp/core/constant/routename.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CusotomFloatActionbutton extends StatelessWidget {
  void Function()? onPressed;
   CusotomFloatActionbutton({super.key ,   this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed:onPressed  ,
      backgroundColor: AppColor.secondarycolor,
      child: Icon(
        Icons.add,
        color: AppColor.white,
      ),
    );
  }
}
