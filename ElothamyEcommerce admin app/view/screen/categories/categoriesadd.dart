import 'package:eltohamyecommerceadminapp/controller/categories/addcatController.dart';
import 'package:eltohamyecommerceadminapp/controller/categories/categoriesviewcontroller.dart';
import 'package:eltohamyecommerceadminapp/core/class/handlingDataView.dart';
import 'package:eltohamyecommerceadminapp/core/constant/mycolors.dart';
import 'package:eltohamyecommerceadminapp/view/widget/auth/customTextsubtitleAuth.dart';
import 'package:eltohamyecommerceadminapp/view/widget/categories/addcat/customaddcatForm.dart';
import 'package:eltohamyecommerceadminapp/view/widget/categories/addcat/custombuttomappbar.dart';
import 'package:eltohamyecommerceadminapp/view/widget/orders/customMaterialButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CategoriesAdd extends GetView<CategoriesViewControllerImp> {
  const CategoriesAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:CusotomAddCattbutomAppbar() ,
        appBar: AppBar(title: Text('Add Categories')),
        body: WillPopScope(
          onWillPop: () {
            controller.GetCategoriesData();
            return Future.value(true);
          },
          child: GetBuilder<AddCategoresControllerImp>(
            init: AddCategoresControllerImp(),
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
                      subtitle: 'Add the categorie information ',
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomAddCatForm() ,
                    controller.myfile!=null? Container(
                      height: 250,
                      child:  controller.myfile!.path.endsWith("svg")?SvgPicture.file(
                  controller.myfile!
                ):Image.file(
                  controller.myfile!
                )
                    )  : SizedBox(height: 0,) ,
                    CustomMaterialButton(
                      title: controller.myfile==null? "Upload Image":"Change Image",
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
