import 'package:ecommercecourse/core/class/statusRequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/function/handlingdatactrl.dart';
import 'package:ecommercecourse/data/source/remote/auth/signup.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToLogin();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController phone;
  late TextEditingController email;
  late TextEditingController password;
  StatusRequest statusRequest = StatusRequest.none;
  SignupData signupData = SignupData(Get.find());
  List<Map<String, dynamic>> data = [];
  @override
  void signUp() async {
    // var formdata = formstate.currentState;

    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postData(
        username.text,
        password.text,
        email.text,
        phone.text,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          String code = response['verfiycode'].toString();
          Get.toNamed(
            AppRoute.verifyCode,
            arguments: {
              "type": "signup",
              "email": email.text,
              "verifycode": code,
            },
          );
        } else {
          Get.snackbar("warning".tr, "signup_exists".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      Get.snackbar("error".tr, "login_error".tr);
    }
  }

  @override
  goToLogin() {
    Get.offNamed(AppRoute.login);
  }
  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    username.dispose();
    phone.dispose();
    email.dispose();
    password.dispose();
    super.onClose();
  }
}
