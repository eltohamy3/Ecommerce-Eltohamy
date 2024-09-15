import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/core/constant/linkApi.dart';
import 'package:eltohamyecommerceadminapp/core/services/services.dart';
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
  postApprovedView()async {
    var responce = await crud.PostGetDataRequest(LinkAPI.viewApproved,{ 
    } );
    return responce.fold((l) => l, (r) => r);
  }
  postDeleveryWatingView()async {
    var responce = await crud.PostGetDataRequest(LinkAPI.deleveryWatingview,{ 
    } );
    return responce.fold((l) => l, (r) => r);
  }
  PostPendingOrders(   ) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.viewpending,{ 
    } );
    return responce.fold((l) => l, (r) => r);
  }

  PostArchivedOrders(   ) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.viewArchived,{ 
    } );
    return responce.fold((l) => l, (r) => r);
  }
  PostOnTheWayOrders() async {
    var responce = await crud.PostGetDataRequest(LinkAPI.viewOrdersOntheWay,{ 
    } );
    return responce.fold((l) => l, (r) => r);
  }
  PostOrderApprove(int orderId , int orderUserId) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.approveOrder,{ 
      "orders_id": "$orderId",
      "orders_userid":"$orderUserId" , 
    } );
    return responce.fold((l) => l, (r) => r);
  }
  PostOrderPrepared(int orderId , int orderUserId , int OrderType) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.preparOrder,{ 
      "orders_id": "$orderId",
      "orders_userid":"$orderUserId" , 
      "type" :  "$OrderType"

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
