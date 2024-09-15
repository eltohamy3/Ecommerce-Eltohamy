import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:eltohmayecommerceapp/core/constant/routename.dart';
import 'package:eltohmayecommerceapp/view/widget/auth/customButtonAuth.dart';
import 'package:eltohmayecommerceapp/view/widget/auth/custtomAuthAppbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SuccessSingUp extends StatelessWidget {
  const SuccessSingUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthAppBar(AppbarTitle: 'Success'),
      body: Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
            Icon(Icons.check_circle_outline ,size: 200 , color: AppColor.ButtonColorauth,) , 
            Text('SingUp Sucsessfully' , textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline1,),
            SizedBox(height: 50,),
            CustomButtonAuth(
                onPressed: () {
                  Get.offNamed(AppRoute.login);
                },
                btnText: "Go To Login"),

        ],
      ),
    ),
    );
  }
}
