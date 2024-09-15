import 'package:eltohamyecommercedeliveryapp/controller/homecontroller.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(children: [
                   Column(
                           crossAxisAlignment:  CrossAxisAlignment.start,
                            children: [

                            ],
                    )
              
        ])));
  }
}
