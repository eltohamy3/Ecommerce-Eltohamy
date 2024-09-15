import 'package:eltohamyecommercedeliveryapp/core/constant/mycolors.dart';
import 'package:eltohamyecommercedeliveryapp/core/constant/routename.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.addAddress);
        },
        backgroundColor: AppColor.secondarycolor,
        child: Icon(
          Icons.add,
          color: AppColor.white,
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Address',
          style: TextStyle(color: AppColor.white),
        ),
        iconTheme: IconThemeData(color: AppColor.white),
        backgroundColor: AppColor.secondarycolor,
      ),
      body: Container(
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}
