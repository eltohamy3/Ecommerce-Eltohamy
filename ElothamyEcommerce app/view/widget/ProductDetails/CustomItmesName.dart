import 'package:eltohmayecommerceapp/controller/productdeteilscontroller.dart';
import 'package:eltohmayecommerceapp/core/function/translateDatabase.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CustomItemName extends GetView<ProductDetailsControllerImp> {
  const CustomItemName({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Text(
        translateDataBase(controller.itemsModel.itemsName!,
            controller.itemsModel.itemsNameAr!),
        style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 5, 72, 127)),
      ),
    );
  }
}
