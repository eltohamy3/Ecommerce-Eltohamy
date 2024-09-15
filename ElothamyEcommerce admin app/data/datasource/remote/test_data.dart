import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/core/constant/linkApi.dart';

// class to get the data from database
class TestData {
  Crud crud;
  TestData({required this.crud});
  // dealing with database //   testdata to deal with data
  
  getData() async {
    var responce = await crud.PostGetDataRequest(LinkAPI.UserIndex, {});
   return  responce.fold((l) => l, (r) => r); 
  }
}
