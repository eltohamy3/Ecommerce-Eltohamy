import 'package:eltohamyecommerceadminapp/controller/delivery/deliveryViewController.dart';
import 'package:eltohamyecommerceadminapp/data/model/deliveryModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


// ignore: must_be_immutable
class CustomDeliveryViewCard extends GetView<DeliveryViewControllerImp> {
  DeliveryModel deliveryModel;
  CustomDeliveryViewCard({super.key, required this.deliveryModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.GoToDeliveryOrders(deliveryModel);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ListTile(
          title: Text(deliveryModel.deliveryName!,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Id :  ${deliveryModel.deliveryId}") ,
              Text("Email : "  +deliveryModel.deliveryEmail!),
              Text("PhoneNumber : " + deliveryModel.deliveryPhoneNumber!),
            ],
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.red),
            onPressed: () {
              controller.DeleteDeliveryButton(deliveryModel.deliveryId!);
            },
          ),
        ),
      ),
    );
  }
}
