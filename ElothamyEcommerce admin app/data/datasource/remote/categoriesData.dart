import 'dart:io';

import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/core/constant/linkApi.dart';

// class to get the data from database
class CategoriesData {
  Crud crud;
  CategoriesData({required this.crud});
  // dealing with database //   CategoriesData to deal with data
  
  PostviewCategories() async {
    var responce = await crud.PostGetDataRequest(LinkAPI.viewcategories, {});
   return  responce.fold((l) => l, (r) => r); 
  }
   PostaddCategories( Map data ,  File myfile, ) async {
    var responce = await crud.postGetdataRequestWithImage(LinkAPI.addcategories, data , myfile , "categories_image");
   return  responce.fold((l) => l, (r) => r); 
  }
   PosteditCategories( Map data , File? myfile)  async {
    var responce; 
    if (myfile==null){
          responce = await crud.PostGetDataRequest(LinkAPI.editcategories, data);
    }else{
          responce = await crud.postGetdataRequestWithImage(LinkAPI.editcategories, data , myfile , "categories_image");
    }
   return  responce.fold((l) => l, (r) => r); 
  }
   PostdeleteCategories(int catid , String oldImagepath) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.removecategories, {
      "categories_id":"$catid" , 
      "categories_image":oldImagepath ,
    });
   return  responce.fold((l) => l, (r) => r); 
  }

}
