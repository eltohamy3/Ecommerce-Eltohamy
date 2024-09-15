import 'package:cached_network_image/cached_network_image.dart';
import 'package:eltohmayecommerceapp/core/constant/linkApi.dart';
import 'package:eltohmayecommerceapp/data/model/itemsModel.dart';
import 'package:flutter/widgets.dart';

class CustomCachedImage extends StatelessWidget {
  final ItemsModel itemsModel;
  double? height;
   CustomCachedImage({super.key, required this.itemsModel , this.height});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
          tag: "${itemsModel.itemsId}",
          child: CachedNetworkImage(
            imageUrl: "${LinkAPI.ItemsImage}/${itemsModel.itemsImage}",
            height: height!=null? height: 120,
            fit: BoxFit.fill,
          )),
    );
  }
}
