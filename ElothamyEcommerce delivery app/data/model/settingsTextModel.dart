class SettingsTextModel {
  int? settingsId;
  String? settingsTitle;
  String? settingsSubtitle;
  int? settingDeliverytime;

  SettingsTextModel(
      {this.settingsId,
      this.settingsTitle,
      this.settingsSubtitle,
      this.settingDeliverytime});

  SettingsTextModel.fromJson(Map<String, dynamic> json) {
    settingsId = json['settings_id'];
    settingsTitle = json['settings_title'];
    settingsSubtitle = json['settings_subtitle'];
    settingDeliverytime = json['setting_deliverytime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['settings_id'] = this.settingsId;
    data['settings_title'] = this.settingsTitle;
    data['settings_subtitle'] = this.settingsSubtitle;
    data['setting_deliverytime'] = this.settingDeliverytime;
    return data;
  }
}
