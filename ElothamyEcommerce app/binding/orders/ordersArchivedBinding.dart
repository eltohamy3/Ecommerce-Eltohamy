import 'package:eltohmayecommerceapp/controller/orders/archivedOrdersController.dart';
import 'package:get/get.dart';

class OrdersArchivedBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ArchivedOrderControllerImp()); 
  }
  
}
