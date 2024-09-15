import 'package:eltohmayecommerceapp/controller/itemscontroller.dart';
import 'package:eltohmayecommerceapp/core/function/translateDatabase.dart';
import 'package:eltohmayecommerceapp/data/model/categoriesModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCategoryItemsView extends GetView<ItemsControllerImp> {
  final CategoriesMOdel categoriesMOdel;

  const CustomCategoryItemsView(
      {super.key, required this.categoriesMOdel, });

  @override
  Widget build(BuildContext context) {
    return  InkWell(
              onTap: () {
                print("page changed"); 
                controller.changPage(categoriesMOdel.categoriesId!);
              },
                child: Column(
                  children: [
                    Container(
                        width: 75,
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          "${translateDataBase(categoriesMOdel.categoriesName! , categoriesMOdel.categoriesNameAr!)}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 19,
                            
                          ),
                        )),
                    Container(
                      width: 75,
                      margin: EdgeInsets.only(top: 3),

                      height: 3,
                      // padding: EdgeInsets.symmetric(horizontal: 5),
                      // child: Container(
                      color:
                          controller.selectedCatID == categoriesMOdel.categoriesId ? Colors.red : null,
                    )
                  ],
                ),
              
            );
  }
}
