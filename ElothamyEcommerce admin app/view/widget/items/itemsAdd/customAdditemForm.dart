import 'package:eltohamyecommerceadminapp/controller/Items/itemsAddcontroller.dart';
import 'package:eltohamyecommerceadminapp/core/constant/mycolors.dart';
import 'package:eltohamyecommerceadminapp/core/function/validation.dart';
import 'package:eltohamyecommerceadminapp/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAddItemForm extends GetView<AddItemsControllerImp> {
  const CustomAddItemForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.formkey,
        child: Column(
          children: [
            CustomTextFormAuth(
                hintText: "Enter Your Item Name",
                labelText: "Item Name",
                mycontroller: controller.itemNameController,
                validator: (val) => CheckEmpty(val)),
            CustomTextFormAuth(
                hintText: "أدخل الإسم بالعربية",
                labelText: "Item Name arabic",
                isarabic: true,
                mycontroller: controller.itemNameArabicController,
                validator: (val) => CheckEmpty(val)),
            CustomTextFormAuth(
                hintText: "Enter Your Item description",
                labelText: "items description",
                mycontroller: controller.itemDesController,
                validator: (val) => CheckEmpty(val)),
            CustomTextFormAuth(
                hintText: " أدخل وصف المنتج  ",
                labelText: "item arabic description",
                isarabic: true,
                mycontroller: controller.itemDesArabicController,
                validator: (val) => CheckEmpty(val)),
            CustomTextFormAuth(
                hintText: "Enter Your Item price",
                labelText: "items price",
                mycontroller: controller.itempriceController,
                isnumber: true,
                validator: (val) => CheckEmpty(val)),
            CustomTextFormAuth(
                hintText: "Enter Your Item discount",
                labelText: "items discount",
                mycontroller: controller.itemdiscountController,
                isnumber: true,
                validator: (val) => checkDiscount(val)),
            CustomTextFormAuth(
                hintText: "Enter Your Item count",
                labelText: "items count",
                mycontroller: controller.itemcountController,
                isnumber: true,
                validator: (val) => CheckEmpty(val)),
            CustomTextFormAuth(
                enable: false,
                AllOntap: () {
                  controller.showCategores();
                },
                hintText: "Select Your Item Categorie",
                labelText: "items Categorie",
                mycontroller: controller.itemscatController,
                isnumber: true,
                validator: (val) => CheckEmpty(val)),
                RadioListTile(
                                    activeColor: AppColor.secondarycolor,
                  title: Text('Hidden' , 
                  style: TextStyle(
                    color: controller.itemsActive== "0"? AppColor.secondarycolor : null
                  ),),
                  value: "0", groupValue: controller.itemsActive, onChanged: (value) {
                    controller.changeactiveStatues(value!) ; 
                },) ,
                RadioListTile(
                  activeColor:  Colors.green,
                  title: Text('Active' , 
                  style: TextStyle(
                    color: controller.itemsActive== "1"? Colors.green : null
                  ),),
                  value: "1", groupValue: controller.itemsActive, onChanged: (value) {
                    controller.changeactiveStatues(value!) ; 
                  
                },) ,

          ],
        ));
  }
}
