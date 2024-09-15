import 'dart:io';

import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:eltohamyecommerceadminapp/controller/categories/categoriesviewcontroller.dart';
import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/core/class/statusrequest.dart';
import 'package:eltohamyecommerceadminapp/core/function/alertexitapp.dart';
import 'package:eltohamyecommerceadminapp/core/function/handlingdata.dart';
import 'package:eltohamyecommerceadminapp/core/function/uploadfile.dart';
import 'package:eltohamyecommerceadminapp/data/datasource/remote/itemData.dart';
import 'package:eltohamyecommerceadminapp/data/model/ItemsModel.dart';
import 'package:eltohamyecommerceadminapp/data/model/categoriesModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:eltohamyecommerceadminapp/controller/itemsViewController.dart';

abstract class EditItemsController extends GetxController {}

class EditItemsControllerImp extends EditItemsController {
  late ItemsModel itemsModel;
  late TextEditingController itemNameController;
  late TextEditingController itemNameArabicController;
  late TextEditingController itemDesController;
  late TextEditingController itemDesArabicController;
  late TextEditingController itempriceController;
  late TextEditingController itemcountController;
  late TextEditingController itemdiscountController;
  late TextEditingController itemscatController;
  String? itemscat;
  String? itemsActive ;
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

  EditItem() async {
    statusRequest = StatusRequest.loading;
    update();
    var responce = await itemsData.Postedititems({
      "items_name": itemNameController.text,
      "items_id": "${itemsModel.itemsId}",
      "items_name_ar": itemNameArabicController.text,
      "sendImage": myfile == null ? "false" : "true",
      "items_desc_ar": itemDesArabicController.text,
      "items_desc": itemDesController.text,
      "items_count": itemcountController.text,
      "items_active": itemsActive,
      "items_price": itempriceController.text,
      "items_discount": itemdiscountController.text,
      "items_categories": itemscat,
      "imageoldname": itemsModel.itemsImage,
    }, myfile);
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in Edit items  :  ${responce}');
      if (responce['status'] == 'Success') {
        showSuccessMassageWithOk(
          Get.context!,
          "Edit Item",
          "Item was Edited successfully",
          () {},
          "Ok",
          (p0) async {
            Get.back();
            myItemsViewControllerImp ItemssViewControllerImp = Get.find();
            await ItemssViewControllerImp.GetItemsData();
          },
        );
      } else {
        showErrorMassage(
            Get.context!, "Edit Item", "Server Error while Editing the Item");
      }
    } else {
      showErrorMassage(
          Get.context!, "Edit Item", "Server Error while Editing the Item");
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

    super.onClose();
  }

  Edititembutton() async {
    if (formkey.currentState!.validate()) {
      await EditItem();
    }
  }

  bool checkSelected(CategoriesMOdel element) {
    if (element.categoriesId.toString() == itemscat) {
      itemscatController.text = element.categoriesName!;
      return true;
    }
    return false;
  }

  initalSelectedList() {
    SelectedListList.clear();
    print("${SelectedListList} in the add controller ");
    catcontroller.categoriesList.forEach((element) {
      SelectedListList.add(SelectedListItem(
          isSelected: checkSelected(element),
          name: "${element.categoriesName}",
          value: "${element.categoriesId}"));
    });
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
  initalData() async {
    itemNameController = TextEditingController();
    itemNameArabicController = TextEditingController();
    itemDesController = TextEditingController();
    itemDesArabicController = TextEditingController();
    itemdiscountController = TextEditingController();
    itempriceController = TextEditingController();
    itemcountController = TextEditingController();
    itemscatController = TextEditingController();
    itemsModel = Get.arguments['itemsModel'];
    itemNameController.text = itemsModel.itemsName!;
    itemNameArabicController.text = itemsModel.itemsNameAr!;
    itemDesController.text = itemsModel.itemsDesc!;
    itemDesArabicController.text = itemsModel.itemsDescAr!;
    itemdiscountController.text = "${itemsModel.itemsDiscount}";
    itempriceController.text = "${itemsModel.itemsPrice}";
    itemcountController.text = "${itemsModel.itemsCount}";
    itemscat = itemsModel.itemsCategories.toString();
    itemsActive = itemsModel.itemsActive!.toString();
    catcontroller = Get.put(CategoriesViewControllerImp());
    await catcontroller.GetCategoriesData();
    print("${catcontroller.categoriesList.toString()}");
    SelectedListList.clear(); 
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
