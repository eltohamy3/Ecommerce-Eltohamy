import 'package:eltohmayecommerceapp/core/class/crud.dart';
import 'package:eltohmayecommerceapp/core/constant/linkApi.dart';
import 'package:eltohmayecommerceapp/core/services/services.dart';
import 'package:get/get.dart';

// class to get the data from database
class ItemsData {
  Crud crud;
  // Map usernameData;
  ItemsData({required this.crud, });
  // dealing with database //   ItemsData to deal with data

  PostItemsData( int id  ) async {
    MyServices myServices= Get.find(); 
    var responce = await crud.PostGetDataRequest(LinkAPI.itemsPage,{ 
      'CatId': "$id " ,
      "user_id": await myServices.sharedPreferences.getString("id")
    } );
    return responce.fold((l) => l, (r) => r);
  }
  
}
