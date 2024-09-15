import 'package:eltohamyecommerceadminapp/core/constant/mycolors.dart';
import 'package:eltohamyecommerceadminapp/data/model/AppbarModel.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAPPBarItem extends StatelessWidget {
  final int index;
  final int currentPage;
  final AppBarModel appBarModel;
  void Function()? onTap ;
  CustomAPPBarItem(
      {super.key,
      required this.index,
      required this.appBarModel,
      required this.currentPage , 
      this.onTap
      
      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(appBarModel.icon,
                  color: currentPage == index ? Colors.red : AppColor.AppBarIconColor),
              Text(
                appBarModel.title,
                style: TextStyle(
                  fontSize: 12,
                    color: currentPage == index ? Colors.red :AppColor.AppBarIconColor,)
              )
            ],
          ),
        
      ),
    );
  }
}
