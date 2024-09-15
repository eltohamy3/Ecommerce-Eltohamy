import 'package:eltohmayecommerceapp/controller/favoriteController.dart';
import 'package:eltohmayecommerceapp/controller/itemscontroller.dart';
import 'package:get/get.dart';

class ItemsBinding extends Bindings {
  @override
  void dependencies() {
    print('in the items Controller binding');
    Get.put(ItemsControllerImp());
    Get.put(FavoriteControllerImp() );
  }
}
