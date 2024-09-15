class SettingsTextModel {
  int? settingsId;
  String? settingsTitle;
  String? settingsSubtitle;
  int? settingDeliverytime;
  double? setting_DeliveryPrice;

  SettingsTextModel(
      {this.settingsId,
      this.settingsTitle,
      this.settingsSubtitle,
      this.settingDeliverytime,
      this.setting_DeliveryPrice});

  SettingsTextModel.fromJson(Map<String, dynamic> json) {
    settingsId = json['settings_id'];
    settingsTitle = json['settings_title'];
    settingsSubtitle = json['settings_subtitle'];
    settingDeliverytime = json['setting_deliverytime'];
    setting_DeliveryPrice = 1.0 * json['setting_deliveryPrice'];
  }
  
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['settings_id'] = this.settingsId;
    data['settings_title'] = this.settingsTitle;
    data['settings_subtitle'] = this.settingsSubtitle;
    data['setting_deliverytime'] = this.settingDeliverytime;
    data['setting_deliveryPrice'] = this.setting_DeliveryPrice;
    return data;
  }
}
