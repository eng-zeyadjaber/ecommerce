import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {
  int? get priority => 1;
  MyServices myServices = Get.find();
  RouteSettings? redirect(String? route) {
  String? step = myServices.sharedPreferences.getString("step");

  print("STEP: $step");

  if (step == "2" && route != AppRoute.homepage) {
    return const RouteSettings(name: AppRoute.homepage);
  }

  if (step == "1" && route != AppRoute.login) {
    return const RouteSettings(name: AppRoute.login);
  }

  if (step == null && route != AppRoute.onBoarding) {
    return const RouteSettings(name: AppRoute.onBoarding);
  }

  return null;
}
}
