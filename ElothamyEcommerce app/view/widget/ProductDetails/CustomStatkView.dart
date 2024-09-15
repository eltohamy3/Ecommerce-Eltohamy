import 'package:cached_network_image/cached_network_image.dart';
import 'package:eltohmayecommerceapp/controller/productdeteilscontroller.dart';
import 'package:eltohmayecommerceapp/core/constant/linkApi.dart';
import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CustomStackView extends GetView<ProductDetailsControllerImp> {
  const CustomStackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          decoration: const BoxDecoration(color: AppColor.secondarycolor),
        ),
        Center(
          child: Hero(
            tag: "${controller.itemsModel.itemsId}",
            child: CachedNetworkImage(
              imageUrl:
                  "${LinkAPI.ItemsImage}/${controller.itemsModel.itemsImage}",
              height: 350,
              // fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
