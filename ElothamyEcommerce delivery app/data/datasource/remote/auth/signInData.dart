import 'package:eltohamyecommercedeliveryapp/core/class/crud.dart';
import 'package:eltohamyecommercedeliveryapp/core/constant/linkApi.dart';

// class to get the data from database
class SingInData {
  Crud crud;
  // Map usernameData;
  SingInData({required this.crud, });
  // dealing with database //   SingInData to deal with data

  POstSingInData( String  email , String password) async {
  //  SignInControllerImp controller =Get.put(SignInControllerImp());
    var responce = await crud.PostGetDataRequest(LinkAPI.signIn,{
      "delivery_password": password,
      "delivery_email": email ,
    } );
    return responce.fold((l) => l, (r) => r);
  }
}
