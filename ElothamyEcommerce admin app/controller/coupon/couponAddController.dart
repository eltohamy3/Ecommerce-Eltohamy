import 'package:eltohamyecommerceadminapp/controller/coupon/couponViewController.dart';
import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/core/class/statusrequest.dart';
import 'package:eltohamyecommerceadminapp/core/function/alertexitapp.dart';
import 'package:eltohamyecommerceadminapp/core/function/handlingdata.dart';
import 'package:eltohamyecommerceadminapp/data/datasource/remote/CouponData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart'; // Add intl package for date formatting

abstract class CouponAddController extends GetxController {
  AddCoupon();
}

class CouponAddControllerImp extends CouponAddController {
  // controllers
  // couponNameController , couponCountController , couponDiscountController ,
  // couponExpiredataController
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  late TextEditingController couponDiscountController;
  late TextEditingController couponCountController;
  late TextEditingController CouponNameController;
  late TextEditingController couponExpiredataController;
  late GlobalKey<FormState> CouponAddFOrmKey;

  // GetDat
  late StatusRequest statusRequest;
  CouponData couponData = CouponData(crud: Crud());

  void setInitialDateAndTime() {
    // Set the current timestamp as default
    selectedDate = DateTime.now();
    selectedTime = TimeOfDay.now();

    updateDateTimeText();
  }

  void updateDateTimeText() {
    if (selectedDate != null && selectedTime != null) {
      // Combine the selected date and time
      DateTime combinedDateTime = DateTime(
        selectedDate!.year,
        selectedDate!.month,
        selectedDate!.day,
        selectedTime!.hour,
        selectedTime!.minute,
      );

      // Format as Y-m-d H:i:s
      String formattedDateTime =
          DateFormat('yyyy-MM-dd HH:mm:ss').format(combinedDateTime);
      couponExpiredataController.text = formattedDateTime;
      update();
    }
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      selectedDate = pickedDate;
      updateDateTimeText();
    }
  }

  Future<void> selectTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (pickedTime != null) {
        selectedTime = pickedTime;
        updateDateTimeText();
      
    }
  }

  @override
  AddCoupon() async {
    if (CouponAddFOrmKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var responce = await couponData.PostCouponAdd({
        "coupon_name": CouponNameController.text,
        "coupon_count": couponCountController.text,
        "coupon_expiredata": couponExpiredataController.text,
        "coupon_discount": couponDiscountController.text,
      });
      print("========================responce:::: $responce");
      statusRequest = handleData(responce);

      if (statusRequest == StatusRequest.success) {
        if (responce['status'] == 'Success') {
          CouponViewControllerImp couponViewController = Get.find();
          Get.back();
          showSuccessMassage(
              Get.context!, "Add Coupon", "Add Coupon Done successfully");
          await couponViewController.GetData();
        } else {
          showErrorMassage(Get.context!, "add Coupon", responce['message']);
          statusRequest = StatusRequest.success;
        }
      }else{
          showErrorMassage(Get.context!, "add Coupon", responce['message']);
          statusRequest = StatusRequest.success;

      }
      update();
    }
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.success;
    CouponAddFOrmKey = GlobalKey();
    couponCountController = TextEditingController();
    CouponNameController = TextEditingController();
    couponExpiredataController = TextEditingController();
    couponDiscountController = TextEditingController();
    setInitialDateAndTime();
    super.onInit();
  }

  @override
  void onClose() {
    couponCountController.dispose();
    CouponNameController.dispose();
    couponExpiredataController.dispose();
    couponDiscountController.dispose();
    super.onClose();
  }
}
