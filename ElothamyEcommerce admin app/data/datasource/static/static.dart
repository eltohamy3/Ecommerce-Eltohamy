import 'package:eltohamyecommerceadminapp/controller/settingController.dart';
import 'package:eltohamyecommerceadminapp/core/constant/imageasset.dart';
import 'package:eltohamyecommerceadminapp/core/constant/routename.dart';
import 'package:eltohamyecommerceadminapp/data/model/AppbarModel.dart';
import 'package:eltohamyecommerceadminapp/data/model/onboardingModel.dart';
import 'package:eltohamyecommerceadminapp/data/model/settingModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';

List<OnBoardingModel> OnBoardingList = [
  OnBoardingModel(
      title: 'Choose Product',
      image: AppImageAsset.onBoardingImageOne,
      body:
          'We Have a 100k Products\nChoose Your Product from our E-\nCommerce shop '),
  OnBoardingModel(
      title: "Easy & Safe Payment",
      image: AppImageAsset.onBoardingImagetwo,
      body:
          'Easy Checkout & Safe Payment\nmethod trusted by our Customers\nfrom  all over the world '),
  OnBoardingModel(
      title: "Track Your Order",
      image: AppImageAsset.onBoardingImagethree,
      body:
          'Best Tracker has been Used For\ntrack Your order,Your `ll know Where\nYour Product is at the moment'),
  OnBoardingModel(
      title: "Fast Delivery",
      image: AppImageAsset.onBoardingImagefour,
      body:
          'Relable And Fast Delivery, We\nDeliver your product the fastest\nway possible'),
];


SettingControllerImp SettingControllerData = Get.put(SettingControllerImp());

List<SettingModel> SettingData = [
  SettingModel(title: 'Profile', prefexIcon: Icons.edit_outlined),
  SettingModel(title: 'About us', prefexIcon: Icons.help_outline_rounded),
  SettingModel(
    title: 'Contact us',
    prefexIcon: Icons.phone_callback_outlined,
    onPressed: () async {
     await launchUrl(Uri.parse("tel:+201095415987"));
    },
  ),
  SettingModel(
      title: 'Logout',
      prefexIcon: Icons.logout,
      onPressed: () async {
        await SettingControllerData.logout();
      }),
];
