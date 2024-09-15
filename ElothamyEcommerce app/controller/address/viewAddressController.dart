import 'package:eltohmayecommerceapp/core/class/crud.dart';
import 'package:eltohmayecommerceapp/core/class/statusrequest.dart';
import 'package:eltohmayecommerceapp/core/constant/routename.dart';
import 'package:eltohmayecommerceapp/core/function/alertexitapp.dart';
import 'package:eltohmayecommerceapp/core/function/handlingdata.dart';
import 'package:eltohmayecommerceapp/data/datasource/remote/addressData.dart';
import 'package:eltohmayecommerceapp/data/model/addressModel.dart';
import 'package:get/get.dart';

class AddressViewController extends GetxController {}

class AddressViewControllerImp extends AddressViewController {
  AddressData addressData = AddressData(crud: Crud());

  List<AddressModel> AddressDataList = [];
  late StatusRequest statusRequest;

  
  GoToAddressDetails( AddressModel addressModel){
    Get.toNamed(AppRoute.addressDetails , 
    arguments: {
      "addressModel" : addressModel
    }
     ); 
  }

  
  DeleteAddress(AddressModel addressModel) async {
    statusRequest = StatusRequest.loading;
    update();
    var responce = await addressData.PostRemoveAddress(
        addressModel.addressId!);
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in Delete address view :  ${responce}');
      if (responce['status'] == 'Success') {
        showSuccessMassageWithOk(
          Get.context!,
          "Delete Addeess",
          "Address was Deleted successfully",
          () {},
          "Ok",
          (p0) async {
            AddressDataList.removeWhere(
                (element) => element.addressId == addressModel.addressId);
            update();
          },
        );
      } else {
        showErrorMassage(Get.context!, "Delete item",
            "Server Error while Deleting the item");
        statusRequest = StatusRequest.success;
      }
    } else {
      showErrorMassage(Get.context!, "Delete item",
          " Error while Deleting the item");
      statusRequest = StatusRequest.success;
    }
    update();
  }
    Deleteitemsbutton(AddressModel addressModel) {
    showHazardMassage(
        Get.context!, "Address Delete", "Are you sure to Delete This Address",
        () async {
      await DeleteAddress(addressModel);
    }, "Ok");
  }

  GetAddress() async {
    AddressDataList.clear();
    // first give it value of this
    statusRequest = StatusRequest.loading;
    update();
    var responce = await addressData.PostViewAddress();
    statusRequest = handleData(responce);

    if (statusRequest == StatusRequest.success) {
      if (responce['status'] == 'Success') {
        print(responce);
        responce['data'].forEach((element) {
          AddressDataList.add(AddressModel.fromJson(element));
        });
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() async {
    statusRequest = StatusRequest.loading;
    await GetAddress();
    super.onInit();
  }
}
