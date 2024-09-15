import 'package:eltohamyecommerceadminapp/controller/auth/Forgetpassword/verifycodecontroller.dart';
import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/core/constant/linkApi.dart';
import 'package:get/get.dart';

// class to get the data from database
class ResendCodeData {
  Crud crud;
  // Map usernameData;
  ResendCodeData({required this.crud, });
  // dealing with database //   ResendCodeData to deal with data

  PostResendCodeData( String email) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.resendVerificaioncode,{
      "admin_email": email ,
    } );
    return responce.fold((l) => l, (r) => r);
  }
}
