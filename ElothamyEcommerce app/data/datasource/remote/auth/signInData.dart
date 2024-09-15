import 'package:eltohmayecommerceapp/core/class/crud.dart';
import 'package:eltohmayecommerceapp/core/constant/linkApi.dart';

// class to get the data from database
class SingInData {
  Crud crud;
  // Map usernameData;
  SingInData({required this.crud, });
  // dealing with database //   SingInData to deal with data

  POstSingInData( String  email , String password) async {
  //  SignInControllerImp controller =Get.put(SignInControllerImp());
    var responce = await crud.PostGetDataRequest(LinkAPI.signIn,{
      "password": password,
      "email": email ,
    } );
    return responce.fold((l) => l, (r) => r);
  }
}
