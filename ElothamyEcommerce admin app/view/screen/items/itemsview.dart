import 'package:eltohamyecommerceadminapp/controller/itemsViewController.dart';
import 'package:eltohamyecommerceadminapp/core/class/handlingDataView.dart';
import 'package:eltohamyecommerceadminapp/core/constant/routename.dart';
import 'package:eltohamyecommerceadminapp/view/widget/categories/catview/cusotmfloataction.dart';
import 'package:eltohamyecommerceadminapp/view/widget/items/itemsview/customViewItemCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CusotomFloatActionbutton(
        onPressed: () {
          Get.toNamed(AppRoute.itemsAdd);
        },
      ),
      appBar: AppBar(
        title: Text('Items'),
      ),
      body: GetBuilder<myItemsViewControllerImp>(
        init: myItemsViewControllerImp(),
        builder: (controller) => HanddlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsets.all(20),
            child: ListView(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.ItemsList.length,
                    itemBuilder: (context, index) => CusotmItemsViewCard(
                          itemsModel: controller.ItemsList[index],
                        ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
