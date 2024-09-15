import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:eltohmayecommerceapp/core/function/translateDatabase.dart';
import 'package:eltohmayecommerceapp/data/model/itemsModel.dart';
import 'package:flutter/widgets.dart';

class CustomItemsName extends StatelessWidget {
  final ItemsModel itemsModel;
  const CustomItemsName({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${translateDataBase(itemsModel.itemsName!, itemsModel.itemsNameAr!)}',
      style: TextStyle(
          color: AppColor.black,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow
              .ellipsis, // Adds '...' at the end if the text is too long

          fontSize: 16),
      maxLines: 1, // Ensures the text is limited to one line
      softWrap: false, // Prevents wrapping to the next line
    );
  }
}
