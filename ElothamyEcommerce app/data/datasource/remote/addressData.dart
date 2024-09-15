import 'package:eltohmayecommerceapp/core/class/crud.dart';
import 'package:eltohmayecommerceapp/core/constant/linkApi.dart';
import 'package:eltohmayecommerceapp/core/services/services.dart';
import 'package:get/get.dart';

// class to get the data from database
class AddressData {
  Crud crud;
  // Map usernameData;
  AddressData({
    required this.crud,
  });
  // dealing with database //   AddressData to deal with data
  MyServices myServices = Get.find();
  PostAddAddress(String city, String street , String address_name, double lat, double long) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.addAddress, {
      "address_userid": myServices.sharedPreferences.getString('id'),
      "address_city": city,
      "address_street": street,
      "address_lat": "$lat",
      "address_long": "$long",
      "address_name": address_name

    });
    return responce.fold((l) => l, (r) => r);
  }

  PostRemoveAddress(int address_id) async {
    var responce = await crud.PostGetDataRequest(
        LinkAPI.removeAddress, {"address_id": "$address_id"});
    return responce.fold((l) => l, (r) => r);
  }

  PostViewAddress() async {
    var responce = await crud.PostGetDataRequest(LinkAPI.viewAddress, {
      "address_userid": myServices.sharedPreferences.getString('id'),
    });
    return responce.fold((l) => l, (r) => r);
  }

  PostEditAddress(int address_id, String city, String address_name, String street, double lat,
      double long) async {
    var responce = await crud.PostGetDataRequest(LinkAPI.editAddress, {
      "address_id": "$address_id",
      "address_city": city,
      "address_street": street,
      "address_lat": "$lat",
      "address_long": "$long",
      "address_name": address_name

    });
    return responce.fold((l) => l, (r) => r);
  }

}
