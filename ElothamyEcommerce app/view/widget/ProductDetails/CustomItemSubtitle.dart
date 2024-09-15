import 'package:eltohmayecommerceapp/controller/productdeteilscontroller.dart';
import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:eltohmayecommerceapp/core/function/translateDatabase.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CustomItemSubtitle extends GetView<ProductDetailsControllerImp> {
  const CustomItemSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        translateDataBase(controller.itemsModel.itemsDesc!, controller.itemsModel.itemsDescAr!),
        style: TextStyle(fontSize: 16, color: AppColor.grey),
      ),
    );
  }
}
