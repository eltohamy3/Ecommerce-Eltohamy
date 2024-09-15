import 'package:eltohamyecommerceadminapp/controller/users/usersviewcontroller.dart';
import 'package:eltohamyecommerceadminapp/data/model/userModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


// ignore: must_be_immutable
class CustomUSersViewCard extends GetView<UserControllerViewImp> {
  UserModel userModel;
  CustomUSersViewCard({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.GoToUsersOrders(userModel);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ListTile(
          title: Text(userModel.username!,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Id :  ${userModel.userId}") ,
              Text("Email : "  +userModel.email!),
              Text("PhoneNumber : " + userModel.phoneNumber!),
            ],
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.red),
            onPressed: () {
              controller.DeleteUserButton(userModel.userId!);
            },
          ),
        ),
      ),
    );
  }
}
