import 'package:cached_network_image/cached_network_image.dart';
import 'package:eltohamyecommerceadminapp/controller/items/itemsEditcontroller.dart';
import 'package:eltohamyecommerceadminapp/core/constant/linkApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomItemHandelImage extends GetView<EditItemsControllerImp> {
   CustomItemHandelImage({super.key });

  @override
  Widget build(BuildContext context) {
    return controller.myfile != null
        ? Container(
            height: 250,
            child: controller.myfile!.path.endsWith("svg")
                ? SvgPicture.file(controller.myfile!)
                : Image.file(controller.myfile!))
        : Container(
            height: 250,
            child: controller.itemsModel.itemsImage!.endsWith("svg")
                ? SvgPicture.network(
                    "${LinkAPI.ItemsImage}/${controller.itemsModel.itemsImage}",
                  )
                : CachedNetworkImage(
                    imageUrl:
                    "${LinkAPI.ItemsImage}/${controller.itemsModel.itemsImage}",
                  ),
          );
  }
}
