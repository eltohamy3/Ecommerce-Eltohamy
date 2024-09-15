import 'package:eltohmayecommerceapp/controller/myfavoriteController.dart';
import 'package:get/get.dart';

class MyFavoriteBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(MyFavoriteControllerImp()); 
  }
  
}
