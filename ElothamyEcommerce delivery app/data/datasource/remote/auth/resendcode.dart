import 'package:eltohamyecommercedeliveryapp/controller/auth/Forgetpassword/verifycodecontroller.dart';
import 'package:eltohamyecommercedeliveryapp/core/class/crud.dart';
import 'package:eltohamyecommercedeliveryapp/core/constant/linkApi.dart';
import 'package:get/get.dart';

// class to get the data from database
class ResendCodeData {
  Crud crud;
  // Map usernameData;
  ResendCodeData({required this.crud, });
  // dealing with database //   ResendCodeData to deal with data

  PostResendCodeData( String email) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.resendVerificaioncode,{
      "delivery_email": email ,
    } );
    return responce.fold((l) => l, (r) => r);
  }
}
