import 'package:eltohmayecommerceapp/core/class/crud.dart';
import 'package:eltohmayecommerceapp/core/constant/linkApi.dart';

// class to get the data from database
class UserData {
  Crud crud;
  UserData({required this.crud});
  // dealing with database //   UserData to deal with data
  
  PostEditProfile( String username , String phoneNumber , String user_id) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.editProfile, {
      "phoneNumber": phoneNumber , 
      "username" : username , 
      "user_id" : user_id
    });
   return  responce.fold((l) => l, (r) => r); 
  }
}
