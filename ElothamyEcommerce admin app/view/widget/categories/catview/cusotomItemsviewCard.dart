import 'package:cached_network_image/cached_network_image.dart';
import 'package:eltohamyecommerceadminapp/controller/categories/categoriesviewcontroller.dart';
import 'package:eltohamyecommerceadminapp/core/constant/linkApi.dart';
import 'package:eltohamyecommerceadminapp/core/constant/mycolors.dart';
import 'package:eltohamyecommerceadminapp/core/constant/routename.dart';
import 'package:eltohamyecommerceadminapp/core/function/translateDatabase.dart';
import 'package:eltohamyecommerceadminapp/data/model/categoriesModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomCatviewCard extends GetView<CategoriesViewControllerImp> {
  final CategoriesMOdel categoriesMOdel;
  const CustomCatviewCard({super.key, required this.categoriesMOdel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoute.categoriesEdit,
            arguments: {"categoryModel": categoriesMOdel});
      },
      child: Card(
        child: Container(
          padding: EdgeInsets.all(4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                    decoration: BoxDecoration(
                        // color: AppColor.categorycolor,
                        borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: 70,
                    width: 70,
                    child: categoriesMOdel.categoriesImage!.endsWith("svg")
                        ? SvgPicture.network(
                            "${LinkAPI.categoresImage}/${categoriesMOdel.categoriesImage}",
                          )
                        : CachedNetworkImage(
                            imageUrl:
                                "${LinkAPI.categoresImage}/${categoriesMOdel.categoriesImage}",
                          )),
              ),
              Expanded(
                flex: 3,
                child: ListTile(
                    subtitle: Text(
                      "${categoriesMOdel.categoriesDateTime}",
                      style: TextStyle(fontFamily: "sans"),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        controller.DeleteCategoesbutton(categoriesMOdel);
                      },
                      icon: Icon(Icons.delete_outline , color: AppColor.secondarycolor,),
                    ),
                    title: Text(
                        "${translateDataBase(categoriesMOdel.categoriesName!, categoriesMOdel.categoriesNameAr!)}")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
