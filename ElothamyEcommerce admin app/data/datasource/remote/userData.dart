import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/core/constant/linkApi.dart';

// class to get the data from database
class UserData {
  Crud crud;
  UserData({required this.crud});
  
  PostUsersView() async {
    var responce = await crud.PostGetDataRequest(LinkAPI.usersView, {});
   return  responce.fold((l) => l, (r) => r); 
  }
  postDeleteUser(int userid) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.userDelete, {
      "user_id": "$userid"
    });
   return  responce.fold((l) => l, (r) => r); 
  }
    PostUserOrders(int userid) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.userOrders, {
      "user_id": "$userid"
    });
   return  responce.fold((l) => l, (r) => r); 
  }
}
