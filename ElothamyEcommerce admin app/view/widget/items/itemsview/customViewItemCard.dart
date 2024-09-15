import 'package:cached_network_image/cached_network_image.dart';
import 'package:eltohamyecommerceadminapp/controller/itemsViewController.dart';
import 'package:eltohamyecommerceadminapp/core/constant/linkApi.dart';
import 'package:eltohamyecommerceadminapp/core/constant/mycolors.dart';
import 'package:eltohamyecommerceadminapp/core/constant/routename.dart';
import 'package:eltohamyecommerceadminapp/core/function/translateDatabase.dart';
import 'package:eltohamyecommerceadminapp/data/model/ItemsModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CusotmItemsViewCard extends GetView<myItemsViewControllerImp> {
  ItemsModel itemsModel; 
   CusotmItemsViewCard({super.key , required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        Get.toNamed(AppRoute.itemsEdit,
            arguments: {"itemsModel": itemsModel});
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
                    child: itemsModel.itemsImage!.endsWith("svg")
                        ? SvgPicture.network(
                            "${LinkAPI.ItemsImage}/${itemsModel.itemsImage}",
                          )
                        : CachedNetworkImage(
                            imageUrl:
                                "${LinkAPI.ItemsImage}/${itemsModel.itemsImage}",
                          )),
              ),
              Expanded(
                flex: 3,
                child: ListTile(
                    subtitle: Text(
                      "${itemsModel.itemsDate}",
                      style: TextStyle(fontFamily: "sans"),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        controller.Deleteitemsbutton(itemsModel);
                      },
                      icon: Icon(Icons.delete_outline , color: AppColor.secondarycolor,),
                    ),
                    title: Text(
                        "${translateDataBase(itemsModel.itemsName!, itemsModel.itemsNameAr!)}")),
              )
            ],
          ),
        ),
      ),
    );
  }
}