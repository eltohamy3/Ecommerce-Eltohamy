import 'package:eltohmayecommerceapp/controller/itemscontroller.dart';
import 'package:eltohmayecommerceapp/core/class/crud.dart';
import 'package:eltohmayecommerceapp/data/datasource/remote/favoriteData.dart';
import 'package:get/get.dart';

abstract class FavoriteController extends GetxController {
  addToFavorite(int itemId);
  ChangFavorite(int itemId);
  RemoveFromFavorite(int itemId);
}

class FavoriteControllerImp extends FavoriteController {
  FavoriteData favoriteData = FavoriteData(crud: Crud());
  Map<int, int> isFavorite = {};

  // key => value
  // itemid => favorite(0 or 1)


  inializeIsFavorite(int itemId, int isfav) {
    isFavorite[itemId] = isfav;
  }

  @override
  addToFavorite(int itemId) async {
    var responce = await favoriteData.PostAddToFavorite(itemId);
    print(responce);
  }

  @override
  RemoveFromFavorite(int itemId) async {
    var responce = await favoriteData.PostRemoveFromFavorite(itemId);
    print(responce);
  }

  ChangFavorite(int itemId) {
    isFavorite[itemId] = 1 - isFavorite[itemId]!;
    if (isFavorite[itemId] == 1) {
      addToFavorite(itemId);
    } else {
      RemoveFromFavorite(itemId);
    }
    update();
  }

  @override
  void onInit() {

    super.onInit();
  }
}
