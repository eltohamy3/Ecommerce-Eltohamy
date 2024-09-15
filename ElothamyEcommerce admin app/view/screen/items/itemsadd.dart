import 'package:eltohamyecommerceadminapp/controller/Items/itemsAddcontroller.dart';
import 'package:eltohamyecommerceadminapp/controller/itemsViewController.dart';
import 'package:eltohamyecommerceadminapp/core/class/handlingDataView.dart';
import 'package:eltohamyecommerceadminapp/core/constant/mycolors.dart';
import 'package:eltohamyecommerceadminapp/view/widget/auth/customTextsubtitleAuth.dart';
import 'package:eltohamyecommerceadminapp/view/widget/items/itemsAdd/customAdditemForm.dart';
import 'package:eltohamyecommerceadminapp/view/widget/items/itemsAdd/custombuttonappbar.dart';
import 'package:eltohamyecommerceadminapp/view/widget/orders/customMaterialButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ItemsAdd extends GetView<myItemsViewControllerImp> {
  const ItemsAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomButtonNavBar(),
        appBar: AppBar(title: Text('Add Items')),
        body: WillPopScope(
          onWillPop: ()  {
            return Future.value(true);
          },
          child: GetBuilder<AddItemsControllerImp>(
            init: AddItemsControllerImp(),
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
                      subtitle: 'Add the item information ',
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomAddItemForm(),
                    controller.myfile != null
                        ? Container(
                            height: 250,
                            child: controller.myfile!.path.endsWith("svg")
                                ? SvgPicture.file(controller.myfile!)
                                : Image.file(controller.myfile!))
                        : SizedBox(
                            height: 0,
                          ),
                    CustomMaterialButton(
                      title: controller.myfile == null
                          ? "Upload Image"
                          : "Change Image",
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
