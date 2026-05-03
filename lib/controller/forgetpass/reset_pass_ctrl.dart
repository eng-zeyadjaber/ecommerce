import 'package:ecommercecourse/core/class/statusRequest.dart';
import 'package:ecommercecourse/core/function/handlingdatactrl.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/data/source/remote/forgetpass/resetpass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  late String email;

  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  RxBool isButtonEnabled = false.obs;
  StatusRequest statusRequest = StatusRequest.none;

  ResetPassForgetPassData resetPassData = ResetPassForgetPassData(Get.find());

  void checkPasswords() {
    isButtonEnabled.value =
        password.text.isNotEmpty &&
        confirmPassword.text.isNotEmpty &&
        password.text == confirmPassword.text;
  }

  // 🔥 الدالة الحقيقية
  void updatePassword() async {
    if (!isButtonEnabled.value) return;

    statusRequest = StatusRequest.loading;
    update();

    var response = await resetPassData.postData(email, password.text);

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        // ✅ هنا النجاح
        Get.offAllNamed(AppRoute.success, arguments: {"type": "reset"});
      } else {
        Get.snackbar("error".tr, "Try_again".tr);
      }
    } else {
      Get.snackbar("error".tr, "Server error");
    }

    update();
  }

  @override
  void onInit() {
    email = Get.arguments["email"]; // 🔥 مهم جدًا
    super.onInit();
  }

  @override
  void onClose() {
    password.dispose();
    confirmPassword.dispose();
    super.onClose();
  }
}
