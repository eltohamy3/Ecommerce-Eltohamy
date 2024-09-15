import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/widgets.dart';

Future<bool> alertExitApp(BuildContext context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.warning,
    animType: AnimType.rightSlide,
    title: 'Warning',
    desc: 'Are You Sure to Exit The App',
    btnCancelOnPress: () {},
    btnOkOnPress: () {
      exit(0);
    },
  ).show();

  return Future.value(true);
}

showErrorMassage(BuildContext context, String PageName, String message) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.error,
    animType: AnimType.rightSlide,
    title: '$PageName Error',
    desc: message,
    btnCancelOnPress: () {},
    // btnOkOnPress: () {
    //   exit(0);
    // },
  ).show();
}
  showSuccessMassage(BuildContext context, String Operation, String message) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      title: '$Operation Done Successfuly',
      desc: message,
      // btnCancelOnPress: () {},
      btnOkOnPress: () {
        // exit(0);
      },
    ).show();
  }
  showSuccessMassageWithOk(BuildContext context, String Operation, String message ,void Function()? btnOkOnPress  , String btnOkText , void Function(DismissType)? onDismissCallback) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      title: '$Operation Done Successfuly',
      desc: message,
      // btnCancelOnPress: () {},
      btnOkOnPress: btnOkOnPress , 
      btnOkText: btnOkText,
      onDismissCallback:onDismissCallback 
    ).show();
  }

showErrorMassageWithOk(BuildContext context, String PageName, String message , void Function()? btnOkOnPress  , String btnOkText) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.error,
    animType: AnimType.rightSlide,
    title: '$PageName Error',
    desc: message,
    btnCancelOnPress: () {},
    btnOkOnPress: btnOkOnPress ,
    btnOkText: btnOkText
  ).show();
}


showHazardMassage(BuildContext context, String PageName, String message , void Function()? btnOkOnPress  , String btnOkText) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.warning,
    animType: AnimType.rightSlide,
    title: '$PageName warning',
    desc: message,
    btnCancelOnPress: () {},
    btnOkOnPress: btnOkOnPress ,
    btnOkText: btnOkText
  ).show();
}

