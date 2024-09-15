import 'package:eltohamyecommerceadminapp/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(AppImageAsset.loading , width: 250 , height: 250 ),
    );
  }
}
