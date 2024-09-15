import 'package:flutter/widgets.dart';

class SettingModel {
  final String title;
  final IconData prefexIcon;
   Function()? onPressed;

  SettingModel({required this.title, required this.prefexIcon , this.onPressed});

  
}
