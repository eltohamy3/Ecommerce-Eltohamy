import 'dart:io';

import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/core/constant/linkApi.dart';

class ItemData {
  Crud crud;
  ItemData({required this.crud});  
  Postviewitems() async {
    var responce = await crud.PostGetDataRequest(LinkAPI.viewitems, {});
   return  responce.fold((l) => l, (r) => r); 
  }
   Postadditems( Map data ,  File myfile, ) async {
    var responce = await crud.postGetdataRequestWithImage(LinkAPI.additems, data , myfile , "items_image");
   return  responce.fold((l) => l, (r) => r); 
  }

   Postedititems( Map data , File? myfile)  async {
    var responce; 
    if (myfile==null){
          responce = await crud.PostGetDataRequest(LinkAPI.edititems, data);
    }else{
          responce = await crud.postGetdataRequestWithImage(LinkAPI.edititems, data , myfile , "items_image");
    }
   return  responce.fold((l) => l, (r) => r); 
  }
   Postdeleteitems(int itemsid , String oldImagepath) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.removeitems, {
      "items_id":"$itemsid" , 
      "items_image":oldImagepath ,
    });
   return  responce.fold((l) => l, (r) => r); 
  }

}
