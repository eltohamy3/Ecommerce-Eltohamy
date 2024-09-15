import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/core/constant/linkApi.dart';

// class to get the data from database
class SettingData {
  Crud crud;
  SettingData({required this.crud});
  
  postSettingGetData() async {
    var responce = await crud.PostGetDataRequest(LinkAPI.settingGetData, {});
   return  responce.fold((l) => l, (r) => r); 
  }
  postSettingEdit(Map data) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.settingEdit, data);
   return  responce.fold((l) => l, (r) => r); 
  }
}
