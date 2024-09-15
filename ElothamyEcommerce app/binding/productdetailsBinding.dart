import 'package:eltohmayecommerceapp/controller/productdeteilscontroller.dart';
import 'package:get/get.dart';

class ProductDetailsBinding extends Bindings {
  @override
  void dependencies() {
    print('in the ProductDetailsBinding');
    Get.put(ProductDetailsControllerImp());
  }
}
