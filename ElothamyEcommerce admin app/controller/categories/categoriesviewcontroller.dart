import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/core/class/statusrequest.dart';
import 'package:eltohamyecommerceadminapp/core/function/alertexitapp.dart';
import 'package:eltohamyecommerceadminapp/core/function/handlingdata.dart';
import 'package:eltohamyecommerceadminapp/data/datasource/remote/categoriesData.dart';
import 'package:eltohamyecommerceadminapp/data/model/categoriesModel.dart';
import 'package:get/get.dart';

abstract class CategoriesViewController extends GetxController {}

class CategoriesViewControllerImp extends CategoriesViewController {
  List<CategoriesMOdel> categoriesList = [];
  CategoriesData categoriesData = CategoriesData(crud: Crud());
  late StatusRequest statusRequest;

  Deletcat(CategoriesMOdel categoriesMOdel) async {
    
    statusRequest = StatusRequest.loading;
    update();
    var responce = await categoriesData.PostdeleteCategories(
        categoriesMOdel.categoriesId!, categoriesMOdel.categoriesImage!);
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in Delet Cat view :  ${responce}');
      if (responce['status'] == 'Success') {
        showSuccessMassageWithOk(
          Get.context!,
          "Delete Categores",
          "Categores was Deleted successfully",
          () {},
          "Ok",
          (p0) async {
            categoriesList.removeWhere((element) =>
                element.categoriesId == categoriesMOdel.categoriesId);
            update();
          },
        );
      } else {
        showErrorMassage(Get.context!, "Delete Categores",
            "Server Error while Deleting the Categores");
        statusRequest = StatusRequest.success;
      }
    } else {
      showErrorMassage(Get.context!, "Delete Categores",
          " Error while Deleting the Categores");
      statusRequest = StatusRequest.success;
    }
    update();
  }

  DeleteCategoesbutton(CategoriesMOdel categoriesMOdel) {
    showHazardMassage(Get.context!, "Categories Edit",
        "Are you sure to Delete This Categorie", () async {
      await Deletcat(categoriesMOdel);
    }, "Ok");
  }

  GetCategoriesData() async {
    categoriesList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var responce = await categoriesData.PostviewCategories();
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in categotres view :  ${responce}');
      if (responce['status'] == 'Success') {
        if (responce['data'] != null) {
              categoriesList.clear();
          responce['data'].forEach((element) {
            categoriesList.add(CategoriesMOdel.fromJson(element));
          });
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() async {
    statusRequest = StatusRequest.loading;
    await GetCategoriesData();
    print('in the cat controller view'); 
    super.onInit();
  }
}
