import 'package:eltohmayecommerceapp/core/class/crud.dart';
import 'package:eltohmayecommerceapp/core/constant/linkApi.dart';
import 'package:eltohmayecommerceapp/core/services/services.dart';
import 'package:get/get.dart';

// class to get the data from database
class OrdersData {
  Crud crud;
  // Map usernameData;
  OrdersData({
    required this.crud,
  });
  // dealing with database //   OrdersData to deal with data
  MyServices myServices = Get.find();
  PostCheckout(
      int orders_addressId,
      int orders_types,
      double orders_priceDelivery,
      double orders_price,
      int orders_coupon,
      int orders_paymentmethod , 
      int coupon_discount
      ) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.checkOut, {
      "orders_userid": myServices.sharedPreferences.getString('id'),
      "orders_address": "$orders_addressId",
      "orders_types": "$orders_types",
      "orders_priceDelivery": "$orders_priceDelivery",
      "orders_price": "$orders_price",
      "orders_coupon": "$orders_coupon",
      "orders_paymentmethod": "$orders_paymentmethod" , 
      "coupon_discount" :  "$coupon_discount"
    });
    return responce.fold((l) => l, (r) => r);
  }
  
  PostPendingOrders(   ) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.pendingOrders,{ 
      "orders_userid": myServices.sharedPreferences.getString('id'),
    } );
    return responce.fold((l) => l, (r) => r);
  }

  PostArchivedOrders(   ) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.archivedOrder,{ 
      "orders_userid": myServices.sharedPreferences.getString('id'),
    } );
    return responce.fold((l) => l, (r) => r);
  }
  PostOrdersDetails(int orderId) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.ordersDetails,{ 
      "orders_id": "$orderId",
    } );
    return responce.fold((l) => l, (r) => r);
  }
  PostDeleteOrder(int orderId) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.deleteOrder,{ 
      "orders_id": "$orderId",
    } );
    return responce.fold((l) => l, (r) => r);
  }
  PostRatingOrder(double rating , int orderId , String? massage   ) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.OrderRating,{ 
      "orders_id": "$orderId",
      "orders_rating": "$rating" , 
      "orders_noteRating": "$massage"
    } );
    return responce.fold((l) => l, (r) => r);
  }


}
