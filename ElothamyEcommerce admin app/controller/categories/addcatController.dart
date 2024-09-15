import 'dart:io';

import 'package:eltohamyecommerceadminapp/controller/categories/categoriesviewcontroller.dart';
import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/core/class/statusrequest.dart';
import 'package:eltohamyecommerceadminapp/core/function/alertexitapp.dart';
import 'package:eltohamyecommerceadminapp/core/function/handlingdata.dart';
import 'package:eltohamyecommerceadminapp/core/function/uploadfile.dart';
import 'package:eltohamyecommerceadminapp/data/datasource/remote/categoriesData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AddCategoresController extends GetxController {}

class AddCategoresControllerImp extends AddCategoresController {
  late TextEditingController catnameController;
  late TextEditingController catnameArabicController;
  GlobalKey<FormState> formkey = GlobalKey();
  File? myfile;
  CategoriesData categoriesData = CategoriesData(crud: Crud());
  late StatusRequest statusRequest;

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

  addCategory() async {
    statusRequest = StatusRequest.loading;
    update();
    var responce = await categoriesData.PostaddCategories({
      "categories_name": catnameController.text,
      "categories_name_ar": catnameArabicController.text
    }, myfile!);
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in categotres view :  ${responce}');
      if (responce['status'] == 'Success') {
        showSuccessMassageWithOk(
          Get.context!,
          "Add Categores",
          "Categores was added successfully",
          () {},
          "Ok",
          (p0) async {
            Get.back();
            CategoriesViewControllerImp categoriesViewControllerImp =
                Get.find();
            await categoriesViewControllerImp.GetCategoriesData();
          },
        );
      } else {
        showErrorMassage(Get.context!, "ADD Categores",
            "Server Error while ADD the Categores");
      }
    } else {
      showErrorMassage(Get.context!, "ADD Categores",
          "Server Error while ADD the Categores");
      statusRequest = StatusRequest.success;
    }
    update();
  }

  @override
  void onClose() {
    catnameController.dispose();
    catnameArabicController.dispose();
    super.onClose();
  }

  addcategorybutton() async {
    if (formkey.currentState!.validate()) {
      if (myfile != null) {
        await addCategory();
      } else {
        showErrorMassage(Get.context!, "Add Categories",
            "You should upload an image for the cat");
      }
    }
  }

  @override
  void onInit() async {
    statusRequest = StatusRequest.success;
    catnameController = TextEditingController();
    catnameArabicController = TextEditingController();
    super.onInit();
  }
}
