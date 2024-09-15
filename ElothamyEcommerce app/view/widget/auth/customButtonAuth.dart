
import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  final void Function()? onPressed;
  final String btnText; 

  const CustomButtonAuth({super.key, required this.onPressed, required this.btnText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          color: AppColor.ButtonColorauth,
          borderRadius: BorderRadius.circular(20)),
      child: MaterialButton(
        onPressed: onPressed,
        child:  Text(
          btnText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            // fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
