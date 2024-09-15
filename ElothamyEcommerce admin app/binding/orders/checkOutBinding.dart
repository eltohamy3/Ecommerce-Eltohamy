import 'package:eltohamyecommerceadminapp/controller/orders/checkoutController.dart';
import 'package:get/get.dart';

class CheckOutBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CheckoutControllerImp());
  }
}
