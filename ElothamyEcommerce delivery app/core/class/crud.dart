import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:eltohamyecommercedeliveryapp/core/class/statusrequest.dart';
import 'package:eltohamyecommercedeliveryapp/core/function/checkInternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  // Either for returing more than one
  Future<Either<StatusRequest, Map>> PostGetDataRequest(
      String pageLink, Map data) async {
    await Future.delayed(Duration(milliseconds: 700));
    try {
      if (await checkInternet()) {
        print('hear');
        var responce = await http.post(Uri.parse(pageLink), body: data);
        print('outfrom hear');
        print(responce); 
        if (responce.statusCode == 200 || responce.statusCode == 201) {
          Map responcebody = jsonDecode(responce.body);
          print(responcebody);
          return Right(responcebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (e) {
      print(e);
      // print('error');
      return const Left(StatusRequest.serverfailure);
    }
  }
}
