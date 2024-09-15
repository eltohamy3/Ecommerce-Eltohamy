import 'package:eltohamyecommerceadminapp/controller/orders/orderDetailsController.dart';
import 'package:eltohamyecommerceadminapp/core/class/handlingDataView.dart';
import 'package:eltohamyecommerceadminapp/core/function/handleOrder.dart';
import 'package:eltohamyecommerceadminapp/view/widget/orders/cusotmorderText.dart';
import 'package:eltohamyecommerceadminapp/view/widget/orders/customOrdersAppbar.dart';
import 'package:eltohamyecommerceadminapp/view/widget/orders/orderDetails/customOrderDetailsTable.dart';
import 'package:eltohamyecommerceadminapp/view/widget/orders/orderDetails/customOrderNumberRow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomOrdersAppBar(pageName: "Orders Details"),
      body: GetBuilder<OrderDetailsControllerImp>(
        builder: (controller) => HanddlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: ListView(
              children: [
                Card(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CusotmOrderNumberRow(
                            orderDatatime:controller.ordersModel.ordersDatatime! ,
                            orderId:controller.ordersModel.ordersId! ,
                              ),
                          const SizedBox(
                            height: 10,
                          ),
                          // ignore: prefer_interpolation_to_compose_strings
                          CustomOrderTextItem("Order Type : " +
                              HandelOrderType(
                                  controller.ordersModel.ordersTypes!)),
                          // ignore: prefer_interpolation_to_compose_strings
                          CustomOrderTextItem("Delivery Price : " +
                              "${controller.ordersModel.ordersPriceDelivery}" +
                              "\$"),
                          // ignore: prefer_interpolation_to_compose_strings
                          CustomOrderTextItem("Payemt Method : " +
                              HandelPaymentMethod(
                                  controller.ordersModel.ordersPaymentmethod!)),
                          // ignore: prefer_interpolation_to_compose_strings
                          CustomOrderTextItem("Order State : " +
                              HandelOrdersState(
                                  controller.ordersModel.ordersStatus!)),
                         // ignore: prefer_interpolation_to_compose_strings
                         controller.ordersModel.addressName!=null? CustomOrderTextItem("Shipping Address : " +
                              controller.ordersModel.addressName!): const SizedBox(height: 0,), 
                         controller.ordersModel.ordersRating!=0? CustomOrderTextItem("Your Order Rating: " +
                              "${controller.ordersModel.ordersRating}"): const SizedBox(height: 0,), 
                          const SizedBox(
                            height: 20,
                          ),
                          const CustomOrderDetailsTable()
                        ],
                      ),
                    ),
                  ),
                ),
                                SizedBox(height: 5,) ,
                controller.ordersModel.ordersTypes==1 && controller.ordersModel.ordersStatus != 4  && controller.ordersModel.addressLat!=null ?
                                 Card(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Container(
                                                      height: 300 ,
                                                      width: Get.width,
                                                      child: GoogleMap(
                                                        markers: controller.markers.toSet(),
                                                        mapType: MapType.hybrid,
                                                        initialCameraPosition: controller.mycurrentCameraPostion,
                                                        onMapCreated: (GoogleMapController mycontroller) {
                                                          controller.googleMapController = mycontroller;
                                                        },
                                                      ),
                                                    ),
                                  ),
                                ) :SizedBox(height: 0,)
                // Card(
                //   child: Container(
                //     child:  ListTile(
                //       title: Text(
                //         'Shipping Address',
                //         style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             color: AppColor.secondarycolor,
                //             fontSize: 19),
                //       ),
                //       subtitle: Text(
                //         "${controller.ordersModel.addressName}",
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
