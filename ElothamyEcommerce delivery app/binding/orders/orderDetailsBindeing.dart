import 'package:eltohamyecommercedeliveryapp/controller/orders/orderDetailsController.dart';
import 'package:get/get.dart';

class OrderDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OrderDetailsControllerImp());
  }
}
