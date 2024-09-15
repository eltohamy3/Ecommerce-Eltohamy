import 'package:eltohmayecommerceapp/core/class/crud.dart';
import 'package:eltohmayecommerceapp/core/constant/linkApi.dart';
import 'package:eltohmayecommerceapp/core/services/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

// class to get the data from database
class OffersData {
  Crud crud;
  // Map usernameData;
  OffersData({required this.crud, });
  // dealing with database //   OffersData to deal with data
  MyServices myServices = Get.find(); 

  PostOffersData( ) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.offers,{
            "user_id": myServices.sharedPreferences.getString('id') ,
    } );
    return responce.fold((l) => l, (r) => r);
  }
}
