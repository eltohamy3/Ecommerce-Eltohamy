import 'package:eltohmayecommerceapp/controller/favoriteController.dart';
import 'package:eltohmayecommerceapp/controller/itemscontroller.dart';
import 'package:eltohmayecommerceapp/controller/offerscontroller.dart';
import 'package:eltohmayecommerceapp/core/class/crud.dart';
import 'package:eltohmayecommerceapp/core/class/statusrequest.dart';
import 'package:eltohmayecommerceapp/core/constant/routename.dart';
import 'package:eltohmayecommerceapp/core/function/handlingdata.dart';
import 'package:eltohmayecommerceapp/data/datasource/remote/favoriteData.dart';
import 'package:eltohmayecommerceapp/data/model/itemsModel.dart';
import 'package:get/get.dart';

abstract class MyFavoriteController extends GetxController {
  GoToProductDetails(ItemsModel itemsModel);
  onFavoriteClose();
}

class MyFavoriteControllerImp extends MyFavoriteController {
  List<ItemsModel> ItemsListData = [];

  StatusRequest statusRequest = StatusRequest.loading;
  FavoriteData favoriteData = FavoriteData(crud: Crud());

  late int lastPage;
  // last page = 1 => itemsview
  // last page = 2 => form offers page
  // last page =0  => form home
  @override
  onFavoriteClose() async {
        Get.back();
    if (lastPage == 1) {
      ItemsControllerImp itemsControllerImp = Get.find();
      await itemsControllerImp.getData();
    } else if (lastPage == 2) {
      OffersControllerImp offersControllerImp = Get.find();
      await offersControllerImp.getData();
    }
  }

  getData() async {
    ItemsListData.clear();
    // first give it value of this
    statusRequest = StatusRequest.loading;
    update();
    var responce = await favoriteData.PostViewFavorite();
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      if (responce['status'] == 'Success') {
        print(responce);
        responce['data'].forEach((element) {
          ItemsListData.add(ItemsModel.fromJson(element));
        });
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  RemoveFromFavorite(int itemId) {
    FavoriteControllerImp favcontroller = Get.put(FavoriteControllerImp());
    favcontroller.RemoveFromFavorite(itemId);
    // var responce = favoriteData.PostRemoveFromFavorite(itemId);
    ItemsListData.removeWhere((element) => element.itemsId == itemId);
    update();
  }

  @override
  GoToProductDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoute.productDetails, arguments: {'itemsModel': itemsModel});
  }

  @override
  void onInit() async {
    lastPage = Get.arguments['lastPage'];
    await getData();
    super.onInit();
  }
}
