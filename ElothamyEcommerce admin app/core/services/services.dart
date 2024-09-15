import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  late Map userinfo;
  Future<MyServices> init() async {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: 'AIzaSyCpyRghOTef30iptx8dJ23P6P2wj7j_0bY',
      appId: '1:914760570947:android:86547fe8358893b5f91cf6',
      messagingSenderId: '165632447741',
      projectId: 'eltohamyecommerce',
      storageBucket: 'eltohamyecommerce.appspot.com',
    ));
    sharedPreferences = await SharedPreferences.getInstance();
    userinfo = {};
    return this;
  }
}

Future<void> initialService() async {
  await Get.putAsync(() => MyServices().init());
}
