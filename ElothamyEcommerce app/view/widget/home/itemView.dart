import 'package:cached_network_image/cached_network_image.dart';
import 'package:eltohmayecommerceapp/core/constant/linkApi.dart';
import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:eltohmayecommerceapp/core/function/translateDatabase.dart';
import 'package:eltohmayecommerceapp/data/model/itemsModel.dart';
import 'package:flutter/material.dart';

class ItemView extends StatelessWidget {
  final void Function()? onTap ;
  final ItemsModel itemsModel;

  ItemView({super.key, required this.itemsModel,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: const BoxDecoration(),
            child: Hero(
              tag: "${itemsModel.itemsId}",
              child: CachedNetworkImage(
                imageUrl: 
                "${LinkAPI.ItemsImage}/${itemsModel.itemsImage}",
                fit: BoxFit.fill,
                height: 100,
                width: 150,
              ),
            ),
          ),
          Container(
            height: 120,
            width: 200,
            decoration: BoxDecoration(
                color: AppColor.itemColor,
                borderRadius: BorderRadius.circular(20)),
          ),
          Positioned(
            child: Text(
              '${translateDataBase(itemsModel.itemsName! , itemsModel.itemsNameAr!)}',
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            ),
            top: 10,
            left: 10,
          )
        ],
      ),
    );
  }
}
