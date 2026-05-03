import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommercecourse/core/class/statusRequest.dart';
import 'package:ecommercecourse/core/function/checkinternet.dart';
import 'package:http/http.dart' as http;

class CRUD {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfalure);
        }
      } else {
        return const Left(StatusRequest.offlinefilure);
      }
    } catch (_) {
      return Left(StatusRequest.serverException);
    }
  }
}
