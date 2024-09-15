import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:flutter/material.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String AppbarTitle;
  const AuthAppBar({super.key, required this.AppbarTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        AppbarTitle,
        style: Theme.of(context).textTheme.headline3,
      ),
      centerTitle: true,
      backgroundColor: AppColor.backgroundcolor,
      elevation: 0.0,
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
