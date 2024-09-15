import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:flutter/material.dart';

class CustomOrdersAppBar extends StatelessWidget implements PreferredSizeWidget {
 final String pageName; 
  const CustomOrdersAppBar({super.key , required this.pageName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        pageName,
        style: TextStyle(
            color: AppColor.secondarycolor,
            fontSize: 27,
            fontWeight: FontWeight.bold),
        selectionColor: AppColor.white,
      ),
      backgroundColor: AppColor.white,
      iconTheme: IconThemeData(color: AppColor.secondarycolor),
      centerTitle: true,
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
