import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  late Map userinfo;
  Future<MyServices> init() async {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
          
      apiKey: '',
      appId: '',
      messagingSenderId: '',
      projectId: '',
      storageBucket: '',
    ));
    sharedPreferences = await SharedPreferences.getInstance();
    userinfo = {};
    return this;
  }
}

Future<void> initialService() async {
  await Get.putAsync(() => MyServices().init());
}
