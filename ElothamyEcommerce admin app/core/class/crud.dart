import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:eltohamyecommerceadminapp/core/class/statusrequest.dart';
import 'package:eltohamyecommerceadminapp/core/function/checkInternet.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

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
        print("${responce.toString()}" );
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

  Future<Either<StatusRequest, Map<String, dynamic>>>
      postGetdataRequestWithImage(
          String url, Map data, File myfile, String fileRequestname) async {
    await Future.delayed(Duration(milliseconds: 700));
    print("${data}");
    try {
      if (await checkInternet()) {
        var request = http.MultipartRequest("POST", Uri.parse(url));
        var length = await myfile.length(); // length of the file in bytes
        var streem = http.ByteStream(myfile.openRead());
        var MultipartFile = http.MultipartFile(fileRequestname, streem, length,
            filename: basename(myfile.path));
        request.files.add(MultipartFile); // uploud the file

        // request.headers.addAll(myheaders);

        data.forEach((key, value) {
          request.fields[key] = value;
        }); // add all element to the request
        var myrequst = await request.send();
        var responce = await http.Response.fromStream(myrequst);
        if (myrequst.statusCode == 200 || myrequst.statusCode == 201) {
          print(responce.body + " ---------------------");

          return Right(jsonDecode(responce.body));
        } else {
          print('Error ${myrequst.statusCode}');
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
