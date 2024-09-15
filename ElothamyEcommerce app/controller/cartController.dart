import 'package:eltohmayecommerceapp/controller/productdeteilscontroller.dart';
import 'package:eltohmayecommerceapp/core/class/crud.dart';
import 'package:eltohmayecommerceapp/core/class/statusrequest.dart';
import 'package:eltohmayecommerceapp/core/constant/routename.dart';
import 'package:eltohmayecommerceapp/core/function/alertexitapp.dart';
import 'package:eltohmayecommerceapp/core/function/handlingdata.dart';
import 'package:eltohmayecommerceapp/data/datasource/remote/cartData.dart';
import 'package:eltohmayecommerceapp/data/model/cartModel.dart';
import 'package:eltohmayecommerceapp/data/model/couponModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController {
  updateTotalPrice();
  checkCoupon();
  getCountItems(int itemId);
  onadd(int itmesId);
  UpdatCart();
  onRemove(int ItemsId);
  goToCheckOut();
  viewCartData();
  onCartClose();
}

class CartControllerImp extends CartController {
  CouponModel? couponDetails;

  CartData cartData = CartData(crud: Crud());
  List<CartModel> ItemsListData = [];
  int NumberOfItems = 0;
  double totalPriceOrder = 0.0;
  int totalCountItems = 0;
  double deliveryPrice = 0;
  double FinalTOtalPrice = 0.0;
  // copon data
  int discountCoupon = 0;
  String? couponName;

  late int lastPage;
  // last page = 1 => product details
  // last page =0  => form home
  @override
  onCartClose() async {
                      Get.back();
    if (lastPage == 1) {
      ProductDetailsControllerImp productDetailsControllerImp = Get.find();
      await productDetailsControllerImp
          .getCountItems(productDetailsControllerImp.itemsModel.itemsId!);
    }

  }

  GlobalKey<FormState> couponFormKey = GlobalKey();
  TextEditingController couponController = TextEditingController();
  StatusRequest statusRequest = StatusRequest.loading;
  RemoveFromCart(int itemId) async {
    var responce = await cartData.PostRemoveFromCart(itemId);
    ItemsListData.removeWhere(
      (element) => element.itemsId == itemId,
    );

    update();
  }

  updateTotalPrice() {
    FinalTOtalPrice =
        totalPriceOrder - (totalPriceOrder * 1.0 * discountCoupon / 100);
  }

  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    var responce = await cartData.PostCheckCoupon(couponController.text);
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in check Coupon :  ${responce}');
      if (responce['status'] == 'Success') {
        couponDetails = CouponModel.fromJson(responce['data'][0]);
        discountCoupon = couponDetails!.couponDiscount!;
        couponName = couponDetails!.couponName;
        couponController.text = "";
        updateTotalPrice();
      } else {
        showErrorMassage(
            Get.context!, "Coupon", "Your coupon is unCorrect or was ended");
        statusRequest = StatusRequest.success;
      }
    } else {
      showErrorMassage(
          Get.context!, "server", "error while trying to apply the coupon");
      statusRequest = StatusRequest.success;
    }
    couponController.text = "";

    update();
  }

  applyCoupon() async {
    if (couponController.text != "") {
      await checkCoupon();
    }
  }

  AddToCart(int itemsId) async {
    statusRequest = StatusRequest.loading;
    var responce = await cartData.PostAddToCart(itemsId);
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in add to cart :  ${responce}');
      if (responce['status'] == 'Success') {
        // ItemsListData.add(itemsModel);
        // Get.rawSnackbar(
        //     title: "Note",
        //     duration: Duration(milliseconds: 500),

        //     messageText:  Text('Added to cart sucsessfuly' , style: TextStyle(color: AppColor.white),));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getCountItems(int itemId) async {
    statusRequest = StatusRequest.loading;
    var responce = await cartData.PostGetCountItems(itemId);
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in add to cart :  ${responce}');
      if (responce['status'] == 'Success') {
        NumberOfItems = responce['data'][0]['NumberOfItems'];
        return NumberOfItems;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  onadd(int itmesId) async {
    statusRequest = StatusRequest.loading;
    update();
    var responce = await cartData.PostAddToCart(itmesId);
    UpdatCart();
  }

  onRemove(int ItemsId) async {
    statusRequest = StatusRequest.loading;
    update();
    var responce = await cartData.PostRemoveFromCart(ItemsId);
    UpdatCart();
  }

  UpdatCart() async {
    totalCountItems = 0;
    totalPriceOrder = 0;
    discountCoupon = 0;
    FinalTOtalPrice = 0;
    couponName = null;
    viewCartData();
  }

  goToCheckOut() {
    if (ItemsListData.length > 0) {
      Get.toNamed(AppRoute.checkOutPage, arguments: {
        "price": totalPriceOrder,
        "couponDetails": couponDetails,
        "deliveryPrice": deliveryPrice,
        "discountCoupon": discountCoupon
      });
    } else {
      showErrorMassage(Get.context!, "Cart",
          "you should order at least one iteme order items");
    }
  }

  viewCartData() async {
    ItemsListData.clear();
    // first give it value of this
    statusRequest = StatusRequest.loading;
    update();
    var responce = await cartData.PostViewCart();
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      if (responce['status'] == 'Success') {
        print(responce);
        if (responce['data']['data'] != null) {
          responce['data']['data'].forEach((element) {
            ItemsListData.add(CartModel.fromJson(element));
          });
        }

        totalPriceOrder =
            1.0 * responce['data']['priceAndCount'][0]['TotalPrice'];

        totalCountItems =
            responce['data']['priceAndCount'][0]['NumberOfItmesInCart'];
        updateTotalPrice();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() async {
    lastPage = Get.arguments['lastPage'];
    await viewCartData();
    super.onInit();
  }
}
