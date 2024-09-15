import 'package:eltohamyecommerceadminapp/data/model/homeIconModel.dart';
import 'package:flutter/material.dart';

class CustomHomeItemPanal extends StatelessWidget {
  Homecategory homecategory ;
   CustomHomeItemPanal({super.key , required this.homecategory});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: homecategory.onPressed,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(homecategory.imageSrc, width: 100, height: 100),
            Text(homecategory.title)
          ],
        ),
      ),
    );
  }
}
