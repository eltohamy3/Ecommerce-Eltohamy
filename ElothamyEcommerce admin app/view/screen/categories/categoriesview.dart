import 'package:eltohamyecommerceadminapp/controller/categories/categoriesviewcontroller.dart';
import 'package:eltohamyecommerceadminapp/core/class/handlingDataView.dart';
import 'package:eltohamyecommerceadminapp/core/constant/routename.dart';

import 'package:eltohamyecommerceadminapp/view/widget/categories/catview/cusotmfloataction.dart';
import 'package:eltohamyecommerceadminapp/view/widget/categories/catview/cusotomItemsviewCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CusotomFloatActionbutton(
        onPressed: () {
          Get.toNamed(AppRoute.categoriesAdd);
        },
      ),
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: GetBuilder<CategoriesViewControllerImp>(
        init: CategoriesViewControllerImp(),
        builder: (controller) => HanddlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsets.all(20),
            child: ListView(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.categoriesList.length,
                    itemBuilder: (context, index) => CustomCatviewCard(
                          categoriesMOdel: controller.categoriesList[index],
                        ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
