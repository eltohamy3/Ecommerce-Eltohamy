import 'package:eltohmayecommerceapp/controller/orders/pendingOrdersController.dart';
import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:eltohmayecommerceapp/core/constant/routename.dart';
import 'package:eltohmayecommerceapp/core/function/handleOrder.dart';
import 'package:eltohmayecommerceapp/data/model/ordersModel.dart';
import 'package:eltohmayecommerceapp/view/screen/orders/orderDetails.dart';
import 'package:eltohmayecommerceapp/view/widget/orders/cusotmorderText.dart';
import 'package:eltohmayecommerceapp/view/widget/orders/orderDetails/customOrderNumberRow.dart';
import 'package:eltohmayecommerceapp/view/widget/orders/orderRating.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOrderCard extends GetView<PendingOrdersControllerImp> {
  final OrdersModel ordersModel;
  bool? isArchive = false;
   CustomOrderCard({super.key, required this.ordersModel , this.isArchive});

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
                    SizedBox(
                      width: 5,
                    ),
                    if (isArchive != true && ordersModel.ordersStatus ==0)
                      MaterialButton(
                      onPressed: () {
                        controller.checkOrderDelete(ordersModel.ordersId!);
                      },
                      color: AppColor.thirdColor,
                      child: Text(
                        "Delete",
                        style: TextStyle(color: AppColor.secondarycolor),
                      ),
                    )
                    else if (isArchive == true && ordersModel.ordersRating==0)
                      MaterialButton(
                      onPressed: () {
    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => CustomRating(
        orderid:ordersModel.ordersId!,
      ),
    );
                      },
                      color: AppColor.thirdColor,
                      child: Text(
                        "Rating",
                        style: TextStyle(color: AppColor.secondarycolor),
                      ),
                    ),
                                    if (ordersModel.ordersTypes == 1 &&
                    ordersModel.ordersStatus == 3 &&
                    ordersModel.addressLat != null)
                  MaterialButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.trakingOrders,
                          arguments: {"ordersModel": ordersModel});
                    },
                    color: AppColor.thirdColor,
                    child: Text(
                      "Tracking",
                      style: TextStyle(color: AppColor.secondarycolor),
                    ),
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
