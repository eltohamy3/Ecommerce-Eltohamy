import 'package:eltohamyecommercedeliveryapp/core/constant/mycolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class CustomTextFormAuth extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController mycontroller;
  final String? Function(String?)? validator;
  final Icon icondata; 
  final bool? isnumber ; 
  final bool? obscureText; 
  final void Function()? onTap ;
   CustomTextFormAuth(
      {super.key,
      this.onTap,
      this.obscureText ,
      this.isnumber ,
      required this.hintText,
      required this.labelText,
      required this.mycontroller,

      this.validator, required this.icondata });

  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: EdgeInsets.only(top: 15 , bottom: 15),
      child: TextFormField(
        obscureText: obscureText==null || obscureText== false? false:true,
        keyboardType: isnumber==null ?null :TextInputType.numberWithOptions(decimal: true),
        validator: validator,
        controller: mycontroller,
        decoration: InputDecoration(
          
          floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:  const EdgeInsets.symmetric(vertical: 4, horizontal: 30),
            
            label: Text(
              '  ${labelText}',
              style: TextStyle(fontSize: 20, color: AppColor.wightGrey),
            ),
            hintText: hintText,
            suffixIcon:  InkWell(child: icondata , onTap:onTap ,),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
      ),
    );
  }
}
