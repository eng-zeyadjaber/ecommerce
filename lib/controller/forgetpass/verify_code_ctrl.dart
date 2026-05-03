import 'package:ecommercecourse/core/class/statusRequest.dart';
import 'package:ecommercecourse/core/function/handlingdatactrl.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/data/source/remote/auth/verfiycode.dart';
import 'package:ecommercecourse/data/source/remote/forgetpass/verifycode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyCodeController extends GetxController {
  late String type;
  String? email;
  String? verifycode;

  VerifyCodeForgetPassData verifyCodeForgetPassData = VerifyCodeForgetPassData(
    Get.find(),
  );

  StatusRequest statusRequest = StatusRequest.none;
  VerifyCodeData verfiyCodeData = VerifyCodeData(Get.find());

  List<TextEditingController> codeControllers = List.generate(
    5,
    (_) => TextEditingController(),
  );

  RxBool isButtonEnabled = false.obs;

  // ✅ التحقق من امتلاء الخانات
  void checkCode() {
    isButtonEnabled.value = codeControllers.every((c) => c.text.isNotEmpty);
  }

  // ✅ تجميع الكود
  String getCode() {
    return codeControllers.map((c) => c.text).join();
  }

  // 🔥 أهم دالة
  void submit() async {
    var response;
    String code = getCode();

    statusRequest = StatusRequest.loading;
    update();

    // 🔥 التفريق هنا
    if (type == "signup") {
      response = await verfiyCodeData.postData(email!, code, type);
    } else if (type == "forgot") {
      response = await verifyCodeForgetPassData.postData(email!, code);
    }

    print("TYPE: $type");
    print("EMAIL: $email");
    print("CODE: $code");
    print("RESPONSE: $response");

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        // 🔥 التفريق في التنقل
        if (type == "signup") {
          Get.offAllNamed(AppRoute.success, arguments: {"type": "signup"});
        } else if (type == "forgot") {
          Get.toNamed(AppRoute.resetPassword, arguments: {"email": email});
        }
      } else {
        Get.snackbar("warning".tr, "verfiycode".tr);
      }
    } else {
      Get.snackbar("error".tr, "Server error");
    }

    update();
  }

  @override
  void onInit() {
    type = Get.arguments["type"];
    email = Get.arguments["email"];
    verifycode = Get.arguments["verifycode"];

    super.onInit();
  }

  @override
  void onClose() {
    for (var c in codeControllers) {
      c.dispose();
    }
    super.onClose();
  }

  /////////////////////////////////ForgetPassword///////////////////////////////
}
