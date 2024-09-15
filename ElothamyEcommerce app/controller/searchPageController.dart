import 'package:eltohmayecommerceapp/core/class/crud.dart';
import 'package:eltohmayecommerceapp/core/class/statusrequest.dart';
import 'package:eltohmayecommerceapp/core/function/handlingdata.dart';
import 'package:eltohmayecommerceapp/data/datasource/remote/searchData.dart';
import 'package:eltohmayecommerceapp/data/model/itemsModel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


 abstract  class SearchPageController extends GetxController {
  bool isSearch = false;
  List<ItemsModel> SearchList = [];

  late SearchData searchData;
  late StatusRequest SearchStatusRequest;
  late TextEditingController searchController;

  // search Function
  checkSearch(String val) {
    if (val == "") {
      isSearch = false;
      update();
    }
  }

  GetSearchData() async {
    SearchList.clear();
    SearchStatusRequest = StatusRequest.loading;
    update();
    var responce = await searchData.PostSearchData(searchController.text);
    SearchStatusRequest = handleData(responce);
    if (SearchStatusRequest == StatusRequest.success) {
      if (responce['status'] == 'Success') {
        responce['data'].forEach((element) {
          SearchList.add(ItemsModel.fromJson(element));
        });
      } else {
        SearchStatusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  onSearchIconCLick() {
    isSearch = true;
    GetSearchData();
  }


}
