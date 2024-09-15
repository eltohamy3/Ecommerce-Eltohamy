import 'package:eltohmayecommerceapp/core/class/crud.dart';
import 'package:eltohmayecommerceapp/core/constant/linkApi.dart';
import 'package:eltohmayecommerceapp/core/services/services.dart';
import 'package:get/get.dart';

// class to get the data from database
class CartData {
  Crud crud;
  // Map usernameData;
  CartData({required this.crud, });
  // dealing with database //   CartData to deal with data
  MyServices myServices = Get.find(); 
  PostAddToCart( int itemId ) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.addToCart,{
      "user_id": myServices.sharedPreferences.getString('id') ,
      "items_id": "$itemId"
    } );
    return responce.fold((l) => l, (r) => r);
  }
  PostRemoveFromCart( int itemId) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.removeFromCart,{
      "user_id": myServices.sharedPreferences.getString('id') ,
      "items_id": "$itemId"

    } );
    return responce.fold((l) => l, (r) => r);
  }
  PostViewCart( ) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.cartView,{
      "user_id": myServices.sharedPreferences.getString('id') ,
    } );
    return responce.fold((l) => l, (r) => r);
  }
  PostGetCountItems( int itemId) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.getCountItems,{
      "user_id": myServices.sharedPreferences.getString('id') ,
      "items_id": "$itemId"

    } );
    return responce.fold((l) => l, (r) => r);
  }
  PostCheckCoupon( String coupon_name) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.checkCoupon,{
      "coupon_name": coupon_name ,
    } );
    return responce.fold((l) => l, (r) => r);


    
  }
  


  
  }

