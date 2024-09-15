
import 'package:eltohmayecommerceapp/core/class/statusrequest.dart';
import 'package:eltohmayecommerceapp/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HanddlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HanddlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    if (statusRequest == StatusRequest.success) {
      return widget;
    } else if (statusRequest == StatusRequest.loading) {
      return Center(
          child: Lottie.asset(AppImageAsset.cart, width: 250, height: 250));
    } else if (statusRequest == StatusRequest.offlinefailure) {
      return Center(
          child: Lottie.asset(
        AppImageAsset.offline,
        width: 250,
        height: 250,
      ));
    } else if (statusRequest == StatusRequest.failure) {
      return Center(
          child: Lottie.asset(
        AppImageAsset.noData,
        width: 250,
        height: 250,
      ));
    } else {
      return Center(
          child: Lottie.asset(
        AppImageAsset.serverFalier,
        width: 250,
        height: 250,
      ));
    }
  }
}

class HanddlingDataViewRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HanddlingDataViewRequest(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    if (statusRequest == StatusRequest.loading) {
      return Center(
          child: Lottie.asset(AppImageAsset.cart, width: 250, height: 250));
    } else if (statusRequest == StatusRequest.offlinefailure) {
      return Center(
          child: Lottie.asset(
        AppImageAsset.offline,
        width: 250,
        height: 250,
      ));
    } else if (statusRequest == StatusRequest.serverfailure) {
      return Center(
          child: Lottie.asset(
        AppImageAsset.serverFalier,
        width: 250,
        height: 250,
      ));
    } else {
      return widget;
    }
  }
}
