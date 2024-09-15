import 'package:eltohmayecommerceapp/core/class/crud.dart';
import 'package:eltohmayecommerceapp/core/constant/linkApi.dart';

// class to get the data from database
class HomeData {
  Crud crud;
  // Map usernameData;
  HomeData({required this.crud, });
  // dealing with database //   HomeData to deal with data

  PostHomeData( ) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.homePage,{
    } );
    return responce.fold((l) => l, (r) => r);
  }
}
