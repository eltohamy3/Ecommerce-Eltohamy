import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/core/class/statusrequest.dart';
import 'package:eltohamyecommerceadminapp/core/function/alertexitapp.dart';
import 'package:eltohamyecommerceadminapp/core/function/handlingdata.dart';
import 'package:eltohamyecommerceadminapp/data/datasource/remote/settingData.dart';
import 'package:eltohamyecommerceadminapp/data/model/settingsTextModel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class EditSettingController extends GetxController {
  GetSettingData();
  EditSettingData();
}

class EditSettingControllerImp extends EditSettingController {
  late SettingsTextModel settingsTextModel;
  late TextEditingController titelController;
  late TextEditingController subTitelController;
  late TextEditingController settingDeliverytimeController;
  late TextEditingController setting_DeliveryPriceController;
  GlobalKey<FormState> formKey = GlobalKey();

  late StatusRequest statusRequest;
  SettingData settingData = SettingData(crud: Crud());
  @override
  GetSettingData() async {
    statusRequest = StatusRequest.loading;
    update();
    var responce = await settingData.postSettingGetData();
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in setting view :  ${responce}');
      if (responce['status'] == 'Success') {
        if (responce['data'] != null) {
          settingsTextModel = SettingsTextModel.fromJson(responce['data'][0]);
          inialzeTextController();
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  EditSettingData() async {
    statusRequest = StatusRequest.loading;
    update();
    var responce = await settingData.postSettingEdit({
      "settings_id": "${settingsTextModel.settingsId}",
      "settings_subtitle": subTitelController.text,
      "settings_title": titelController.text,
      "setting_deliverytime": settingDeliverytimeController.text,
      "setting_deliveryPrice": setting_DeliveryPriceController.text,
    });
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in edit view :  ${responce}');
      if (responce['status'] == 'Success') {
        await GetSettingData();
      } else {
        showErrorMassage(Get.context!, "Edit Setting",
            "Server Error while Editing the setting data");
      }
    } else {
      showErrorMassage(Get.context!, "Edit Setting",
          "Server Error while Editing the setting data");
      statusRequest = StatusRequest.success;
    }
    update();
  }

  inialzeTextController() {
    titelController.text = settingsTextModel.settingsTitle!;
    subTitelController.text = settingsTextModel.settingsSubtitle!;
    settingDeliverytimeController.text =
        "${settingsTextModel.settingDeliverytime}";
    setting_DeliveryPriceController.text =
        "${settingsTextModel.setting_DeliveryPrice}";
  }

  EditSettingutton() async {
    if (formKey.currentState!.validate()) {
      await EditSettingData();
    }
  }

  @override
  void onInit() async {
    statusRequest = StatusRequest.loading;
    titelController = TextEditingController();
    subTitelController = TextEditingController();
    settingDeliverytimeController = TextEditingController();
    setting_DeliveryPriceController = TextEditingController();
    await GetSettingData();
    super.onInit();
  }
}
