import 'package:eltohmayecommerceapp/controller/profileEdit.dart';
import 'package:eltohmayecommerceapp/core/class/handlingDataView.dart';
import 'package:eltohmayecommerceapp/core/constant/imageasset.dart';
import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:eltohmayecommerceapp/view/widget/ProductDetails/CustomButtonprimarycolor.dart';
import 'package:eltohmayecommerceapp/view/widget/profileEdit/profileEditForm.dart';
import 'package:eltohmayecommerceapp/view/widget/profileEdit/profileEditstack.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileEdit extends StatelessWidget {
  const ProfileEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileEditControllerImp>(
      init: ProfileEditControllerImp(),
      builder: (controller) => Scaffold(
              bottomNavigationBar: CustomPrimaryButton(
        Title: "Edit Profile",
        onPressed: () {
          controller.EditProfile();
        },
      ),
        appBar: AppBar(
          title: Text(' Edit Profile' , 
          
          ),
          backgroundColor: AppColor.secondarycolor,
        ),
        body: HanddlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
              // padding: EdgeInsets.all(20),
              child: ListView(
                children: [
                  ProfileEditStack(
                    email: controller.email,
                  ) ,
        const SizedBox(
          height: 100,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: CustomProfileEditForm(),
        )
                  
                ],
              )),
        ),
      ),
    );
  }
}
