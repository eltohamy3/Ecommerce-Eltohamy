import 'package:eltohamyecommerceadminapp/core/class/statusrequest.dart';

handleData(responce) {
  if (responce is StatusRequest) {
    // it is requst
     return responce; 
  } else {
    // it is map so the process completed with true
    return StatusRequest.success;
  }
}
