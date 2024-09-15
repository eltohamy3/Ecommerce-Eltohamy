import 'package:eltohmayecommerceapp/core/class/crud.dart';
import 'package:eltohmayecommerceapp/core/constant/linkApi.dart';

// class to get the data from database
class SearchData {
  Crud crud;
  SearchData({required this.crud, });
  // dealing with database //   SearchData to deal with data

  PostSearchData( String query  ) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.searchPage,{ 
      "query":query
    } );
    return responce.fold((l) => l, (r) => r);
  }


}
