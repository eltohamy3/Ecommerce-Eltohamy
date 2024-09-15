import 'package:eltohamyecommercedeliveryapp/core/class/crud.dart';
import 'package:eltohamyecommercedeliveryapp/core/class/statusrequest.dart';
import 'package:eltohamyecommercedeliveryapp/core/function/handlingdata.dart';
import 'package:eltohamyecommercedeliveryapp/data/datasource/remote/addressData.dart';
import 'package:eltohamyecommercedeliveryapp/data/model/addressModel.dart';
import 'package:get/get.dart';

abstract class CheckoutController extends GetxController {}

class CheckoutControllerImp extends CheckoutController {
  int PaymentMethod = 1;
  int deliveryType = 2;
  int selectedAddress = 0;
  late StatusRequest statusRequest;
  List<AddressModel> addressList = [];
  AddressData addressData = AddressData(crud: Crud());

  setPaymentMethod(int paymentId) {
    PaymentMethod = paymentId;
    update();
  }


  GetAllAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var responce = await addressData.PostViewAddress();
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in view address  :  ${responce}');
      if (responce['status'] == 'Success') {
        if (responce['data'] != null) {
          responce['data'].forEach((element) {
            addressList.add(AddressModel.fromJson(element));
          });
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  setDeliveryType(int deliveryId) {
    deliveryType = deliveryId;
    update();
  }

  setSelectedAddress(int addressID) {
    selectedAddress = addressID;
    update();
  }

  @override
  void onInit() async {
    statusRequest = StatusRequest.loading;
   await GetAllAddress();
    super.onInit();
  }
}
