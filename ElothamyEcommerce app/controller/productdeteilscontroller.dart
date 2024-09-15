import 'package:eltohmayecommerceapp/core/class/crud.dart';
import 'package:eltohmayecommerceapp/core/class/statusrequest.dart';
import 'package:eltohmayecommerceapp/core/constant/routename.dart';
import 'package:eltohmayecommerceapp/core/function/handlingdata.dart';
import 'package:eltohmayecommerceapp/data/datasource/remote/cartData.dart';
import 'package:eltohmayecommerceapp/data/model/itemsModel.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {
  increaseNumberOfProduct(int itemsid);
  decreasNumberOfProduct(int itemsId);
  GoToCart();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  late ItemsModel itemsModel;
  int NoOfProduct = 0;
  StatusRequest statusRequest = StatusRequest.loading;

  CartData cartData = CartData(crud: Crud());

  getCountItems(int itemId) async {
    statusRequest = StatusRequest.loading;
    update();
    var responce = await cartData.PostGetCountItems(itemId);
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in add to cart :  ${responce}');
      if (responce['status'] == 'Success') {
        NoOfProduct = responce['data'][0]['NumberOfItems'];
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  initalData() async {
    itemsModel = Get.arguments['itemsModel'];
    statusRequest = StatusRequest.loading;
    await getCountItems(itemsModel.itemsId!) ;
  }

  increaseNumberOfProduct(int itemsid) {
    NoOfProduct++;
    update();
    AddToCart(itemsid);
  }

  decreasNumberOfProduct(int itemsId) {
    if (NoOfProduct != 0) {
      NoOfProduct--;
      RemoveFromCart(itemsId);
    }
    update();
  }

  increaseNoOFProduct() {
    NoOfProduct++;
    update();
  }

  decreasNumberOfProducts() {
    if (NoOfProduct != 0) {
      NoOfProduct--;
      update();
    }
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.loading; 
    initalData();
    super.onInit();
  }

  RemoveFromCart(int itemId) async {
    var responce = await cartData.PostRemoveFromCart(itemId);
    update();
  }

  AddToCart(int itemsId) async {
    statusRequest = StatusRequest.loading;
    var responce = await cartData.PostAddToCart(itemsId);
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in add to cart :  ${responce}');
      if (responce['status'] == 'Success') {
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  GoToCart() {
    Get.toNamed(AppRoute.cart, arguments: {"lastPage": 1});
  }
}
