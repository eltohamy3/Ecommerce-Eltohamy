import 'package:eltohamyecommerceadminapp/core/class/statusrequest.dart';
import 'package:eltohamyecommerceadminapp/core/constant/imageasset.dart';
import 'package:eltohamyecommerceadminapp/core/constant/routename.dart';
import 'package:eltohamyecommerceadminapp/core/services/services.dart';
import 'package:eltohamyecommerceadminapp/data/datasource/remote/homeData.dart';
import 'package:eltohamyecommerceadminapp/data/model/homeIconModel.dart';
import 'package:eltohamyecommerceadminapp/data/model/settingsTextModel.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  logout();
}
class HomeControllerImp extends HomeController {
  late MyServices myServices;
  SettingsTextModel settingsTextModel =
      SettingsTextModel(settingsTitle: "", settingsSubtitle: "");
  late HomeData homeData;
  late StatusRequest statusRequest;

  List<Homecategory> homeCategoryList = [
    Homecategory(
      title: "users",
      imageSrc: AppImageAsset.users,
      onPressed: () {
        Get.toNamed(AppRoute.usersView);
      },
    ),
    Homecategory(
      title: "Categories",
      imageSrc: AppImageAsset.categories,
      onPressed: () {
        Get.toNamed(AppRoute.categoriesView);
      },
    ),
    Homecategory(
      title: "Items",
      imageSrc: AppImageAsset.products,
      onPressed: () {
        Get.toNamed(AppRoute.itemsView);
      },
    ),
        Homecategory(
      title: "order",
      imageSrc: AppImageAsset.Orders,
      onPressed: () {
        Get.toNamed(AppRoute.OrderScreen);
      },
    ),
    Homecategory(
      title: "Delevery",
      imageSrc: AppImageAsset.delivery,
      onPressed: () {
        Get.toNamed(AppRoute.deliveryView);
      },
    ),
    Homecategory(
      title: "Coupon",
      imageSrc: AppImageAsset.coupone,
      onPressed: () {
        Get.toNamed(AppRoute.couponView);
      },
    ),
    Homecategory(
      title: "Setting",
      imageSrc: AppImageAsset.setting,
      onPressed: () {
        Get.toNamed(AppRoute.settingTextEdit);
      },
    ),
    Homecategory(
      title: "Massages",
      imageSrc: AppImageAsset.massages,
      onPressed: () {},
    ),
    Homecategory(
      title: "Notification",
      imageSrc: AppImageAsset.notification,
      onPressed: () {},
    ),
  ];
  logout() async {
    await myServices.sharedPreferences.setString('step', '1');
    Get.offAllNamed(AppRoute.login);
  }

  initialData() async {
    myServices = Get.find();
  }

  @override
  void onInit() async {
    await initialData();
    super.onInit();
  }
}
