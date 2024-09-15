
import 'package:eltohamyecommercedeliveryapp/core/class/crud.dart';
import 'package:eltohamyecommercedeliveryapp/core/constant/linkApi.dart';

// class to get the data from database
class ResetPasswordData {
  Crud crud;
  // Map usernameData;
  ResetPasswordData({required this.crud, });
  // dealing with database //   ResetPasswordData to deal with data

  PostResetPasswordData( String  email , String password) async {
  //  SignInControllerImp controller =Get.put(SignInControllerImp());
    var responce = await crud.PostGetDataRequest(LinkAPI.resetPassword,{
      "delivery_email": email ,
      "delivery_password":password
    } );
    return responce.fold((l) => l, (r) => r);
  }
}
