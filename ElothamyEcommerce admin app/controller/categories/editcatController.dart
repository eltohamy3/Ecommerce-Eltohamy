import 'dart:io';

import 'package:eltohamyecommerceadminapp/controller/categories/categoriesviewcontroller.dart';
import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/core/class/statusrequest.dart';
import 'package:eltohamyecommerceadminapp/core/function/alertexitapp.dart';
import 'package:eltohamyecommerceadminapp/core/function/handlingdata.dart';
import 'package:eltohamyecommerceadminapp/core/function/uploadfile.dart';
import 'package:eltohamyecommerceadminapp/data/datasource/remote/categoriesData.dart';
import 'package:eltohamyecommerceadminapp/data/model/categoriesModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class EditCategorieController extends GetxController {}

class EditCategorieControllerImp extends EditCategorieController {
  late CategoriesMOdel categoriesMOdel;

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

  EditCategory() async {
    statusRequest = StatusRequest.loading;
    update();
    var responce = await categoriesData.PosteditCategories({
      "categories_name": catnameController.text,
      "categories_name_ar": catnameArabicController.text,
      "sendImage": myfile == null ? "false" : "true",
      "imageoldname": categoriesMOdel.categoriesImage,
      "categories_id": "${categoriesMOdel.categoriesId}"
    }, myfile);
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in Edit Cat view :  ${responce}');
      if (responce['status'] == 'Success') {
        showSuccessMassageWithOk(
          Get.context!,
          "Edit Categores",
          "Categores was Edited successfully",
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
        showErrorMassage(Get.context!, "Edit Categores",
            "Server Error while Editing the Categores");
      }
    } else {
      showErrorMassage(Get.context!, "Edit Categores",
          "Server Error while Editing the Categores");
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

  Editcategorybutton() async {
    if (formkey.currentState!.validate()) {
      await EditCategory();
    }
  }

  @override
  void onInit() async {
    statusRequest = StatusRequest.success;
    catnameController = TextEditingController();
    catnameArabicController = TextEditingController();
    categoriesMOdel = Get.arguments['categoryModel'];
    catnameController.text = categoriesMOdel.categoriesName!;
    catnameArabicController.text = categoriesMOdel.categoriesNameAr!;
    super.onInit();
  }
}
