import 'package:eltohamyecommercedeliveryapp/core/constant/mycolors.dart';
import 'package:eltohamyecommercedeliveryapp/core/constant/routename.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/auth/customButtonAuth.dart';
import 'package:eltohamyecommercedeliveryapp/view/widget/auth/custtomAuthAppbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthAppBar(AppbarTitle: 'Success'),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 200,
              color: AppColor.ButtonColorauth,
            ),
            Text(
              'ResetPassword Sucsessfully',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 50,
            ),
            CustomButtonAuth(
                onPressed: () {
                  Get.offAllNamed(AppRoute.login);
                },
                btnText: "Go To Login"),
          ],
        ),
      ),
    );
  }
}
