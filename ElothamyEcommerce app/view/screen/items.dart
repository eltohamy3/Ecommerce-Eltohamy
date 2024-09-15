import 'package:eltohmayecommerceapp/controller/homecontroller.dart';
import 'package:eltohmayecommerceapp/controller/itemscontroller.dart';
import 'package:eltohmayecommerceapp/core/class/handlingDataView.dart';
import 'package:eltohmayecommerceapp/core/constant/routename.dart';
import 'package:eltohmayecommerceapp/view/widget/home/appBar/CustomAppBar.dart';
import 'package:eltohmayecommerceapp/view/widget/home/search/CustomSearchList.dart';
import 'package:eltohmayecommerceapp/view/widget/items/CustomItmesList.dart';
import 'package:eltohmayecommerceapp/view/widget/items/customItemsGridview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends GetView<ItemsControllerImp> {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            CustomAppBar(
                                onFavouritIconPress: () {
                    Get.toNamed(AppRoute.favoritePage, arguments: {
                      "lastPage":1
                    });
                  },

              titleAppBar: "Find Product",
              onSearchIconPress: () {
                controller.onSearchIconCLick();
              },
              onChanged: (val) {
                controller.checkSearch(val);
              },
              searchController: controller.searchController,
            ),
            SizedBox(height: 25),
            GetBuilder<ItemsControllerImp>(builder: (controller) => 
            controller.isSearch
                ? HanddlingDataView(
                    statusRequest: controller.SearchStatusRequest,
                    widget: CustomSearchList(SearchList: controller.SearchList))
                : Column(
                    children: [
                      CustomCategoryItemList(),
                      SizedBox(
                        height: 20,
                      ),
                      GetBuilder<ItemsControllerImp>(
                          builder: (controller) => HanddlingDataView(
                              statusRequest: controller.statusRequest,
                              widget: CustomItemsGridView()))
                    ],
                  ))
          ],
        ),
      ),
    );
  }
}
