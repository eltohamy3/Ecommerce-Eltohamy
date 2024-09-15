import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class CustomButtonLang extends StatelessWidget {
  final String textbutton;
  final  void Function()? onPressed; 
  const CustomButtonLang({super.key, required this.textbutton , required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 100),
      child: MaterialButton(
        onPressed: onPressed,
        textColor: Colors.white,
        color: AppColor.secondarycolor,
        child: Text(
          textbutton,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
