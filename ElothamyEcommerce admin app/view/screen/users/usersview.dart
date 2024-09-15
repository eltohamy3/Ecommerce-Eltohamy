import 'package:eltohamyecommerceadminapp/controller/users/usersviewcontroller.dart';
import 'package:eltohamyecommerceadminapp/core/class/handlingDataView.dart';
import 'package:eltohamyecommerceadminapp/view/widget/users/customUsersViewCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: Text('users'),
      ),
      body: GetBuilder<UserControllerViewImp>(
        init: UserControllerViewImp(),
        builder: (controller) => HanddlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
              child: ListView.builder(
                  itemCount: controller.UsersViewList.length,
                  itemBuilder: (context, index) => CustomUSersViewCard(
                        userModel: controller.UsersViewList[index],
                      ))),
        ),
      ),
    );
  }


}
