import 'package:eltohmayecommerceapp/core/class/crud.dart';
import 'package:eltohmayecommerceapp/core/class/statusrequest.dart';
import 'package:eltohmayecommerceapp/core/constant/routename.dart';
import 'package:eltohmayecommerceapp/core/function/alertexitapp.dart';
import 'package:eltohmayecommerceapp/core/function/handlingdata.dart';
import 'package:eltohmayecommerceapp/data/datasource/remote/addressData.dart';
import 'package:eltohmayecommerceapp/data/datasource/remote/orderData.dart';
import 'package:eltohmayecommerceapp/data/model/addressModel.dart';
import 'package:eltohmayecommerceapp/data/model/couponModel.dart';
import 'package:get/get.dart';

abstract class CheckoutController extends GetxController {}

class CheckoutControllerImp extends CheckoutController {
  int PaymentMethod = -1;
  int deliveryType = -1;
  int selectedAddress = -1;
  OrdersData ordersData = OrdersData(crud: Crud());
  // cardData
  double totalPriceOrder = 0.0;
  CouponModel? couponDetails;
  double deliveryPrice = 0;
  int discountCoupon = 0;


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

  CheckOut() async {
    if (PaymentMethod == -1) {
      showErrorMassage(
          Get.context!, "Check Out", "you should chose the payment Method at");
    } else if (deliveryType == -1) {
      showErrorMassage(
          Get.context!, "Check Out", "you should chose the Delevery type");
    } else if (deliveryType == 1 && selectedAddress == -1) {
      showErrorMassageWithOk(Get.context!, "Check Out",
          "you should chose the select the address or go add new address", () {
        Get.toNamed(AppRoute.addAddress , 
        arguments: {"fromCeckout":1}
        
        );
      }, "Go to Add Address Page");
    } else {
      statusRequest = StatusRequest.loading;
      update();
      var responce = await ordersData.PostCheckout(
          selectedAddress == -1 ? 0 : selectedAddress,
          deliveryType,
          deliveryPrice,
          totalPriceOrder,
          couponDetails == null ? 0 : couponDetails!.couponId!,
          PaymentMethod , 
          discountCoupon
          );
      statusRequest = handleData(responce);
      if (statusRequest == StatusRequest.success) {
        if (responce['status'] == 'Success') {
          print(responce);
          showSuccessMassageWithOk(
            Get.context!,
            "CheckOut",
            "Check Out done successfully",
            () {},
            "Ok",
            (p0) {
              Get.offAllNamed(AppRoute.home);
            },
          );
        } else {
          showErrorMassage(Get.context!, "CheckOut",
              "Error while chekcout Process because ${responce['message']}");
        }
      }
    }
    update();
  }

  @override
  void onInit() async {
    statusRequest = StatusRequest.loading;
    totalPriceOrder = Get.arguments['price'];
    couponDetails = Get.arguments['couponDetails'];
    deliveryPrice = Get.arguments['deliveryPrice'];
     discountCoupon = Get.arguments['discountCoupon'];


    await GetAllAddress();
    super.onInit();
  }
}
