import 'package:eltohmayecommerceapp/core/class/crud.dart';
import 'package:eltohmayecommerceapp/core/constant/linkApi.dart';
import 'package:eltohmayecommerceapp/core/services/services.dart';
import 'package:get/get.dart';

// class to get the data from database
class FavoriteData {
  Crud crud;
  // Map usernameData;
  FavoriteData({required this.crud, });
  // dealing with database //   FavoriteData to deal with data
  MyServices myServices = Get.find(); 
  PostAddToFavorite( int itemId ) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.addToFavorite,{
      "user_id": myServices.sharedPreferences.getString('id') ,
      "items_id": "$itemId"
    } );
    return responce.fold((l) => l, (r) => r);
  }
  PostRemoveFromFavorite( int itemId) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.removeFromFavorite,{
      "user_id": myServices.sharedPreferences.getString('id') ,
      "items_id": "$itemId"

    } );
    return responce.fold((l) => l, (r) => r);
  }
  PostViewFavorite( ) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.favoriteView,{
      "user_id": myServices.sharedPreferences.getString('id') ,
    } );
    return responce.fold((l) => l, (r) => r);
  }}
