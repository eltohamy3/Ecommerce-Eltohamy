import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/core/class/statusrequest.dart';
import 'package:eltohamyecommerceadminapp/core/function/alertexitapp.dart';
import 'package:eltohamyecommerceadminapp/core/function/handlingdata.dart';
import 'package:eltohamyecommerceadminapp/data/datasource/remote/test_data.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  late Crud crud;
  late TestData testData; // get the data form database

  List data = [];

  late StatusRequest statusRequest;

  getData() async {
    // first give it value of this
    statusRequest = StatusRequest.loading;
    var responce = await testData.getData();
    statusRequest = handleData(responce);
    if (statusRequest == StatusRequest.success) {
      // print(responce);
      // the code works very good and the responce is map
      // print(responce['data']);
      if (responce['status'] == 'Success')
      {
          data.addAll(responce['data']);
      }else{
        statusRequest = StatusRequest.failure; 
      }
      


      // data.addAll(responce);
      // responce statues => true or false  and data => it is an array
    }
          update();
  }
  showDIalog()
  {
              showErrorMassage(Get.context!, "SignUP", 'message');

  }
  @override
  void onInit()  async{
    crud = Get.find();
    testData = TestData(crud: crud);
     await getData();
    super.onInit();
  }
}
