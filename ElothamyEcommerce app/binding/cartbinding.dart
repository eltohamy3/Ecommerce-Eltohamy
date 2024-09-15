import 'package:eltohmayecommerceapp/controller/cartController.dart';
import 'package:get/get.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CartControllerImp());
  }
}
