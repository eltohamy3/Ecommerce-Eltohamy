import 'package:eltohmayecommerceapp/controller/settingController.dart';
import 'package:eltohmayecommerceapp/core/constant/imageasset.dart';
import 'package:eltohmayecommerceapp/core/constant/routename.dart';
import 'package:eltohmayecommerceapp/data/model/AppbarModel.dart';
import 'package:eltohmayecommerceapp/data/model/onboardingModel.dart';
import 'package:eltohmayecommerceapp/data/model/settingModel.dart';
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
      title: "Fast Delivery",
      image: AppImageAsset.onBoardingImagethree,
      body:
          'Relable And Fast Delivery, We\nDeliver your product the fastest\nway possible'),
  OnBoardingModel(
      title: "Track Your Order",
      image: AppImageAsset.onBoardingImagefour,
      body:
          'Best Tracker has been Used For\ntrack Your order,Your `ll know Where\nYour Product is at the moment'),

];
List<AppBarModel> AppBarList = [
  AppBarModel(title: 'Home', icon: Icons.home),
  AppBarModel(title: 'offers', icon: Icons.person_2_outlined),
  AppBarModel(title: 'notific', icon: Icons.notification_add_outlined),
  AppBarModel(title: 'setting', icon: Icons.settings),
];
SettingControllerImp SettingControllerData = Get.put(SettingControllerImp());

List<SettingModel> SettingData = [
  SettingModel(
    title: 'Profile',
    prefexIcon: Icons.edit_outlined,
    onPressed: () {
      Get.toNamed(AppRoute.editprofile);
    },
  ),
  SettingModel(
    title: 'Orders',
    prefexIcon: Icons.online_prediction_rounded,
    onPressed: () {
      Get.toNamed(AppRoute.pendingOrders);
    },
  ),
  SettingModel(
    title: 'Archive',
    prefexIcon: Icons.card_travel,
    onPressed: () {
      Get.toNamed(AppRoute.archiveOrders);
    },
  ),
  SettingModel(
      title: 'Address',
      prefexIcon: Icons.location_on_outlined,
      onPressed: () {
        Get.toNamed(AppRoute.addressView, arguments: {"fromCeckout": 0});
      }),
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
