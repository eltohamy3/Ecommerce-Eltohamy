import 'package:eltohmayecommerceapp/controller/productdeteilscontroller.dart';
import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CustomPrimaryButton extends GetView<ProductDetailsControllerImp> {
  Color? buttoncolor;
  final String Title;
  Function()? onPressed;
   CustomPrimaryButton( {required this.Title ,  required this.onPressed ,this.buttoncolor ,     super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom:15 ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      // margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: MaterialButton(
        color:   buttoncolor!=null?buttoncolor: AppColor.secondarycolor,
        onPressed:onPressed,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          Title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
