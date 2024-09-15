import 'package:eltohamyecommerceadminapp/core/constant/mycolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class CustomTextFormAuth extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController mycontroller;
  final String? Function(String?)? validator;
  final Icon? icondata; 
  final bool? isnumber ; 
  final bool? obscureText; 
  final void Function()? onTap ;
  final void Function()? AllOntap ;
  bool? isarabic= false; 
  bool?enable = true; 
   CustomTextFormAuth(
      {super.key,
      this.onTap,
      this.enable,
      this.AllOntap,
      this.obscureText ,
      this.isnumber ,
      required this.hintText,
      required this.labelText,
      required this.mycontroller,

      this.validator,  this.icondata , this.isarabic });

  @override
  Widget build(BuildContext context) {
    
    return InkWell(
      onTap:AllOntap ,
      child: Container(
        margin: EdgeInsets.only(top: 15 , bottom: 15),
        child: TextFormField(
          enabled: enable,
          obscureText: obscureText==null || obscureText== false? false:true,
          keyboardType: isnumber==null ?null :TextInputType.numberWithOptions(decimal: true),
          validator: validator,
          controller: mycontroller,
          textDirection: (isarabic!=null && isarabic==true) ? TextDirection.rtl:null,
          
          decoration: InputDecoration(
            
            
            floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding:  const EdgeInsets.symmetric(vertical: 4, horizontal: 30),
              
              label: Text(
                '  ${labelText}',
                style: TextStyle(fontSize: 20, color: AppColor.wightGrey),
              ),
              hintText: hintText,
              hintTextDirection:(isarabic!=null && isarabic==true) ? TextDirection.rtl:null ,
              
              hintStyle: TextStyle( ),
              
              suffixIcon: icondata!=null?  InkWell(child: icondata , onTap:onTap ,): null,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
        ),
      ),
    );
  }
}
