import 'package:eltohmayecommerceapp/controller/myfavoriteController.dart';
import 'package:eltohmayecommerceapp/controller/orders/pendingOrdersController.dart';
import 'package:get/get.dart';

class OrdersPendingBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(PendingOrdersControllerImp()); 
  }
  
}
