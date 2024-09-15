import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDeliveryType extends StatelessWidget {
  final String imageSource;
  final String titel;
  Function()? onTap;
  bool isSelected;

  CustomDeliveryType(
      {super.key,
      required this.imageSource,
      required this.titel,
      required this.onTap,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: 130,
        decoration:
            BoxDecoration(
              color: isSelected? AppColor.secondarycolor:AppColor.white,
              border: Border.all(color: AppColor.secondarycolor)),
        child: InkWell(
          onTap: onTap,
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Image.asset(
                    imageSource,
                    width: 80,
                  color: isSelected? AppColor.white:null
                  )),
              SizedBox(
                height: 4,
              ),
              Text(
                titel,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isSelected? AppColor.white:AppColor.secondarycolor
                ),
              )
            ],
          ),
        ));
  }
}
