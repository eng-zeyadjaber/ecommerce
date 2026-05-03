import 'package:ecommercecourse/core/class/statusRequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/function/handlingdatactrl.dart';
import 'package:ecommercecourse/data/source/remote/forgetpass/checkemail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  CheckEmailForgetPassData checkEmailForgetPassData = CheckEmailForgetPassData(
    Get.find(),
  );

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  StatusRequest statusRequest = StatusRequest.none;

  RxBool isButtonEnabled = false.obs;

  void checkInput(String val) {
    RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');

    isButtonEnabled.value = emailRegex.hasMatch(val);
  }

  void checkEmail() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailForgetPassData.postData(email.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.toNamed(
            AppRoute.verifyCode,
            arguments: {"type": "forgot", "email": email.text},
          );
        } else {
          Get.snackbar("warning".tr, "email_exist".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    super.onClose();
  }
}
