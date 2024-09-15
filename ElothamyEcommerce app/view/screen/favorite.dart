import 'package:eltohmayecommerceapp/controller/myfavoriteController.dart';
import 'package:eltohmayecommerceapp/core/class/handlingDataView.dart';
import 'package:eltohmayecommerceapp/view/widget/favorite/customFavoriteGridview.dart';
import 'package:eltohmayecommerceapp/view/widget/home/appBar/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favorite extends GetView<MyFavoriteControllerImp> {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        controller.onFavoriteClose();
        return Future.value(false);
      },
      child: Scaffold(
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GetBuilder<MyFavoriteControllerImp>(
                builder: (controller) => ListView(
                      children: [
                        CustomAppBar(
                          titleAppBar: "Find Product",
                          onSearchIconPress: () {},
                          onChanged: (p0) {},
                          onFavouritIconPress: () {
                            controller.onFavoriteClose();
                          },
                          backIcon: Icons.arrow_back_outlined,
                          searchController: TextEditingController(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        HanddlingDataView(
                            statusRequest: controller.statusRequest,
                            widget: const CusotmFavoriteGridView())
                      ],
                    ))),
      ),
    );
  }
}
