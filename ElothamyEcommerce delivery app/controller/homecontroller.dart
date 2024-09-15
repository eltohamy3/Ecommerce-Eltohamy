import 'package:eltohamyecommercedeliveryapp/core/class/statusrequest.dart';
import 'package:eltohamyecommercedeliveryapp/core/constant/routename.dart';
import 'package:eltohamyecommercedeliveryapp/core/services/services.dart';
import 'package:eltohamyecommercedeliveryapp/data/datasource/remote/homeData.dart';
import 'package:eltohamyecommercedeliveryapp/data/model/categoriesModel.dart';
import 'package:eltohamyecommercedeliveryapp/data/model/settingsTextModel.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  logout();

}

class HomeControllerImp extends HomeController {
  late MyServices myServices;
  SettingsTextModel settingsTextModel = SettingsTextModel(settingsTitle: "" , settingsSubtitle: "") ;
  String? username;
  String itemsCategory = "Top Selling";
  late HomeData homeData;
  late StatusRequest statusRequest;

  List<CategoriesMOdel> CategoryData = [];


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
