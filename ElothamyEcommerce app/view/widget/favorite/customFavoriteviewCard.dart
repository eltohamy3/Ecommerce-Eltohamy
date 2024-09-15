import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:eltohmayecommerceapp/data/model/itemsModel.dart';
import 'package:eltohmayecommerceapp/view/widget/favorite/cusotmFavoritePriceandRemoce.dart';
import 'package:eltohmayecommerceapp/view/widget/favorite/customRating.dart';
import 'package:eltohmayecommerceapp/view/widget/favorite/customitemName.dart';
import 'package:eltohmayecommerceapp/view/widget/items/customCachedNetwork.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomFavoriteViewCard extends StatelessWidget {
  final ItemsModel itemsModel;
  const CustomFavoriteViewCard({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: AppColor.white, // the color of the card
      color: AppColor.white,

      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CustomCachedImage(
                itemsModel: itemsModel,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            CustomItemsName(
              itemsModel: itemsModel,
            ),
            SizedBox(
              height: 10,
            ),
            CustomRatingRow(),
            CusotmPriceAndRemoceRow(
              itemsModel: itemsModel,
            )
          ],
        ),
      ),
    );
  }
}
