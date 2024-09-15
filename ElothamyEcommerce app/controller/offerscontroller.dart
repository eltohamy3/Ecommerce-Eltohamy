import 'package:eltohmayecommerceapp/controller/searchPageController.dart';
import 'package:eltohmayecommerceapp/core/class/crud.dart';
import 'package:eltohmayecommerceapp/core/class/statusrequest.dart';
import 'package:eltohmayecommerceapp/core/constant/routename.dart';
import 'package:eltohmayecommerceapp/core/function/handlingdata.dart';
import 'package:eltohmayecommerceapp/core/services/services.dart';
import 'package:eltohmayecommerceapp/data/datasource/remote/offersData.dart';
import 'package:eltohmayecommerceapp/data/datasource/remote/searchData.dart';
import 'package:eltohmayecommerceapp/data/model/itemsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

abstract class OffersController extends SearchPageController {
  GotoProductDetails(ItemsModel itemsModel);
  logout();
}

class OffersControllerImp extends OffersController {
  late MyServices myServices;
  String itemsCategory = "Top Selling";
  late OffersData offersData;
  late StatusRequest statusRequest;

  List<ItemsModel> ItemsData = [];
  getData() async {
    // first give it value of this
    statusRequest = StatusRequest.loading;
    update();
    var responce = await offersData.PostOffersData();
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      if (responce['status'] == 'Success') {
        responce['data'].forEach((element) {
          ItemsData.add(ItemsModel.fromJson(element));
        });
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  logout() async {
    await myServices.sharedPreferences.setString('step', '1');
    Get.offAllNamed(AppRoute.login);
  }

  initialData() async {
    statusRequest = StatusRequest.loading;
    SearchStatusRequest = StatusRequest.loading;
    searchController = TextEditingController();
    update();
    offersData = OffersData(crud: Crud());
    searchData = SearchData(crud: Crud());
    myServices = Get.find();
    await getData();
  }

  @override
  void onInit() async {
    await initialData();
    super.onInit();
  }

  @override
  GotoProductDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoute.productDetails, arguments: {'itemsModel': itemsModel});
  }
}
