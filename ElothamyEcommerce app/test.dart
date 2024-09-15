import 'package:eltohmayecommerceapp/controller/test_controller.dart';
import 'package:eltohmayecommerceapp/core/function/checkInternet.dart';
import 'package:eltohmayecommerceapp/view/widget/auth/customButtonAuth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  intidata() async {
    bool res = await checkInternet();
    print(res);
  }

  @override
  void initState() {
    intidata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   TestController controller= Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Test Page'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            // OtpTextField(
            //   fieldWidth: 50,
            //   borderRadius: BorderRadius.circular(20),
            //   numberOfFields: 5,
            //   borderColor: Color(0xFF512DA8),
            //   //set to true to show as box or false to show as dash
            //   showFieldAsBox: true,
            //   //runs when a code is typed in
            //   onCodeChanged: (String code) {
            //     //handle validation or checks here
            //   },
            //   //runs when every textfield is filled
            //   onSubmit: (String verificationCode) {}, // end onSubmit
            // ),

            CustomButtonAuth(onPressed:()=>controller.showDIalog(), btnText: "shwo dialog")
          ],
        ),
      ),
    );
  }
}
