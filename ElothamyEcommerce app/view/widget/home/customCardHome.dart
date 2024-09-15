import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:flutter/material.dart';

class CustomCardHome extends StatelessWidget {
  final String? title;
  final String? subtile; 
  
  const CustomCardHome({super.key, required this.title, required this.subtile});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: 150,
            decoration: BoxDecoration(
                color: AppColor.secondarycolor,
                borderRadius: BorderRadius.circular(20)),
            child:  ListTile(
              title: Text(
                "$title",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              subtitle: Text(
                "$subtile",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
          Positioned(
            top: -20,
            right: -20,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                  color: AppColor.secondarycolor2,
                  borderRadius: BorderRadius.circular(160)),
            ),
          )
        ],
      ),
    );
  }
}
