import 'package:eltohamyecommerceadminapp/controller/Items/itemsEditcontroller.dart';
import 'package:eltohamyecommerceadminapp/controller/categories/categoriesviewcontroller.dart';
import 'package:eltohamyecommerceadminapp/controller/categories/editcatController.dart';
import 'package:eltohamyecommerceadminapp/core/class/handlingDataView.dart';
import 'package:eltohamyecommerceadminapp/core/constant/mycolors.dart';
import 'package:eltohamyecommerceadminapp/core/function/validation.dart';
import 'package:eltohamyecommerceadminapp/view/widget/auth/customTextsubtitleAuth.dart';
import 'package:eltohamyecommerceadminapp/view/widget/auth/customtextformauth.dart';
import 'package:eltohamyecommerceadminapp/view/widget/categories/editcat/customEditCatForm.dart';
import 'package:eltohamyecommerceadminapp/view/widget/categories/editcat/customHandelImage.dart';
import 'package:eltohamyecommerceadminapp/view/widget/categories/editcat/customeditbuttomappbar.dart';
import 'package:eltohamyecommerceadminapp/view/widget/orders/customMaterialButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class categoriesEdit extends GetView<EditItemsControllerImp> {
  const categoriesEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomEditButton(
          text: "Categorie Edit",
          onPressed: () {
            controller.Edititembutton();
          },
        ),
        appBar: AppBar(title: Text('Edit Categories')),
        body: WillPopScope(
          onWillPop: () {
            return Future.value(true);
          },
          child: GetBuilder<EditCategorieControllerImp>(
            init: EditCategorieControllerImp(),
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
                      subtitle: 'Edit the categorie information ',
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomEditCatForm(),
                    CustomHandelImage(),
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
        ));
  }
}
