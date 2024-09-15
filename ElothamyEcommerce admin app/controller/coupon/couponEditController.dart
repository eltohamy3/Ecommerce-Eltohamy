import 'package:eltohamyecommerceadminapp/controller/coupon/couponViewController.dart';
import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/core/class/statusrequest.dart';
import 'package:eltohamyecommerceadminapp/core/function/alertexitapp.dart';
import 'package:eltohamyecommerceadminapp/core/function/handlingdata.dart';
import 'package:eltohamyecommerceadminapp/data/datasource/remote/CouponData.dart';
import 'package:eltohamyecommerceadminapp/data/model/couponModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart'; // Edit intl package for date formatting

abstract class CouponEditController extends GetxController {
  EditCoupon();
}

class CouponEditControllerImp extends CouponEditController {
  late CouponModel couponModel;
  // controllers
  // couponNameController , couponCountController , couponDiscountController ,
  // couponExpiredataController
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  late TextEditingController couponDiscountController;
  late TextEditingController couponCountController;
  late TextEditingController CouponNameController;
  late TextEditingController couponExpiredataController;
  late GlobalKey<FormState> CouponEditFOrmKey;

  // GetDat
  late StatusRequest statusRequest;
  CouponData couponData = CouponData(crud: Crud());

  void setInitialDateAndTime() {
    // Parse the expire date string (e.g., 2024-09-24 06:30:00)
    DateTime parsedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').parse(couponModel.couponExpiredata!);
    // Initialize selectedDate with parsed date
    selectedDate = DateTime(
      parsedDate.year,
      parsedDate.month,
      parsedDate.day,
    );

    // Initialize selectedTime with parsed time
    selectedTime = TimeOfDay(
      hour: parsedDate.hour,
      minute: parsedDate.minute,
    );

    // Update the text field with the formatted date and time

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
  EditCoupon() async {
    if (CouponEditFOrmKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      

      var responce = await couponData.PostCouponEdit({
        "coupon_id": "${couponModel.couponId}",
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
              Get.context!, "Edit Coupon", "Edit Coupon Done successfully");
          await couponViewController.GetData();
        } else {
          showErrorMassage(Get.context!, "Edit Coupon", responce['message']);
          statusRequest = StatusRequest.success;
        }
      } else {
        showErrorMassage(Get.context!, "Edit Coupon", responce['message']);
        statusRequest = StatusRequest.success;
      }
      update();
    }
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.loading;
    update();
    couponModel = Get.arguments['couponModel'];
    CouponEditFOrmKey = GlobalKey();
    couponCountController =
        TextEditingController(text: "${couponModel.couponCount}");
    CouponNameController = TextEditingController(text: couponModel.couponName);
    couponExpiredataController =
        TextEditingController(text: couponModel.couponExpiredata);
    couponDiscountController =
        TextEditingController(text: "${couponModel.couponDiscount}");

    setInitialDateAndTime();
    statusRequest = StatusRequest.success;
    update();
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
