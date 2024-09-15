
import 'package:eltohamyecommerceadminapp/core/constant/mycolors.dart';
import 'package:eltohamyecommerceadminapp/core/constant/routename.dart';
import 'package:eltohamyecommerceadminapp/core/function/handleOrder.dart';
import 'package:eltohamyecommerceadminapp/data/model/ontheWayOrderModel.dart';
import 'package:eltohamyecommerceadminapp/data/model/ordersModel.dart';
import 'package:eltohamyecommerceadminapp/view/widget/orders/cusotmorderText.dart';
import 'package:eltohamyecommerceadminapp/view/widget/orders/orderDetails/customOrderNumberRow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CustomArchivedCard extends StatelessWidget {
  final OnTheWayOrderModel onTheWayOrderModel;

  bool? isArchive = false;

  CustomArchivedCard({super.key, required this.onTheWayOrderModel, this.isArchive , thi});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CusotmOrderNumberRow(orderId: onTheWayOrderModel.ordersId!  , orderDatatime:  onTheWayOrderModel.ordersDatatime!),
            const SizedBox(
              height: 20,
            ),
            CustomOrderTextItem(
                "Order Type : " + HandelOrderType(onTheWayOrderModel.ordersTypes!)),
            CustomOrderTextItem(
                "Order Price : " + "${onTheWayOrderModel.ordersPrice}" + "\$"),
            CustomOrderTextItem("Delivery Price : " +
                "${onTheWayOrderModel.ordersPriceDelivery}" +
                "\$"),
            CustomOrderTextItem("Payemt Method : " +
                HandelPaymentMethod(onTheWayOrderModel.ordersPaymentmethod!)),
            CustomOrderTextItem("Order State : " +
                HandelOrdersState(onTheWayOrderModel.ordersStatus!)),
                if (onTheWayOrderModel.ordersRating !=null &&onTheWayOrderModel.ordersRating !=0 )
            CustomOrderTextItem("Orders Rating : " +
                "${onTheWayOrderModel.ordersRating}",) ,
                if (onTheWayOrderModel.ordersNoteRating !="none" )
            CustomOrderTextItem("Orders Rating note : " +
                "${onTheWayOrderModel.ordersNoteRating}",) ,
                if (onTheWayOrderModel.ordersStatus == 3 || (onTheWayOrderModel.ordersStatus == 4 && onTheWayOrderModel.ordersTypes==1))
            CustomOrderTextItem("Delevery Id : " +
                "${onTheWayOrderModel.deldeliveryId}",) ,
                if (onTheWayOrderModel.ordersStatus == 3 || (onTheWayOrderModel.ordersStatus == 4 && onTheWayOrderModel.ordersTypes==1))
            CustomOrderTextItem("Delevery Name : " +
                onTheWayOrderModel.deliveryName!,) ,
                if (onTheWayOrderModel.ordersStatus == 3 || (onTheWayOrderModel.ordersStatus == 4 && onTheWayOrderModel.ordersTypes==1))
            CustomOrderTextItem("Delevery phoneNumber : " +
                onTheWayOrderModel.deliveryPhoneNumber!,) ,
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Text(
                    'Total Price : ' + "${onTheWayOrderModel.ordersTotalPrice}\$",
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
                            arguments: {"ordersModel": OrdersModel.fromJson(onTheWayOrderModel.toJson())});
                      },
                      color: AppColor.thirdColor,
                      child: Text(
                        "Details",
                        style: TextStyle(color: AppColor.secondarycolor),
                      ),
                    ),
                    SizedBox(width: 5,) ,
                                    if (onTheWayOrderModel.ordersTypes == 1 &&
                    onTheWayOrderModel.ordersStatus == 3 &&
                    onTheWayOrderModel.addressLat != null)
                  MaterialButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.trakingOrders,
                          arguments: {"ordersModel": OrdersModel.fromJson(onTheWayOrderModel.toJson())});
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
