import 'package:eltohamyecommerceadminapp/core/shared/CustomButtomSheetIcon.dart';
import 'package:flutter/material.dart';

class CustomImageButtomSHeet extends StatelessWidget {
  void Function()? cameraOnclick;
  void Function()? galaryOnclick;
  CustomImageButtomSHeet(
      {super.key, required this.cameraOnclick, required this.galaryOnclick});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          CustomButtomSheetIcon(
              hintText: 'upload from \n   camera',
              MyIcon: Icon(Icons.camera_alt, color: Colors.blue),
              onTap: cameraOnclick),
          CustomButtomSheetIcon(
            hintText: 'upload from \n   gallery',
            MyIcon: Icon(Icons.photo_library, color: Colors.red),
            onTap:galaryOnclick
          )
        ]));
  }
}
