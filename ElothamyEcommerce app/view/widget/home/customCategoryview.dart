import 'package:eltohmayecommerceapp/controller/homecontroller.dart';
import 'package:eltohmayecommerceapp/core/constant/linkApi.dart';
import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:eltohmayecommerceapp/core/function/translateDatabase.dart';
import 'package:eltohmayecommerceapp/data/model/categoriesModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomCategoryView extends GetView<HomeControllerImp> {
  final CategoriesMOdel categoriesMOdel;
  final void Function()? onTap;

  const CustomCategoryView(
      {super.key, required this.onTap, required this.categoriesMOdel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: InkWell(
        onTap: ()=>  controller.GoToItems(categoriesMOdel.categoriesId!) 
        ,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColor.categorycolor,
                  borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: 70,
              width: 70,
              child:categoriesMOdel.categoriesImage!.endsWith("svg")?SvgPicture.network(
                  "${LinkAPI.categoresImage}/${categoriesMOdel.categoriesImage}",
                  color: AppColor.secondarycolor,
                ):CachedNetworkImage(
                  color: AppColor.secondarycolor,
                  imageUrl:                   "${LinkAPI.categoresImage}/${categoriesMOdel.categoriesImage}",
                )
            ),
            Container(
                width: 70,
                margin: const EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                child: Text(
                  "${translateDataBase(categoriesMOdel.categoriesName! , categoriesMOdel.categoriesNameAr!)}",
                  style: const TextStyle(fontSize: 15),
                ))
          ],
        ),
      ),
    );
  }
}
