import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:flutter/material.dart';

class CustomAddressCard extends StatelessWidget {
    final String title;
    final String subtitle; 
  final Function()? onTap;
  bool isSelected;

   CustomAddressCard({super.key, required this.title, required this.subtitle, this.onTap , required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        surfaceTintColor: isSelected? AppColor.secondarycolor : AppColor.white,
        color: isSelected? AppColor.secondarycolor : AppColor.white,
        child: Container(
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold , color: isSelected? AppColor.white:null  ),
            ),
            subtitle: Text(subtitle , 
                        style: TextStyle(fontWeight: FontWeight.bold , color: isSelected? AppColor.white:null  ),
      
            ),
          ),
        ),
      ),
    );
  }
}
