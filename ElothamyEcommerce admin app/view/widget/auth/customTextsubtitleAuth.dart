import 'package:flutter/material.dart';

class CustomTextsubtitleAuth extends StatelessWidget {
  final String subtitle;
  const CustomTextsubtitleAuth({super.key, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
