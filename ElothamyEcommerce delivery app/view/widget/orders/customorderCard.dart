
import 'package:eltohamyecommercedeliveryapp/core/constant/mycolors.dart';
import 'package:eltohamyecommercedeliveryapp/core/constant/routename.dart';
import 'package:eltohamyecommercedeliveryapp/core/function/handleOrder.dart';
import 'package:eltohamyecommercedeliveryapp/data/model/ordersModel.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/orders/cusotmorderText.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/orders/orderDetails/customOrderNumberRow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOrderCard extends StatelessWidget {
  final OrdersModel ordersModel;
  void Function()? approveOnpress;
  void Function()? doneOnpress;

  bool? isArchive = false;

  CustomOrderCard({super.key, required this.ordersModel, this.isArchive , this.approveOnpress, this.doneOnpress});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CusotmOrderNumberRow(ordersModel: ordersModel),
            const SizedBox(
              height: 20,
            ),
            CustomOrderTextItem(
                "Order Type : " + HandelOrderType(ordersModel.ordersTypes!)),
            CustomOrderTextItem(
                "Order Price : " + "${ordersModel.ordersPrice}" + "\$"),
            CustomOrderTextItem("Delivery Price : " +
                "${ordersModel.ordersPriceDelivery}" +
                "\$"),
            CustomOrderTextItem("Payemt Method : " +
                HandelPaymentMethod(ordersModel.ordersPaymentmethod!)),
            CustomOrderTextItem("Order State : " +
                HandelOrdersState(ordersModel.ordersStatus!)),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Text(
                    'Total Price : ' + "${ordersModel.ordersTotalPrice}\$",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.secondarycolor,
                        fontSize: 16),
                  ),
                ),
                Row(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Get.toNamed(AppRoute.orderDetails,
                            arguments: {"ordersModel": ordersModel});
                      },
                      color: AppColor.thirdColor,
                      child: Text(
                        "Details",
                        style: TextStyle(color: AppColor.secondarycolor),
                      ),
                    ),
                    SizedBox(width: 5,) ,
                    if (ordersModel.ordersStatus==2 ||ordersModel.ordersStatus==3 )
                    MaterialButton(
                      onPressed: ordersModel.ordersStatus==2? approveOnpress:doneOnpress ,
                      color: AppColor.thirdColor,
                      child: Text(
                        ordersModel.ordersStatus==2? "Approve":"Done" ,
                        style: TextStyle(color: AppColor.secondarycolor),
                      ),
                    ),


                    
                    SizedBox(
                      width: 5,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
