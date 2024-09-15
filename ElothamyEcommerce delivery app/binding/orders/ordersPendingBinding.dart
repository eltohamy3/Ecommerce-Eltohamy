import 'package:eltohamyecommercedeliveryapp/controller/orders/pendingOrdersController.dart';
import 'package:get/get.dart';

class OrdersPendingBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(PendingOrdersControllerImp()); 
  }
  
}
