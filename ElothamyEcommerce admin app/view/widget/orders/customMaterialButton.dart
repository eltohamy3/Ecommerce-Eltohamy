import 'package:eltohamyecommerceadminapp/core/constant/mycolors.dart';
import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  Color? color; 
    Color? textcolor; 

   CustomMaterialButton({super.key, required this.title, this.onPressed , this.color  , this.textcolor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color!=null?color: AppColor.thirdColor,
      child: Text(
        title,
        style: TextStyle(color:textcolor!=null?textcolor: AppColor.secondarycolor , 
        fontWeight: FontWeight.bold , 
        fontSize: 17
        ),
      ),
    );
  }
}
