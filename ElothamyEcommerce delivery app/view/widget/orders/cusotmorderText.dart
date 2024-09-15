import 'package:eltohamyecommercedeliveryapp/core/constant/mycolors.dart';
import 'package:flutter/material.dart';

class CustomOrderTextItem extends StatelessWidget {
  String Title ;
   CustomOrderTextItem(this.Title ,{super.key,  });


  @override
  Widget build(BuildContext context) {
    return             Container(
      padding: EdgeInsets.all(3),
      child: Text(Title , 
      style: TextStyle(
        color: AppColor.grey500 , 
        fontSize: 15
      
      
      ),),
    ) ; 

  }
}