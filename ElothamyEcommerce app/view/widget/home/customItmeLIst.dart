import 'package:eltohmayecommerceapp/controller/homecontroller.dart';
import 'package:eltohmayecommerceapp/view/widget/home/itemView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomItemList extends StatelessWidget {
  const CustomItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Container(
              // to view the productes
              height: 200,
              child: ListView.builder(
                // separatorBuilder: (context, index) => SizedBox(width: 0,),
                itemCount: controller.ItemsData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ItemView(
                    itemsModel: controller.ItemsData[index],
                    onTap: () {
                      controller.GoToProductDetails(
                          controller.ItemsData[index]);
                    },
                  );
                },
              ),
            ));
  }
}
