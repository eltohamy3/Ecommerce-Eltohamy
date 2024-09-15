import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/core/class/statusrequest.dart';
import 'package:eltohamyecommerceadminapp/core/function/alertexitapp.dart';
import 'package:eltohamyecommerceadminapp/core/function/handlingdata.dart';
import 'package:eltohamyecommerceadminapp/data/datasource/remote/itemData.dart';
import 'package:eltohamyecommerceadminapp/data/model/ItemsModel.dart';
import 'package:get/get.dart';

abstract class ItemsViewController extends GetxController {}

class myItemsViewControllerImp extends ItemsViewController {
  List<ItemsModel> ItemsList = [];
  ItemData itemsData = ItemData(crud: Crud());
  late StatusRequest statusRequest;

  Deletitems(ItemsModel ItemsMOdel) async {
    statusRequest = StatusRequest.loading;
    update();
    var responce = await itemsData.Postdeleteitems(
        ItemsMOdel.itemsId!, ItemsMOdel.itemsImage!);
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in Delet items view :  ${responce}');
      if (responce['status'] == 'Success') {
        showSuccessMassageWithOk(
          Get.context!,
          "Delete Item",
          "Item was Deleted successfully",
          () {},
          "Ok",
          (p0) async {
            ItemsList.removeWhere(
                (element) => element.itemsId == ItemsMOdel.itemsId);
            update();
          },
        );
      } else {
        showErrorMassage(Get.context!, "Delete item",
            "Server Error while Deleting the item");
        statusRequest = StatusRequest.success;
      }
    } else {
      showErrorMassage(Get.context!, "Delete item",
          " Error while Deleting the item");
      statusRequest = StatusRequest.success;
    }
    update();
  }

  Deleteitemsbutton(ItemsModel ItemsMOdel) {
    showHazardMassage(
        Get.context!, "Items Delete", "Are you sure to Delete This item",
        () async {
      await Deletitems(ItemsMOdel);
    }, "Ok");
  }

  GetItemsData() async {
    ItemsList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var responce = await itemsData.Postviewitems();
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in Items view :  ${responce}');
      if (responce['status'] == 'Success') {
        if (responce['data'] != null) {
          responce['data'].forEach((element) {
            ItemsList.add(ItemsModel.fromJson(element));
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
    await GetItemsData();
    super.onInit();
  }
}
