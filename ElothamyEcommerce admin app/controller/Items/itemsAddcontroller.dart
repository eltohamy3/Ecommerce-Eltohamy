import 'dart:io';

import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:eltohamyecommerceadminapp/controller/categories/categoriesviewcontroller.dart';
import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/controller/itemsViewController.dart';
import 'package:eltohamyecommerceadminapp/core/class/statusrequest.dart';
import 'package:eltohamyecommerceadminapp/core/function/alertexitapp.dart';
import 'package:eltohamyecommerceadminapp/core/function/handlingdata.dart';
import 'package:eltohamyecommerceadminapp/core/function/uploadfile.dart';
import 'package:eltohamyecommerceadminapp/data/datasource/remote/itemData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AddItemsController extends GetxController {}

class AddItemsControllerImp extends AddItemsController {
  late TextEditingController itemNameController;
  late TextEditingController itemNameArabicController;
  late TextEditingController itemDesController;
  late TextEditingController itemDesArabicController;
  late TextEditingController itempriceController;
  late TextEditingController itemcountController;
  late TextEditingController itemdiscountController;
  late TextEditingController itemscatController;
  String? itemscat;
  String? itemsActive = '1';
  late CategoriesViewControllerImp catcontroller;

  List<SelectedListItem> SelectedListList = [];

  GlobalKey<FormState> formkey = GlobalKey();
  File? myfile;
  ItemData itemsData = ItemData(crud: Crud());
  late StatusRequest statusRequest;

  changeactiveStatues(String val) {
    itemsActive = val;
    update();
  }

  uploadImage() async {
    UPloadImagFromCameraOrGalary(
      Get.context!,
      cameraOnclick: () async {
        statusRequest = StatusRequest.loading;
        Get.back();

        update();
        myfile = await ImageUploadCamera();
        statusRequest = StatusRequest.success;
        update();
      },
      galaryOnclick: () async {
        statusRequest = StatusRequest.loading;
        update();
        Get.back();

        myfile = await fileUploadGallery();
        statusRequest = StatusRequest.success;
        update();
      },
    );
  }

  showCategores() {
    DropDownState(
      DropDown(
        bottomSheetTitle: const Text(
          "Select Categoresy",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: SelectedListList,
        onSelected: (List<dynamic> selectedList) {
          // List<String> list = [];
          for (var item in selectedList) {
            if (item is SelectedListItem) {
              itemscat = item.value;
              itemscatController.text = item.name;
              // list.add(item.name);
            }
          }
          // showSnackBar(list.toString());
        },
        enableMultipleSelection: false,
      ),
    ).showModal(Get.context);
  }

  addItem() async {
    statusRequest = StatusRequest.loading;
    update();
    var responce = await itemsData.Postadditems({
      "items_name": itemNameController.text,
      "items_name_ar": itemNameArabicController.text,
      "items_desc_ar": itemDesArabicController.text,
      "items_desc": itemDesController.text,
      "items_count": itemcountController.text,
      "items_active": itemsActive,
      "items_price": itempriceController.text,
      "items_discount": itemdiscountController.text,
      "items_categories": itemscat,
    }, myfile!);
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in categotres view :  ${responce}');
      if (responce['status'] == 'Success') {
        showSuccessMassageWithOk(
          Get.context!,
          "Add Items",
          "Items was added successfully",
          () {},
          "Ok",
          (p0) async {
            Get.back();
            myItemsViewControllerImp itemsViewControllerImp = Get.find();
            await itemsViewControllerImp.GetItemsData();
          },
        );
      } else {
        showErrorMassage(
            Get.context!, "ADD Item", "Server Error while ADD the item");
      }
    } else {
      showErrorMassage(
          Get.context!, "ADD Item", "Server Error while ADD the item");
      statusRequest = StatusRequest.success;
    }
    update();
  }

  @override
  void onClose() {
    itemNameController.dispose();
    itemNameArabicController.dispose();
    itemDesController.dispose();
    itemDesArabicController.dispose();
    itemdiscountController.dispose();
    itempriceController.dispose();
    itemcountController.dispose();
    itemscatController.dispose();
    SelectedListList.clear();

    super.onClose();
  }

  addItembutton() async {
    if (formkey.currentState!.validate()) {
      if (myfile != null) {
        if (itemscat != null) {
          await addItem();
        } else {
          showErrorMassage(Get.context!, "Add items",
              "You should chose the items categorie");
        }
      } else {
        showErrorMassage(Get.context!, "Add items",
            "You should upload an image for the items");
      }
    }
  }

  initalSelectedList() {
    SelectedListList.clear();
    print("${SelectedListList.toString()} in the add controller ");
    catcontroller.categoriesList.forEach((element) {
      SelectedListList.add(SelectedListItem(
          name: "${element.categoriesName}", value: "${element.categoriesId}"));
    });
    print(
        "${SelectedListList.toString()} in the add controller after inalied ");
  }

  initalData() async {
    itemNameController = TextEditingController();
    itemNameArabicController = TextEditingController();
    itemDesController = TextEditingController();
    itemDesArabicController = TextEditingController();
    itemdiscountController = TextEditingController();
    itempriceController = TextEditingController();
    itemcountController = TextEditingController();
    itemscatController = TextEditingController();
    catcontroller = Get.put(CategoriesViewControllerImp());
    await catcontroller.GetCategoriesData();
    SelectedListList.clear();
    print('selected list cleared successfully');
    initalSelectedList();
  }

  @override
  void onInit() async {
    statusRequest = StatusRequest.loading;
    update();
    await initalData();
    statusRequest = StatusRequest.success;
    update();
    super.onInit();
  }
}
