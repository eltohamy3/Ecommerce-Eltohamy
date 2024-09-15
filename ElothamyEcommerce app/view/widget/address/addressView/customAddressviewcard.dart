import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:eltohmayecommerceapp/core/constant/routename.dart';
import 'package:eltohmayecommerceapp/data/model/addressModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAddressViewCard extends StatelessWidget {

  final AddressModel addressModel;
  
  void Function()? onPressed; 
  CustomAddressViewCard({super.key, required this.addressModel , this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoute.addressDetails,
            arguments: {'addressModel': addressModel});
      },
      child: Card(
        surfaceTintColor: AppColor.white,
        color: AppColor.white,
        child: Container(
          child: ListTile(
            trailing: onPressed!=null? IconButton(onPressed:onPressed , icon: Icon(Icons.delete_outline , color: AppColor.secondarycolor,)) :null,
            title: Text(
              addressModel.addressName!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              addressModel.addressCity!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
