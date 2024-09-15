import 'dart:io';

checkInternet() async {
  try {
    return true ; 
    // var result = await InternetAddress.lookup('google.com'); // return list
    // if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    //   return true;
    // }
  } on SocketException catch (e) {
    return false;
  } catch (e) {
    return false;
  }
}
