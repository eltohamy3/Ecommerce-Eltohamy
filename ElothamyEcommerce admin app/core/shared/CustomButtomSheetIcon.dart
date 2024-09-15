import 'package:flutter/material.dart';

class CustomButtomSheetIcon extends StatelessWidget {
  final String hintText;
  final Icon MyIcon;
  final void Function()? onTap;
  const CustomButtomSheetIcon({super.key, required this.hintText, required this.MyIcon,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 165,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           MyIcon,
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Text(hintText),
              ],
            )
          ],
        ),
      ),
    );
  }
}
