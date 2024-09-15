import 'package:eltohamyecommerceadminapp/controller/items/itemsEditcontroller.dart';
import 'package:eltohamyecommerceadminapp/core/class/handlingDataView.dart';
import 'package:eltohamyecommerceadminapp/core/constant/mycolors.dart';
import 'package:eltohamyecommerceadminapp/view/widget/auth/customTextsubtitleAuth.dart';
import 'package:eltohamyecommerceadminapp/view/widget/categories/editcat/customeditbuttomappbar.dart';
import 'package:eltohamyecommerceadminapp/view/widget/items/itemseidt/cusotomItemsHandelimage.dart';
import 'package:eltohamyecommerceadminapp/view/widget/items/itemseidt/customEdititemsForm.dart';
import 'package:eltohamyecommerceadminapp/view/widget/orders/customMaterialButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsEdit extends GetView<EditItemsControllerImp> {
  const ItemsEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomEditButton(
          text: "Edit Item",
          onPressed: () {
            controller.Edititembutton();
          },
        ),
        appBar: AppBar(title: Text('Edit Categories')),
        body: WillPopScope(
          onWillPop: () {
            return Future.value(true);
          },
          child: GetBuilder<EditItemsControllerImp>(
            init: EditItemsControllerImp(),
            builder: (controller) => HanddlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: EdgeInsets.all(20),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomTextsubtitleAuth(
                      subtitle: 'Edit the Items information ',
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomEditItemsForm(),
                    CustomItemHandelImage(),
                    CustomMaterialButton(
                      title: "Change Image",
                      color: controller.myfile == null
                          ? AppColor.secondarycolor
                          : Colors.green,
                      textcolor: AppColor.white,
                      onPressed: () {
                        controller.uploadImage();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        )    );
  }
}
