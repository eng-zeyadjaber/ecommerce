import 'package:ecommercecourse/core/class/statusRequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/function/handlingdatactrl.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/source/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgotPassword();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await loginData.postData(password.text, email.text);
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          await myServices.sharedPreferences.setString(
            "id",
            response['data']['users_id'].toString(),
          );

          await myServices.sharedPreferences.setString(
            "username",
            response['data']['users_name'],
          );

          await myServices.sharedPreferences.setString(
            "email",
            response['data']['users_email'],
          );

          await myServices.sharedPreferences.setString(
            "phone",
            response['data']['users_phone'],
          );

          await myServices.sharedPreferences.setString("step", "2");

          Get.offAllNamed(AppRoute.homepage);
        } else {
          Get.snackbar("warning".tr, "login_exists".tr);
          statusRequest = StatusRequest.failure;
        }
      }

      update();
    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signup);
  }

  @override
  goToForgotPassword() {
    Get.toNamed(AppRoute.forgotPassword);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print("///////////////////////HERE/////////////////////////");
      print(value);
      print("/////////////////////////HERE///////////////////////");
      String? token = value;
    });

    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}
