import 'package:eltohamyecommerceadminapp/controller/homecontroller.dart';
import 'package:eltohamyecommerceadminapp/core/constant/routename.dart';
import 'package:eltohamyecommerceadminapp/core/function/alertexitapp.dart';
import 'package:eltohamyecommerceadminapp/view/widget/home/customHomecontrollpanal.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: () {
                        Get.toNamed(AppRoute.setting);
                      },
                      icon: Icon(Icons.settings))
                ],
                title: Text('Home'),
              ),
              body: WillPopScope(
                onWillPop: () => alertExitApp(context),
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ListView(children: [
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, mainAxisExtent: 160),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.homeCategoryList.length,
                        itemBuilder: (context, index) {
                          return CustomHomeItemPanal(
                            homecategory: controller.homeCategoryList[index],
                          );
                        },
                      )
                    ])),
              ),
            ));
  }
}
