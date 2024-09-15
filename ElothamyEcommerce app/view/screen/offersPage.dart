import 'package:eltohmayecommerceapp/controller/favoriteController.dart';
import 'package:eltohmayecommerceapp/controller/offerscontroller.dart';
import 'package:eltohmayecommerceapp/core/class/handlingDataView.dart';
import 'package:eltohmayecommerceapp/core/constant/routename.dart';
import 'package:eltohmayecommerceapp/view/widget/home/appBar/CustomAppBar.dart';
import 'package:eltohmayecommerceapp/view/widget/home/offersPage/customOfferCard.dart';
import 'package:eltohmayecommerceapp/view/widget/home/search/CustomSearchList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteControllerImp Favcontroller = Get.put(FavoriteControllerImp());

    return GetBuilder<OffersControllerImp>(
      init: OffersControllerImp(),
      builder: (controller) => Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            CustomAppBar(
                                onFavouritIconPress: () {
                    Get.toNamed(AppRoute.favoritePage, arguments: {
                      "lastPage":2
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
                          CustomSearchList(SearchList: controller.SearchList)
                        ],
                      )
                    : Column(
                      children:[
                        SizedBox(height: 20,) ,
                        
                         ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.ItemsData.length,
                          itemBuilder: (context, index) {
                            Favcontroller.inializeIsFavorite(
                                controller.ItemsData[index].itemsId!,
                                controller.ItemsData[index].Favorite!);
                            return CustomOffersCard(
                                itemsModel: controller.ItemsData[index]);
                          },
                        ),]
                    ))
          ],
        ),
      ),
    );
  }
}
