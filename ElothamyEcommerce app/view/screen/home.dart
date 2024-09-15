import 'package:eltohmayecommerceapp/controller/homecontroller.dart';
import 'package:eltohmayecommerceapp/core/class/handlingDataView.dart';
import 'package:eltohmayecommerceapp/core/constant/routename.dart';
import 'package:eltohmayecommerceapp/view/widget/home/appBar/CustomAppBar.dart';
import 'package:eltohmayecommerceapp/view/widget/home/customCardHome.dart';
import 'package:eltohmayecommerceapp/view/widget/home/customCategoresText.dart';
import 'package:eltohmayecommerceapp/view/widget/home/customCategoryList.dart';
import 'package:eltohmayecommerceapp/view/widget/home/customItmeLIst.dart';
import 'package:eltohmayecommerceapp/view/widget/home/itemsCategory.dart';
import 'package:eltohmayecommerceapp/view/widget/home/search/CustomSearchList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(children: [
                CustomAppBar(
                  onFavouritIconPress: () {
                    Get.toNamed(AppRoute.favoritePage, arguments: {
                      "lastPage":0
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
                HanddlingDataView(
                    statusRequest: controller.isSearch
                        ? controller.SearchStatusRequest
                        : controller.statusRequest,
                    widget: controller.isSearch
                        ? Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              CustomSearchList(
                                  SearchList: controller.SearchList)
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomCardHome(
                                subtile:
                                    '${controller.settingsTextModel.settingsSubtitle}',
                                title:
                                    '${controller.settingsTextModel.settingsTitle}',
                              ),
                              CustomCategoresText(),
                              CustomCategoresList(),
                              CustomItemsCategory(),
                              CustomItemList()
                            ],
                          ))
              ]),
            ));
  }
}
