import 'package:eltohmayecommerceapp/controller/homecontroller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    print('in the home binding');
    Get.put(HomeControllerImp());
  }
}
