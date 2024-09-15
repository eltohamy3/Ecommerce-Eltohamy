import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/core/constant/linkApi.dart';

// class to get the data from database
class DeliveryData {
  Crud crud;
  DeliveryData({required this.crud});
  
  PostDeliveryView() async {
    var responce = await crud.PostGetDataRequest(LinkAPI.deliveryView, {});
   return  responce.fold((l) => l, (r) => r); 
  }
  postDeleteDelivery(int delivery_id) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.deliveryDelete, {
      "delivery_id": "$delivery_id"
    });
   return  responce.fold((l) => l, (r) => r); 
  }
  PostDeliveryAdd(Map data ) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.deliveryAdd, data);
   return  responce.fold((l) => l, (r) => r); 
  }
  PostDeliveryOrders(int delivery_id ) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.deliveryOrder, {
      "delivery_id":"$delivery_id"
    });
   return  responce.fold((l) => l, (r) => r); 
  }
}
