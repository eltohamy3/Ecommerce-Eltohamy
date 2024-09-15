import 'package:eltohmayecommerceapp/controller/searchPageController.dart';
import 'package:eltohmayecommerceapp/core/class/crud.dart';
import 'package:eltohmayecommerceapp/core/class/statusrequest.dart';
import 'package:eltohmayecommerceapp/core/constant/routename.dart';
import 'package:eltohmayecommerceapp/core/function/handlingdata.dart';
import 'package:eltohmayecommerceapp/data/datasource/remote/itemsData.dart';
import 'package:eltohmayecommerceapp/data/datasource/remote/searchData.dart';
import 'package:eltohmayecommerceapp/data/model/categoriesModel.dart';
import 'package:eltohmayecommerceapp/data/model/itemsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends SearchPageController {
  changPage(int selectedCat);
  GoToProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController {
  late List<CategoriesMOdel> CategoryData;
  List<ItemsModel> itemsList = [];
  List<ItemsModel> viewEdItems = [];

  late int selectedCatID;

  late ItemsData itemsData;
  late StatusRequest statusRequest;

  intialData() {
    statusRequest = StatusRequest.loading;

    CategoryData = Get.arguments['CategoryData'];
    selectedCatID = Get.arguments['selectedCat'];
    itemsData = ItemsData(crud: Crud());
    SearchStatusRequest = StatusRequest.loading;
    searchData = SearchData(crud: Crud());
    searchController = TextEditingController();

  }

  getData() async {
    viewEdItems.clear();
    // first give it value of this
    statusRequest = StatusRequest.loading;
    update();
    var responce = await itemsData.PostItemsData(selectedCatID);
    statusRequest = handleData(responce);
    
    if (statusRequest == StatusRequest.success) {
      if (responce['status'] == 'Success') {
        print(responce);
        responce['data'].forEach((element) {

          viewEdItems.add(ItemsModel.fromJson(element));
        });
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  @override
  void onInit() async {
    intialData();
    await getData();
    // UpdateViewedList();
    super.onInit();
  }

  UpdateViewedList() {
    viewEdItems = itemsList
        .where((element) => (element.categoriesId! - 1) == selectedCatID)
        .toList();
  }

  @override
  changPage(int selectedCat) async {
    this.selectedCatID = selectedCat;
    await getData();
    // UpdateViewedList();
    update();
  }

  @override
  GoToProductDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoute.productDetails, arguments: {'itemsModel': itemsModel});
  }
}
