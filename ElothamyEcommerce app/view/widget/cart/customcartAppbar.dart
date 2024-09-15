import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomCartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomCartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.white,
      iconTheme: const IconThemeData(color: AppColor.secondarycolor ),
      title: const Text(
        'My Cart',
        style: TextStyle(
            color: AppColor.secondarycolor,
            fontWeight: FontWeight.bold,
            fontSize: 28),
      ),
      centerTitle: true,
    );
  }
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}
