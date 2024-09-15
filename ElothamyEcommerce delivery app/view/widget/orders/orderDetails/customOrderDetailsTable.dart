import 'package:eltohamyecommercedeliveryapp/controller/orders/orderDetailsController.dart';
import 'package:eltohamyecommercedeliveryapp/core/constant/mycolors.dart';
import 'package:eltohamyecommercedeliveryapp/core/function/translateDatabase.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/orders/orderDetails/customFirsRowText.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/orders/orderDetails/customcellRow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOrderDetailsTable extends GetView<OrderDetailsControllerImp> {
  const CustomOrderDetailsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        const TableRow(children: [
          CustomFristRowText(
            titel: "Product",
          ),
          CustomFristRowText(
            titel: "Quantity",
          ),
          CustomFristRowText(
            titel: "price",
          ),
        ]),
        ...List.generate(
            controller.OrderdetailsList.length,
            (index) => TableRow(children: [
                  CustomCellRow(
                      title: translateDataBase(
                          controller.OrderdetailsList[index].itemsName!,
                          controller.OrderdetailsList[index].itemsNameAr!)),
                  CustomCellRow(
                      title:
                          "${controller.OrderdetailsList[index].numberOfItems!}"),
                  CustomCellRow(
                      title:
                          "${controller.OrderdetailsList[index].priceOfItems}"),
                ])),
        TableRow(children: [
          const CustomCellRow(title: "Order Price  "),
          const CustomCellRow(title: ""),
          CustomCellRow(title: "${controller.ordersModel.ordersPrice}" + "\$"),
        ]),
        TableRow(children: [
          const CustomCellRow(title: "discount "),
          const CustomCellRow(title: ""),
          CustomCellRow(
              title:
                  "${100 - (controller.ordersModel.ordersTotalPrice! * 100 / (controller.ordersModel.ordersPrice! + controller.ordersModel.ordersPriceDelivery!))} \%"),
        ]),
        TableRow(children: [
          const Text(
            'Total Price ',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColor.secondarycolor,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          const Text(''),
          Text(
            "${controller.ordersModel.ordersTotalPrice}\$",
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColor.secondarycolor,
                fontFamily: "sans",
                fontSize: 16),
          )
        ]),
      ],
    );
  }
}
