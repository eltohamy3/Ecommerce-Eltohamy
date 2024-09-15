import 'dart:io';

import 'package:eltohamyecommerceadminapp/core/function/alertexitapp.dart';
import 'package:eltohamyecommerceadminapp/core/shared/CustomButtomSheetIcon.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

ImageUploadCamera() async {
  ImagePicker mypeaker = ImagePicker();
  final XFile? image = await mypeaker.pickImage(source: ImageSource.camera);
  if (image != null) {
    return File(image.path);
  } else {
    showErrorMassage(Get.context!, "Image Upload", "un able to upload image");
    return null;
  }
}

fileUploadGallery(
    {List<String> allowedExten = const [
      'SVG',
      'svg',
      'PNG',
      'png',
      'jpg',
      'JPG',
      'jpeg',
      'JPEG',
      'gif'
    ]}) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    allowMultiple: false,
    type: FileType.custom,
    allowedExtensions: allowedExten,
  );

  if (result != null) {
    File file = File(result.files.single.path!);
    return file;
  } else {
    showErrorMassage(Get.context!, "Image Upload", "un able to upload image");
    return null;
  }
}

UPloadImagFromCameraOrGalary(BuildContext context,
    {required void Function()? cameraOnclick,
    required void Function()? galaryOnclick}) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
            height: 120,
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              CustomButtomSheetIcon(
                hintText: 'upload from \n   camera',
                MyIcon: Icon(Icons.camera_alt, color: Colors.blue),
                onTap: () {
                  cameraOnclick!();
                },
              ),
              CustomButtomSheetIcon(
                  hintText: 'upload from \n   gallery',
                  MyIcon: Icon(Icons.photo_library, color: Colors.red),
                  onTap: () {
                    galaryOnclick!(); 
                  },)
            ]));
      });
}
