import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:eltohmayecommerceapp/data/model/itemsModel.dart';
import 'package:flutter/widgets.dart';

class CustomTextPrice extends StatelessWidget {
  final ItemsModel itemsModel;
  const CustomTextPrice({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${itemsModel.priceAfterDiscount}\$",
          style: const TextStyle(
              color: AppColor.secondarycolor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              fontFamily: "sans"),
        ),
        itemsModel.itemsDiscount!>0 ?
        SizedBox(width: 6,): SizedBox(width: 1,) ,
        itemsModel.itemsDiscount!>0 ?

        Text(

          "${itemsModel.itemsPrice}\$",
          style:  TextStyle(
              color: AppColor.wightGrey,
              decoration: TextDecoration.lineThrough,
              
              fontSize: 16,
              fontFamily: "sans"),
        ):Text("")

      ],
    );
  }
}
