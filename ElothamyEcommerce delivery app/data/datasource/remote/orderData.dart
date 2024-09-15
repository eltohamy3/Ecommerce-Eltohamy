import 'package:eltohamyecommercedeliveryapp/core/class/crud.dart';
import 'package:eltohamyecommercedeliveryapp/core/constant/linkApi.dart';
import 'package:eltohamyecommercedeliveryapp/core/services/services.dart';
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

  PostPendingOrders(   ) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.pendingOrders,{ 
      "deldelivery_id": myServices.sharedPreferences.getString('id'),
    } );
    return responce.fold((l) => l, (r) => r);
  }

  PostArchivedOrders(   ) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.archivedOrder,{ 
      "deldelivery_id": myServices.sharedPreferences.getString('id'),
    } );
    return responce.fold((l) => l, (r) => r);
  }
  PostOnTheWayOrders() async {
    var responce = await crud.PostGetDataRequest(LinkAPI.onTheWayOrders,{ 
      "deldelivery_id": myServices.sharedPreferences.getString('id'),
    } );
    return responce.fold((l) => l, (r) => r);
  }
  PostOrderApprove(int orderId , int orderUserId) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.orderApprove,{ 
      "orders_id": "$orderId",
      "orders_userid":"$orderUserId" , 
      "deldelivery_id": myServices.sharedPreferences.getString('id'),
    } );
    return responce.fold((l) => l, (r) => r);
  }
  PostOrderDone(int orderId , int orderUserId) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.OrderDone,{ 
      "orders_id": "$orderId",
      "orders_userid":"$orderUserId" , 

    } );
    return responce.fold((l) => l, (r) => r);
  }
  PostOrdersDetails(int orderId) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.ordersDetails,{ 
      "orders_id": "$orderId",
    } );
    return responce.fold((l) => l, (r) => r);
  }
  
}
