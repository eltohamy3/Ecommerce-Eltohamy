import 'package:eltohamyecommerceadminapp/core/class/crud.dart';

// class to get the data from database
class VerificaitonData {
  Crud crud;
  // Map usernameData;
  VerificaitonData({required this.crud, });
  // dealing with database //   VerificaitonData to deal with data



  PostVerificaitonData( String email , String verificaioncode , String Link) async {
    var responce = await crud.PostGetDataRequest(Link,{
      "admin_email":  email,
      "admin_verifycode": verificaioncode  ,
    } );
    return responce.fold((l) => l, (r) => r);
  }
}
