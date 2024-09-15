import 'package:eltohamyecommercedeliveryapp/controller/test_controller.dart';
import 'package:eltohamyecommercedeliveryapp/core/class/handlingDataView.dart';
import 'package:eltohamyecommercedeliveryapp/core/class/statusrequest.dart';
import 'package:eltohamyecommercedeliveryapp/core/constant/mycolors.dart';
import 'package:eltohamyecommercedeliveryapp/core/function/handlingdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  TestView({super.key});

  @override
  Widget build(BuildContext context) {
    final TestController controller = Get.put(TestController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor:AppColor.ButtonColorauth,
        title: Text('TestData', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: GetBuilder<TestController>(
          builder: (controller) {
            return HanddlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) =>
                    Text(controller.data[index].toString()),
              ),
            );
          },
        ),
      ),
    );
  }
}
