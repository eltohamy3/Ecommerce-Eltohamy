import 'package:eltohmayecommerceapp/controller/searchPageController.dart';
import 'package:eltohmayecommerceapp/core/class/crud.dart';
import 'package:eltohmayecommerceapp/core/class/statusrequest.dart';
import 'package:eltohmayecommerceapp/core/constant/routename.dart';
import 'package:eltohmayecommerceapp/core/function/handlingdata.dart';
import 'package:eltohmayecommerceapp/core/services/services.dart';
import 'package:eltohmayecommerceapp/data/datasource/remote/homeData.dart';
import 'package:eltohmayecommerceapp/data/datasource/remote/searchData.dart';
import 'package:eltohmayecommerceapp/data/model/categoriesModel.dart';
import 'package:eltohmayecommerceapp/data/model/itemsModel.dart';
import 'package:eltohmayecommerceapp/data/model/settingsTextModel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class HomeController extends SearchPageController {
  GoToItems(int selectedCat);
  logout();
  GoToProductDetails(ItemsModel itemsModel);
}

class HomeControllerImp extends HomeController {
  late MyServices myServices;
  SettingsTextModel settingsTextModel =
      SettingsTextModel(settingsTitle: "", settingsSubtitle: "");
  String? username;
  String itemsCategory = "Top Selling";
  late HomeData homeData;
  late StatusRequest statusRequest;

  List<CategoriesMOdel> CategoryData = [];
  List<ItemsModel> ItemsData = [];
  getData() async {
    // first give it value of this
    statusRequest = StatusRequest.loading;
    update();
    var responce = await homeData.PostHomeData();
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      if (responce['status'] == 'Success') {
        CategoryData.clear();
        ItemsData.clear();
        settingsTextModel =
            SettingsTextModel.fromJson(responce['data']['settings'][0]);
        responce['data']['categories'].forEach((element) {
          CategoryData.add(CategoriesMOdel.fromJson(element));
        });
        responce['data']['items'].forEach((element) {
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
    homeData = HomeData(crud: Crud());
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
  GoToProductDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoute.productDetails, arguments: {'itemsModel': itemsModel});
  }

  @override
  GoToItems(int selectedCat) {
    Get.toNamed(AppRoute.items,
        arguments: {'selectedCat': selectedCat, 'CategoryData': CategoryData});
  }
}
