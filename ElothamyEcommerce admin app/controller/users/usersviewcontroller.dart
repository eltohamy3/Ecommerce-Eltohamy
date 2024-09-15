import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/core/class/statusrequest.dart';
import 'package:eltohamyecommerceadminapp/core/constant/routename.dart';
import 'package:eltohamyecommerceadminapp/core/function/alertexitapp.dart';
import 'package:eltohamyecommerceadminapp/core/function/handlingdata.dart';
import 'package:eltohamyecommerceadminapp/data/datasource/remote/userData.dart';
import 'package:eltohamyecommerceadminapp/data/model/userModel.dart';
import 'package:get/get.dart';

abstract class UserControllerView extends GetxController {
  GetData();
  DeleteUserButton(int userid);
  DeleteUser(int userId);
  GoToUsersOrders(UserModel userModel);
}

class UserControllerViewImp extends UserControllerView {
  UserData userData = UserData(crud: Crud());
  List<UserModel> UsersViewList = [];
  late StatusRequest statusRequest;
  
  @override
  GetData() async {
    UsersViewList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var responce = await userData.PostUsersView();
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in Items view :  ${responce}');
      if (responce['status'] == 'Success') {
        if (responce['data'] != null) {
          responce['data'].forEach((element) {
            UsersViewList.add(UserModel.fromJson(element));
          });
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  @override
  DeleteUserButton(int userid) {
    showHazardMassage(
        Get.context!, "User Delete", "Are you sure to Delete This User",
        () async {
      await DeleteUser(userid);
    }, "Ok");
  }
  @override
  DeleteUser(int userId) async {
    statusRequest = StatusRequest.loading;
    update();
    var responce = await userData.postDeleteUser(userId);
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      print('Responce in Delet user view :  ${responce}');
      if (responce['status'] == 'Success') {
        showSuccessMassageWithOk(
          Get.context!,
          "Delete User",
          "User Has been Deleted successfully",
          () {},
          "Ok",
          (p0) async {
            UsersViewList.removeWhere((element) => element.userId == userId);
            update();
          },
        );
      } else {
        showErrorMassage(Get.context!, "Delete User",
            "Server Error while Deleting the user");
        statusRequest = StatusRequest.success;
      }
    } else {
      showErrorMassage(
          Get.context!, "Delete User", " Error while Deleting the User");
      statusRequest = StatusRequest.success;
    }
    update();
  }

  @override
  void onInit() async {
    statusRequest = StatusRequest.loading;
    update();
    await GetData();
    super.onInit();
  }

  @override
  GoToUsersOrders(UserModel userModel) {
    Get.toNamed(AppRoute.userOrders , 
    arguments: {
      "userModel":userModel
    }
    );
  }
}
