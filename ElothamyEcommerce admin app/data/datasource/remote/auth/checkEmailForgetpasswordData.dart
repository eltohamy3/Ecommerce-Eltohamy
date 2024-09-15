
import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/core/constant/linkApi.dart';

// class to get the data from database
class CheckEmailData {
  Crud crud;
  // Map usernameData;
  CheckEmailData({required this.crud, });
  // dealing with database //   CheckEmailData to deal with data

  PostCheckEmailData( String  email) async {
  //  SignInControllerImp controller =Get.put(SignInControllerImp());
    var responce = await crud.PostGetDataRequest(LinkAPI.checkEmail,{
      "admin_email": email ,
    } );
    return responce.fold((l) => l, (r) => r);
  }
}
